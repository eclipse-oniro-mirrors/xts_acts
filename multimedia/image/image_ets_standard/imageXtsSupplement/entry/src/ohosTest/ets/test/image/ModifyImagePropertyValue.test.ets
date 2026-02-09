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

import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import { JSON } from '@kit.ArkTS';

const TAG = 'xts.ModifyImagePropertyValueSuppTest';

async function modifyImagePropertyTestOne(done: Function, testName: string, pathUri: string,
  key: image.PropertyKey, value: string, callback: (err: number) => void) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let path = `file://${testContext.filesDir}/${pathUri}`;
    let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
    let imageSource: image.ImageSource = image.createImageSource(file.fd);
    console.info(TAG, testName, ' createImageSource success ')
    await imageSource.modifyImageProperty(key, value);
    console.info(TAG, testName, ' modifyImageProperty success ');
    expect().assertFail();
    done();
  } catch (error) {
    console.error(TAG, testName, ` modifyImageProperty failed; error: `, JSON.stringify(error),
      error.code);
    callback(error.code);
    done();
  }
}

async function modifyImagePropertyTestOnes(done: Function, testName: string, pathUri: string,
  key: image.PropertyKey, value: string, callback: (err: string) => void) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let path = `file://${testContext.filesDir}/${pathUri}`;
    let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
    let imageSource: image.ImageSource = image.createImageSource(file.fd);
    console.info(TAG, testName, ' createImageSource success ')
    await imageSource.modifyImageProperty(key, value);
    console.info(TAG, testName, ' modifyImageProperty success ');
    let data = imageSource.getImagePropertySync(key);
    callback(data);
    done();
  } catch (error) {
    console.error(TAG, testName, ` modifyImageProperty failed; error: `, JSON.stringify(error),
      error.code);
    expect().assertFail();
    done();
  }
}

export default function modifyImagePropertyValueTest() {
  describe('modifyImagePropertyValueTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
    });
    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });
    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });
    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00001
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00001
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00001';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SUBFILE_TYPE;
      let value: string = '1';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00003
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00003
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00003';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.ISO_SPEED_LATITUDE_ZZZ;
      let value: string = '1';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00004
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00004
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00004';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.PITCH_ANGLE;
      let value: string = '1';
      await modifyImagePropertyTestOne(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00005
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00005
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00005';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SCENE_NIGHT_CONF;
      let value: string = '1';
      await modifyImagePropertyTestOne(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00007
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00007
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00007';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.CUSTOM_RENDERED;
      let value: string = '1';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Custom process')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00008
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00008
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00008';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FACE_CONF;
      let value: string = '1';
      await modifyImagePropertyTestOne(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00009
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00009
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00009', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00009';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SUBSEC_TIME;
      let value: string = '629000';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('629000')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00010
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00010
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00010';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.COMPRESSED_BITS_PER_PIXEL;
      let value: string = '0.95';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('0.95')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00011
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00011
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00011', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00011';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.CAPTURE_MODE;
      let value: string = '1';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00012
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00012
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00012', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00012';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.IMAGE_WIDTH;
      let value: string = '4096';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('4096')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00013
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00013
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00013', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00013';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.RECOMMENDED_EXPOSURE_INDEX;
      let value: string = '3200';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('3200')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00014
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00014
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00014', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00014';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SUBSEC_TIME_ORIGINAL;
      let value: string = '629000';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('629000')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00015
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00015
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00015', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00015';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FRONT_CAMERA;
      let value: string = '1';
      await modifyImagePropertyTestOne(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00016
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00016
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00016', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00016';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_DEST_DISTANCE_REF;
      let value: string = 'K';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('K')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00017
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00017
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00017', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00017';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.IMAGE_LENGTH;
      let value: string = '3072';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('3072')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00018
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00018
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00018', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00018';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.BURST_NUMBER;
      let value: string = '1';
      await modifyImagePropertyTestOne(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00020
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00020
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00020', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00020';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_DEST_BEARING;
      let value: string = '120';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('120')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00022
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00022
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00022', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00022';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.EXPOSURE_TIME;
      let value: string = '1/2';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('0.5 sec.')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00023
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00023
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00023', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00023';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.LENS_SERIAL_NUMBER;
      let value: string = 'Lens Serial Number';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Lens Serial Number')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00024
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00024
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00024', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00024';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.XMAGE_MODE;
      let value: string = '1';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00025
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00025
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00025', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00025';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.XMAGE_BOTTOM;
      let value: string = '1';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00026
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00026
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00026', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00026';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FOCAL_PLANE_RESOLUTION_UNIT;
      let value: string = '2';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Inch')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00027
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00027
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00027', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00027';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SUBSEC_TIME_DIGITIZED;
      let value: string = '62900';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('62900')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00028
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00028
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00028', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00028';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.PHOTO_MODE;
      let value: string = '1';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00029
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00029
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00029', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00029';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.ISO_SPEED_LATITUDE_YYY;
      let value: string = '3200';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('3200')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00030
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00030
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00030', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00030';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.ISO_SPEED;
      let value: string = '3200';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('3200')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00031
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00031
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00031', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00031';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.LIGHT_SOURCE;
      let value: string = '1';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Daylight')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00032
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00032
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00032', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00032';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FOCUS_MODE;
      let value: string = '1';
      await modifyImagePropertyTestOne(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00033
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00033
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00033', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00033';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.YCBCR_POSITIONING;
      let value: string = '1';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Centered')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00034
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00034
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00034', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00034';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FACE_VERSION;
      let value: string = '1';
      await modifyImagePropertyTestOne(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00035
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00035
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00035', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00035';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_PROCESSING_METHOD;
      let value: string = 'GPS Processing Method';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('GPS Processing Method')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00037
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00037
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00037', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00037';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_AREA_INFORMATION;
      let value: string = 'GPS Area Information';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('GPS Area Information')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00038
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00038
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00038', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00038';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.LENS_MODEL;
      let value: string = 'Lens Model';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Lens Model')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00040
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00040
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00040', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00040';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_DATE_STAMP;
      let value: string = '2020:07:07';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('2020:07:07')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00041
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00041
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00041', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00041';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FACE_RECT;
      let value: string = '1';
      await modifyImagePropertyTestOne(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00042
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00042
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00042', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00042';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.COMPONENTS_CONFIGURATION;
      let value: string = 'Y Cb Cr -';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Y Cb Cr -')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00043
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00043
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00043', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00043';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.COLOR_SPACE;
      let value: string = '1';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('sRGB')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00044
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00044
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00044', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00044';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.DATE_TIME;
      let value: string = '2024:07:07 13:45:59';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('2024:07:07 13:45:59')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00045
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00045
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00045', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00045';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FLASH;
      let value: string = '1';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Flash fired')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00046
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00046
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00046', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00046';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_H_POSITIONING_ERROR;
      let value: string = '100';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('100')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00047
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00047
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00047', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00047';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.MODEL;
      let value: string = 'Model';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Model')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00048
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00048
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00048', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00048';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SCENE_SUNSET_CONF;
      let value: string = '1';
      await modifyImagePropertyTestOne(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00049
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00049
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00049', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00049';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FOCAL_PLANE_X_RESOLUTION;
      let value: string = '500';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('500')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00050
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00050
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00050', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00050';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FLASHPIX_VERSION;
      let value: string = '1.0';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('FlashPix Version 1.0')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00051
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00051
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00051', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00051';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SCENE_GREEN_PLANT_CONF;
      let value: string = '1';
      await modifyImagePropertyTestOne(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00052
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00052
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00052', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00052';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SUBJECT_DISTANCE;
      let value: string = '1';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('1.0 m')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00053
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00053
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00053', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00053';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_DIFFERENTIAL;
      let value: string = '0';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('0')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00054
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00054
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00054', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00054';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.YCBCR_COEFFICIENTS;
      let value: string = '0.299, 0.587, 0.114';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('0.299, 0.587, 0.114')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00055
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00055
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00055', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00055';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.PIXEL_Y_DIMENSION;
      let value: string = '3072';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('3072')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00056
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00056
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00056', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00056';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.EXPOSURE_INDEX;
      let value: string = '3200';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('3200')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00057
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00057
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00057', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00057';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.CLOUD_ENHANCEMENT_MODE;
      let value: string = '1';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00058
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00058
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00058', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00058';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.BRIGHTNESS_VALUE;
      let value: string = '2';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('2.00 EV (13.71 cd/m^2)')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00060
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00060
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00060', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00060';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FACE_SMILE_SCORE;
      let value: string = '1';
      await modifyImagePropertyTestOne(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00061
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00061
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00061', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00061';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_VERSION_ID;
      let value: string = '2.3.0.0';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('2.3.0.0')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00062
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00062
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00062', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00062';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_LONGITUDE_REF;
      let value: string = '69';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('69')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00063
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00063
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00063', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00063';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.EXPOSURE_PROGRAM;
      let value: string = '1';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Manual')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00064
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00064
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00064', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00064';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SENSITIVITY_TYPE;
      let value: string = '1';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Standard output sensitivity (SOS)')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00065
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00065
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00065', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00065';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.DATE_TIME_DIGITIZED;
      let value: string = '2024:07:07 13:45:59';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('2024:07:07 13:45:59')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00066
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00066
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00066', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00066';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.EXPOSURE_MODE;
      let value: string = '0';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Auto exposure')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00067
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00067
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00067', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00067';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.MAX_APERTURE_VALUE;
      let value: string = '1';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('1.00 EV (f/1.4)')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00068
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00068
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00068', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00068';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.DEVICE_SETTING_DESCRIPTION;
      let value: string = 'Device Setting Description';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Device Setting Description')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00069
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00069
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00069', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00069';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.BODY_SERIAL_NUMBER;
      let value: string = 'Body Serial Number"';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Body Serial Number"')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00070
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00070
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00070', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00070';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.IMAGE_DESCRIPTION;
      let value: string = 'Image description info';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Image description info')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00071
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00071
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00071', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00071';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.EXIF_VERSION;
      let value: string = '2.3';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Exif Version 2.3')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00072
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00072
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00072', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00072';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SAMPLES_PER_PIXEL;
      let value: string = '3';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('3')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00073
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00073
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00073', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00073';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.STRIP_BYTE_COUNTS;
      let value: string = '1024';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('1024')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00074
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00074
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00074', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00074';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_MAP_DATUM;
      let value: string = 'GPS Map Datum';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('GPS Map Datum')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00075
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00075
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00075', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00075';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.ARTIST;
      let value: string = 'User name';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('User name')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00076
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00076
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00076', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00076';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.IS_XMAGE_SUPPORTED;
      let value: string = '1';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00077
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00077
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00077', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00077';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SHUTTER_SPEED;
      let value: string = '1';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('1.00 EV (1/2 sec.)')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00078
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00078
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00078', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00078';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.MAKE;
      let value: string = 'MAKE';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('MAKE')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00079
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00079
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00079', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00079';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_TRACK;
      let value: string = '180';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('180')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00081
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00081
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00081', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00081';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.OFFSET_TIME_ORIGINAL;
      let value: string = 'Offset Time Original';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Offset Time Original')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00082
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00082
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00082', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00082';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_LATITUDE_REF;
      let value: string = '78';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('78')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00083
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00083
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00083', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00083';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SCENE_FOOD_CONF;
      let value: string = '1';
      await modifyImagePropertyTestOne(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00084
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00084
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00084', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00084';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_STATUS;
      let value: string = 'A';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('A')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00086
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00086
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00086', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00086';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FACE_LEYE_CENTER;
      let value: string = '1';
      await modifyImagePropertyTestOne(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00087
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00087
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00087', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00087';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FACE_COUNT;
      let value: string = '1';
      await modifyImagePropertyTestOne(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00088
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00088
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00088', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00088';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_DEST_DISTANCE;
      let value: string = '100';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('100')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00089
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00089
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00089', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00089';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FOCAL_LENGTH;
      let value: string = '50';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('50.0 mm')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00090
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00090
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00090', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00090';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_DEST_LONGITUDE_REF;
      let value: string = '69';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('69')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00091
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00091
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00091', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00091';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FILE_SOURCE;
      let value: string = 'DSC';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('DSC')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00092
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00092
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00092', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00092';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_DEST_BEARING_REF;
      let value: string = 'T';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('T')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00093
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00093
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00093', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00093';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SHARPNESS;
      let value: string = '0';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Normal')
      });
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00094
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00094
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00094', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00094';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FOCAL_LENGTH_IN_35_MM_FILM;
      let value: string = '50';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('50')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00095
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00095
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00095', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00095';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.RESOLUTION_UNIT;
      let value: string = '2';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Inch')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00096
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00096
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00096', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00096';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.LENS_MAKE;
      let value: string = '"Lens Make';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('"Lens Make')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00098
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00098
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00098', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00098';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SENSING_METHOD;
      let value: string = '2';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('One-chip color area sensor')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00099
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00099
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00099', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00099';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SCENE_TEXT_CONF;
      let value: string = '1';
      await modifyImagePropertyTestOne(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00100
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00100
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00100';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FACE_POINTER;
      let value: string = '1';
      await modifyImagePropertyTestOne(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00101
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00101
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00101', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00101';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SUBJECT_DISTANCE_RANGE;
      let value: string = '1';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Macro')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00102
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00102
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00102', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00102';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.DIGITAL_ZOOM_RATIO;
      let value: string = '1/2';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('0.5')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00103
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00103
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00103', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00103';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FACE_REYE_CENTER;
      let value: string = '1';
      await modifyImagePropertyTestOne(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00105
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00105
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00105', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00105';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.WIND_SNAPSHOT_MODE;
      let value: string = '1';
      await modifyImagePropertyTestOne(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00106
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00106
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00106', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00106';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_ALTITUDE;
      let value: string = '123.45';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('123.45')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00107
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00107
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00107', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00107';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FOCAL_PLANE_Y_RESOLUTION;
      let value: string = '500';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('500')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00108
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00108
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00108', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00108';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SOURCE_IMAGE_NUMBER_OF_COMPOSITE_IMAGE;
      let value: string = '1,5';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('1, 5')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00109
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00109
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00109', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00109';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SUBJECT_AREA;
      let value: string = '50 50';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('(x,y) = (50,50)')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00110
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00110
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00110', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00110';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.CONTRAST;
      let value: string = '0';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Normal')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00111
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00111
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00111', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00111';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.XMAGE_TOP;
      let value: string = '1';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00112
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00112
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00112', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00112';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.NEW_SUBFILE_TYPE;
      let value: string = '0';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('0')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00113
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00113
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00113', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00113';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_ALTITUDE_REF;
      let value: string = '0';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Sea level')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00114
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00114
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00114', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00114';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.F_NUMBER;
      let value: string = '1';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('f/1.0')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00116
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00116
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00116', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00116';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.OFFSET_TIME_DIGITIZED;
      let value: string = 'Offset Time Digitized';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Offset Time Digitized')
      });
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00118
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00118
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00118', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00118';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SOFTWARE;
      let value: string = 'Software name and version';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Software name and version')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00119
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00119
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00119', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00119';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.X_RESOLUTION;
      let value: string = '72';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('72')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00120
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00120
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00120', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00120';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.ISO_SPEED_RATINGS;
      let value: string = '3200';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('3200')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00122
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00122
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00122', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00122';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.PHYSICAL_APERTURE;
      let value: string = '1';
      await modifyImagePropertyTestOne(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00123
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00123
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00123', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00123';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GAIN_CONTROL;
      let value: string = '0';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Normal')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00124
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00124
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00124', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00124';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FACE_MOUTH_CENTER;
      let value: string = '1';
      await modifyImagePropertyTestOne(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00125
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00125
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00125', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00125';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.PIXEL_X_DIMENSION;
      let value: string = '4096';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('4096')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00126
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00126
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00126', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00126';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_IMG_DIRECTION_REF;
      let value: string = 'T';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('T')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00127
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00127
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00127', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00127';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.PHOTOGRAPHIC_SENSITIVITY;
      let value: string = '3200';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('3200')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00128
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00128
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00128', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00128';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.Y_RESOLUTION;
      let value: string = '72';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('72')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00129
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00129
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00129', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00129';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SCENE_FLOWERS_CONF;
      let value: string = '1';
      await modifyImagePropertyTestOne(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00130
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00130
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00130', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00130';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SPECTRAL_SENSITIVITY;
      let value: string = 'SpectralSensitivity';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('SpectralSensitivity')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00131
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00131
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00131', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00131';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.PLANAR_CONFIGURATION;
      let value: string = '1';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Chunky format')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00133
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00133
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00133', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00133';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_SPEED_REF;
      let value: string = 'K';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('K')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00134
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00134
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00134', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00134';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_DEST_LATITUDE_REF;
      let value: string = '78';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('78')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00135
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00135
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00135', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00135';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.ROLL_ANGLE;
      let value: string = '1';
      await modifyImagePropertyTestOne(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00136
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00136
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00136', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00136';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_MEASURE_MODE;
      let value: string = '2';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('2')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00138
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00138
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00138', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00138';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.STRIP_OFFSETS;
      let value: string = '100';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('100')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00139
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00139
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00139', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00139';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.COPYRIGHT;
      let value: string = 'desc';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('desc (Photographer) - [None] (Editor)')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00140
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00140
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00140', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00140';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.JPEG_INTERCHANGE_FORMAT_LENGTH;
      let value: string = '1';
      await modifyImagePropertyTestOne(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00141
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00141
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00141', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00141';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.XMAGE_LEFT;
      let value: string = '1';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00142
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00142
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00142', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00142';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_TRACK_REF;
      let value: string = 'T';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('T')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00143
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00143
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00143', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00143';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SATURATION;
      let value: string = '0';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Normal')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00144
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00144
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00144', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00144';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SCENE_CAPTURE_TYPE;
      let value: string = '1';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Landscape')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00145
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00145
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00145', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00145';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_DOP;
      let value: string = '1.5';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('1.5')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00146
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00146
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00146', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00146';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.JPEG_INTERCHANGE_FORMAT;
      let value: string = '1';
      await modifyImagePropertyTestOne(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00147
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00147
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00147', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00147';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SCENE_STAGE_CONF;
      let value: string = '1';
      await modifyImagePropertyTestOne(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00148
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00148
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00148', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00148';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.APERTURE_VALUE;
      let value: string = '1';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('1.00 EV (f/1.4)')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00149
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00149
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00149', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00149';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SCENE_SNOW_CONF;
      let value: string = '1';
      await modifyImagePropertyTestOne(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00151
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00151
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00151', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00151';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE;
      let value: string = 'Source Exposure Times Of CompositeImage';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Source Exposure Times Of CompositeImage')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00152
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00152
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00152', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00152';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_SATELLITES;
      let value: string = 'GPS Satellites';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('GPS Satellites')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00153
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00153
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00153', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00153';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.COMPOSITE_IMAGE;
      let value: string = '1';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00154
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00154
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00154', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00154';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.WHITE_BALANCE;
      let value: string = '0';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Auto white balance')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00155
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00155
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00155', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00155';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SCENE_BEACH_CONF;
      let value: string = '1';
      await modifyImagePropertyTestOne(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00156
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00156
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00156', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00156';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.DATE_TIME_ORIGINAL;
      let value: string = '2024:07:07 13:45:59';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('2024:07:07 13:45:59')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00157
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00157
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00157', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00157';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.OFFSET_TIME;
      let value: string = '2024:07:07 13:45:59';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('2024:07:07 13:45:59')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00158
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00158
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00158', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00158';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.STANDARD_OUTPUT_SENSITIVITY;
      let value: string = '400';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('400')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00159
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00159
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00159', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00159';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.CAMERA_OWNER_NAME;
      let value: string = 'Camera Owner Name';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Camera Owner Name')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00160
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00160
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00160', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00160';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SCENE_POINTER;
      let value: string = '1';
      await modifyImagePropertyTestOne(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00162
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00162
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00162', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00162';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_IMG_DIRECTION;
      let value: string = '120';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('120')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00163
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00163
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00163', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00163';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SCENE_VERSION;
      let value: string = '1';
      await modifyImagePropertyTestOne(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00164
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00164
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00164', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00164';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SCENE_BLUE_SKY_CONF;
      let value: string = '1';
      await modifyImagePropertyTestOne(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00165
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00165
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00165', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00165';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.METERING_MODE;
      let value: string = '1';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Average')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00167
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00167
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00167', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00167';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.XMAGE_RIGHT;
      let value: string = '1';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00168
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00168
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00168', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00168';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.COMPRESSION;
      let value: string = '1';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Uncompressed')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00169
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00169
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00169', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00169';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.ROWS_PER_STRIP;
      let value: string = '10';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('10')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00170
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00170
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00170', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00170';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.RELATED_SOUND_FILE;
      let value: string = 'Related Sound File"';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Related Sound File"')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00171
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00171
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00171', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00171';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.IMAGE_UNIQUE_ID;
      let value: string = 'Image Unique ID';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Image Unique ID')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00172
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00172
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00172', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00172';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.EXPOSURE_BIAS_VALUE;
      let value: string = '1';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('1.00 EV')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00173
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00173
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00173', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00173';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.PHOTOMETRIC_INTERPRETATION;
      let value: string = '1';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Normal mono')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00174
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00174
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00174', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00174';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.USER_COMMENT;
      let value: string = 'User Comment"';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('User Comment"')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00175
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00175
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00175', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00175';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SPATIAL_FREQUENCY_RESPONSE;
      let value: string = 'Spatial Frequency Response';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('Spatial Frequency Response')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00176
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00176
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00176', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_00176';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_SPEED;
      let value: string = '123.45';
      await modifyImagePropertyTestOnes(done, testName, path, key, value, (errCode: string) => {
        expect(errCode).assertEqual('123.45')
      });
    })
  })
}