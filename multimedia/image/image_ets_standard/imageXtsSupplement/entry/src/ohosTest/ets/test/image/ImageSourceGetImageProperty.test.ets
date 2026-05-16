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

const TAG = 'xts.GetImagePropertySuppTest';

async function getImagePropertyTestOne(done: Function, testName: string, pathUri: string,
  key: image.PropertyKey, options: image.ImagePropertyOptions, callback: (err: string) => void) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let path = `file://${testContext.filesDir}/${pathUri}`;
    let imageSource: image.ImageSource = image.createImageSource(path);
    console.info(TAG, testName, ' createImageSource success ');
    let res = await imageSource.getImageProperty(key, options);
    console.info(TAG, testName, ' getImageProperty success ');
    callback(res);
    done();
  } catch (error) {
    console.error(TAG, testName, ` getImageProperty failed; error: `, JSON.stringify(error),
      error.code);
    expect().assertFail();
    done();
  }
}

export default function ImageSourceGetImagePropertyTest() {
  describe('ImageSourceGetImagePropertyTest', () => {
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
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0001
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0001
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0001';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SUBFILE_TYPE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0002
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0002
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0002';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.REFERENCE_BLACK_WHITE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0003
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0003
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0003';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.ISO_SPEED_LATITUDE_ZZZ;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0004
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0004
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0004';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.PITCH_ANGLE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0005
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0005
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0005';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SCENE_NIGHT_CONF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0006
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0006
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0006';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_DEST_LATITUDE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0007
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0007
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0007';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.CUSTOM_RENDERED;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('Custom process')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0008
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0008
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0008';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FACE_CONF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0009
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0009
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0009', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0009';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SUBSEC_TIME;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('543792')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0010
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0010
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0010';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.COMPRESSED_BITS_PER_PIXEL;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('0.95')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0011
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0011
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0011', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0011';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.CAPTURE_MODE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0012
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0012
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0012', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0012';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.IMAGE_WIDTH;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('3456')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0013
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0013
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0013', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0013';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.RECOMMENDED_EXPOSURE_INDEX;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('200')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0014
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0014
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0014', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0014';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SUBSEC_TIME_ORIGINAL;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('543792')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0015
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0015
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0015', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0015';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FRONT_CAMERA;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0016
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0016
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0016', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0016';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_DEST_DISTANCE_REF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0017
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0017
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0017', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0017';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.IMAGE_LENGTH;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('4608')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0018
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0018
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0018', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0018';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.BURST_NUMBER;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0019
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0019
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0019', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0019';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.YCBCR_SUB_SAMPLING;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0020
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0020
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0020', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0020';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_DEST_BEARING;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0021
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0021
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0021', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0021';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.DEFAULT_CROP_SIZE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0022
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0022
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0022', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0022';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.EXPOSURE_TIME;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1/33 sec.')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0023
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0023
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0023', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0023';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.LENS_SERIAL_NUMBER;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0024
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0024
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0024', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0024';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.XMAGE_MODE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0025
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0025
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0025', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0025';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.XMAGE_BOTTOM;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0026
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0026
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0026', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0026';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FOCAL_PLANE_RESOLUTION_UNIT;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0027
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0027
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0027', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0027';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SUBSEC_TIME_DIGITIZED;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('543792')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0028
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0028
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0028', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0028';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.PHOTO_MODE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0029
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0029
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0029', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0029';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.ISO_SPEED_LATITUDE_YYY;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0030
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0030
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0030', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0030';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.ISO_SPEED;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('400')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0031
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0031
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0031', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0031';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.LIGHT_SOURCE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('Daylight')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0032
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0032
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0032', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0032';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FOCUS_MODE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0033
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0033
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0033', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0033';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.YCBCR_POSITIONING;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('Centered')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0034
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0034
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0034', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0034';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FACE_VERSION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0035
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0035
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0035', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0035';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_PROCESSING_METHOD;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0036
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0036
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0036', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0036';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.DNG_VERSION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0037
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0037
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0037', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0037';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_AREA_INFORMATION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0038
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0038
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0038', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0038';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.LENS_MODEL;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0039
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0039
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0039', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0039';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.LENS_SPECIFICATION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0040
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0040
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0040', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0040';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_DATE_STAMP;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0041
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0041
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0041', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0041';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FACE_RECT;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0042
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0042
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0042', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0042';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.COMPONENTS_CONFIGURATION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('Y Cb Cr -')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0043
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0043
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0043', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0043';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.COLOR_SPACE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('sRGB')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0044
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0044
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0044', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0044';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.DATE_TIME;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('2022:06:02 15:51:35')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0045
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0045
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0045', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0045';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FLASH;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '0x00' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('Flash did not fire, auto mode')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0046
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0046
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0046', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0046';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_H_POSITIONING_ERROR;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0047
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0047
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0047', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0047';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.MODEL;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('TNY-AL00')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0048
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0048
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0048', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0048';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SCENE_SUNSET_CONF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0049
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0049
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0049', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0049';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FOCAL_PLANE_X_RESOLUTION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0050
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0050
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0050', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0050';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FLASHPIX_VERSION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('FlashPix Version 1.0')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0051
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0051
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0051', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0051';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SCENE_GREEN_PLANT_CONF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0052
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0052
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0052', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0052';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SUBJECT_DISTANCE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0053
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0053
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0053', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0053';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_DIFFERENTIAL;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0054
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0054
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0054', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0054';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.YCBCR_COEFFICIENTS;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0055
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0055
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0055', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0055';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.PIXEL_Y_DIMENSION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('4608')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0056
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0056
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0056', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0056';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.EXPOSURE_INDEX;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0057
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0057
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0057', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0057';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.CLOUD_ENHANCEMENT_MODE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0058
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0058
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0058', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0058';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.BRIGHTNESS_VALUE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('0.00 EV (3.43 cd/m^2)')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0059
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0059
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0059', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0059';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FLASH_ENERGY;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0060
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0060
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0060', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0060';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FACE_SMILE_SCORE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0061
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0061
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0061', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0061';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_VERSION_ID;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0062
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0062
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0062', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0062';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_LONGITUDE_REF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('W')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0063
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0063
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0063', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0063';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.EXPOSURE_PROGRAM;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('Normal program')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0064
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0064
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0064', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0064';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SENSITIVITY_TYPE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0065
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0065
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0065', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0065';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.DATE_TIME_DIGITIZED;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('2022:06:02 15:51:35')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0066
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0066
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0066', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0066';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.EXPOSURE_MODE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('Auto exposure')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0067
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0067
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0067', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0067';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.MAX_APERTURE_VALUE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1.69 EV (f/1.8)')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0068
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0068
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0068', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0068';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.DEVICE_SETTING_DESCRIPTION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0069
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0069
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0069', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0069';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.BODY_SERIAL_NUMBER;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0070
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0070
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0070', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0070';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.IMAGE_DESCRIPTION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: 'Image description info' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('Image description info')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0071
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0071
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0071', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0071';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.EXIF_VERSION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('Exif Version 2.1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0072
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0072
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0072', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0072';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SAMPLES_PER_PIXEL;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0073
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0073
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0073', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0073';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.STRIP_BYTE_COUNTS;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0074
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0074
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0074', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0074';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_MAP_DATUM;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0075
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0075
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0075', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0075';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.ARTIST;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0076
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0076
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0076', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0076';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.IS_XMAGE_SUPPORTED;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0077
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0077
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0077', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0077';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SHUTTER_SPEED;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('29.90 EV (1/999963365 sec.)')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0078
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0078
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0078', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0078';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.MAKE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: 'HUAWEI' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('HUAWEI')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0079
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0079
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0079', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0079';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_TRACK;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0080
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0080
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0080', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0080';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SCENE_TYPE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('Directly photographed')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0081
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0081
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0081', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0081';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.OFFSET_TIME_ORIGINAL;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0082
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0082
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0082', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0082';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_LATITUDE_REF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('N')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0083
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0083
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0083', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0083';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SCENE_FOOD_CONF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0084
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0084
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0084', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0084';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_STATUS;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0085
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0085
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0085', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0085';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GAMMA;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0086
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0086
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0086', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0086';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FACE_LEYE_CENTER;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0087
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0087
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0087', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0087';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FACE_COUNT;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0088
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0088
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0088', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0088';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_DEST_DISTANCE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0089
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0089
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0089', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0089';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FOCAL_LENGTH;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('4.0 mm')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0090
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0090
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0090', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0090';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_DEST_LONGITUDE_REF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0091
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0091
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0091', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0091';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FILE_SOURCE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('DSC')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0092
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0092
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0092', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0092';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_DEST_BEARING_REF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0093
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0093
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0093', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0093';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SHARPNESS;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('Normal')
      });
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0094
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0094
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0094', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0094';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FOCAL_LENGTH_IN_35_MM_FILM;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('27')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0095
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0095
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0095', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0095';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.RESOLUTION_UNIT;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('Inch')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0096
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0096
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0096', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0096';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.LENS_MAKE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0097
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0097
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0097', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0097';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.WHITE_POINT;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0098
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0098
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0098', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0098';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SENSING_METHOD;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('One-chip color area sensor')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0099
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0099
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0099', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0099';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SCENE_TEXT_CONF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0100
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0100
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0100';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FACE_POINTER;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0101
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0101
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0101', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0101';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SUBJECT_DISTANCE_RANGE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('Unknown')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0102
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0102
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0102', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0102';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.DIGITAL_ZOOM_RATIO;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1.00')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0103
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0103
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0103', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0103';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FACE_REYE_CENTER;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0104
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0104
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0104', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0104';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.OECF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0105
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0105
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0105', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0105';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.WIND_SNAPSHOT_MODE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0106
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0106
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0106', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0106';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_ALTITUDE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0107
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0107
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0107', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0107';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FOCAL_PLANE_Y_RESOLUTION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0108
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0108
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0108', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0108';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SOURCE_IMAGE_NUMBER_OF_COMPOSITE_IMAGE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0109
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0109
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0109', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0109';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SUBJECT_AREA;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0110
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0110
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0110', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0110';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.CONTRAST;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('Normal')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0111
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0111
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0111', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0111';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.XMAGE_TOP;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0112
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0112
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0112', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0112';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.NEW_SUBFILE_TYPE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0113
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0113
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0113', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0113';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_ALTITUDE_REF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0114
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0114
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0114', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0114';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.F_NUMBER;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('f/1.8')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0115
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0115
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0115', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0115';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SUBJECT_LOCATION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0116
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0116
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0116', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0116';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.OFFSET_TIME_DIGITIZED;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0117
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0117
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0117', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0117';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_DEST_LONGITUDE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0118
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0118
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0118', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0118';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SOFTWARE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('TNY-AL00 2.0.0.232(C00E230R2P4)')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0119
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0119
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0119', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0119';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.X_RESOLUTION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('72')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0120
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0120
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0120', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0120';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.ISO_SPEED_RATINGS;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('400')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0121
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0121
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0121', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0121';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_LATITUDE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode)
          .assertEqual('38.0, 0.4706822422, 2.690550837, 0.1649189067, 0.7691442537, 1755226327/0, 0.0000000000, 553648128/0')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0122
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0122
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0122', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0122';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.PHYSICAL_APERTURE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0123
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0123
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0123', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0123';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GAIN_CONTROL;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('Normal')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0124
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0124
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0124', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0124';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.FACE_MOUTH_CENTER;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0125
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0125
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0125', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0125';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.PIXEL_X_DIMENSION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('3456')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0126
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0126
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0126', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0126';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_IMG_DIRECTION_REF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0127
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0127
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0127', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0127';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.PHOTOGRAPHIC_SENSITIVITY;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('400')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0128
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0128
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0128', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0128';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.Y_RESOLUTION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('72')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0129
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0129
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0129', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0129';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SCENE_FLOWERS_CONF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0130
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0130
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0130', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0130';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SPECTRAL_SENSITIVITY;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0131
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0131
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0131', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0131';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.PLANAR_CONFIGURATION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0132
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0132
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0132', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0132';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.PRIMARY_CHROMATICITIES;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0133
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0133
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0133', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0133';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_SPEED_REF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0134
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0134
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0134', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0134';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_DEST_LATITUDE_REF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0135
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0135
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0135', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0135';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.ROLL_ANGLE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0136
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0136
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0136', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0136';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_MEASURE_MODE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0137
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0137
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0137', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0137';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_LONGITUDE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode)
          .assertEqual('9.0, 0.1579694976, 0.6649895060, 7.623856795, 0.0000000000, 0.3402061856, 0.5869612838, 3.176445880')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0138
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0138
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0138', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0138';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.STRIP_OFFSETS;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0139
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0139
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0139', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0139';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.COPYRIGHT;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0140
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0140
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0140', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0140';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.JPEG_INTERCHANGE_FORMAT_LENGTH;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('24042')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0141
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0141
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0141', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0141';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.XMAGE_LEFT;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0142
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0142
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0142', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0142';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_TRACK_REF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0143
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0143
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0143', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0143';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SATURATION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('Normal')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0144
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0144
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0144', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0144';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SCENE_CAPTURE_TYPE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('Standard')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0145
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0145
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0145', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0145';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_DOP;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0146
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0146
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0146', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0146';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.JPEG_INTERCHANGE_FORMAT;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1275')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0147
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0147
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0147', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0147';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SCENE_STAGE_CONF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0148
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0148
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0148', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0148';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.APERTURE_VALUE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1.69 EV (f/1.8)')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0149
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0149
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0149', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0149';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SCENE_SNOW_CONF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0150
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0150
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0150', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0150';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.CFA_PATTERN;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0151
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0151
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0151', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0151';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0152
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0152
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0152', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0152';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_SATELLITES;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0153
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0153
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0153', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0153';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.COMPOSITE_IMAGE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0154
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0154
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0154', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0154';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.WHITE_BALANCE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('Auto white balance')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0155
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0155
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0155', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0155';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SCENE_BEACH_CONF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0156
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0156
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0156', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0156';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.DATE_TIME_ORIGINAL;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('2022:06:02 15:51:35')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0157
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0157
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0157', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0157';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.OFFSET_TIME;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0158
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0158
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0158', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0158';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.STANDARD_OUTPUT_SENSITIVITY;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0159
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0159
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0159', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0159';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.CAMERA_OWNER_NAME;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0160
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0160
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0160', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0160';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SCENE_POINTER;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0161
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0161
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0161', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0161';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_TIME_STAMP;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0162
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0162
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0162', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0162';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_IMG_DIRECTION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0163
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0163
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0163', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0163';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SCENE_VERSION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0164
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0164
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0164', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0164';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SCENE_BLUE_SKY_CONF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0165
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0165
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0165', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0165';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.METERING_MODE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('Pattern')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0166
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0166
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0166', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0166';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.TRANSFER_FUNCTION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0167
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0167
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0167', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0167';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.XMAGE_RIGHT;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0168
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0168
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0168', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0168';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.COMPRESSION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('JPEG compression')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0169
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0169
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0169', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0169';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.ROWS_PER_STRIP;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0170
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0170
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0170', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0170';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.RELATED_SOUND_FILE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0171
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0171
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0171', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0171';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.IMAGE_UNIQUE_ID;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0172
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0172
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0172', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0172';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.EXPOSURE_BIAS_VALUE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('0.00 EV')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0173
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0173
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0173', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0173';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.PHOTOMETRIC_INTERPRETATION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0174
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0174
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0174', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0174';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.USER_COMMENT;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0175
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0175
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0175', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0175';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.SPATIAL_FREQUENCY_RESPONSE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0176
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0176
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0176', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_0176';
      const path = 'test_exif.jpg'
      let key: image.PropertyKey = image.PropertyKey.GPS_SPEED;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00001
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00001
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00001';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SUBFILE_TYPE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00002
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00002
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00002';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.REFERENCE_BLACK_WHITE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00003
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00003
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00003';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.ISO_SPEED_LATITUDE_ZZZ;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00004
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00004
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00004';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.PITCH_ANGLE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00005
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00005
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00005';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SCENE_NIGHT_CONF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00006
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00006
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00006';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_DEST_LATITUDE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00007
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00007
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00007';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.CUSTOM_RENDERED;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00008
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00008
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00008';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FACE_CONF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00009
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00009
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00009', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00009';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SUBSEC_TIME;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('140')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00010
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00010
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00010';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.COMPRESSED_BITS_PER_PIXEL;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00011
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00011
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00011', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00011';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.CAPTURE_MODE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00012
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00012
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00012', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00012';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.IMAGE_WIDTH;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00013
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00013
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00013', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00013';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.RECOMMENDED_EXPOSURE_INDEX;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00014
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00014
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00014', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00014';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SUBSEC_TIME_ORIGINAL;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00015
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00015
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00015', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00015';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FRONT_CAMERA;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00016
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00016
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00016', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00016';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_DEST_DISTANCE_REF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00017
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00017
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00017', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00017';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.IMAGE_LENGTH;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00018
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00018
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00018', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00018';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.BURST_NUMBER;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00019
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00019
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00019', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00019';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.YCBCR_SUB_SAMPLING;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00020
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00020
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00020', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00020';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_DEST_BEARING;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00021
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00021
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00021', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00021';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.DEFAULT_CROP_SIZE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00022
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00022
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00022', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00022';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.EXPOSURE_TIME;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00023
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00023
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00023', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00023';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.LENS_SERIAL_NUMBER;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00024
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00024
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00024', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00024';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.XMAGE_MODE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00025
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00025
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00025', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00025';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.XMAGE_BOTTOM;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00026
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00026
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00026', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00026';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FOCAL_PLANE_RESOLUTION_UNIT;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00027
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00027
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00027', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00027';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SUBSEC_TIME_DIGITIZED;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00028
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00028
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00028', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00028';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.PHOTO_MODE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00029
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00029
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00029', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00029';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.ISO_SPEED_LATITUDE_YYY;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00030
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00030
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00030', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00030';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.ISO_SPEED;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00031
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00031
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00031', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00031';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.LIGHT_SOURCE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00032
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00032
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00032', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00032';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FOCUS_MODE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00033
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00033
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00033', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00033';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.YCBCR_POSITIONING;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('Centered')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00034
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00034
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00034', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00034';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FACE_VERSION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00035
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00035
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00035', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00035';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_PROCESSING_METHOD;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00036
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00036
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00036', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00036';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.DNG_VERSION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00037
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00037
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00037', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00037';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_AREA_INFORMATION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00038
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00038
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00038', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00038';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.LENS_MODEL;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00039
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00039
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00039', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00039';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.LENS_SPECIFICATION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00040
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00040
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00040', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00040';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_DATE_STAMP;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00041
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00041
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00041', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00041';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FACE_RECT;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00042
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00042
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00042', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00042';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.COMPONENTS_CONFIGURATION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00043
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00043
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00043', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00043';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.COLOR_SPACE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('Uncalibrated')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00044
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00044
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00044', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00044';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.DATE_TIME;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('2015:11:05 23:04:30')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00045
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00045
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00045', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00045';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FLASH;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00046
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00046
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00046', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00046';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_H_POSITIONING_ERROR;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00047
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00047
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00047', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00047';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.MODEL;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00048
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00048
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00048', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00048';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SCENE_SUNSET_CONF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00049
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00049
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00049', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00049';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FOCAL_PLANE_X_RESOLUTION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00050
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00050
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00050', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00050';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FLASHPIX_VERSION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('FlashPix Version 1.0')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00051
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00051
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00051', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00051';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SCENE_GREEN_PLANT_CONF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00052
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00052
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00052', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00052';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SUBJECT_DISTANCE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00053
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00053
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00053', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00053';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_DIFFERENTIAL;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00054
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00054
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00054', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00054';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.YCBCR_COEFFICIENTS;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00055
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00055
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00055', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00055';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.PIXEL_Y_DIMENSION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1920')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00056
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00056
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00056', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00056';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.EXPOSURE_INDEX;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00057
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00057
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00057', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00057';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.CLOUD_ENHANCEMENT_MODE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00058
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00058
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00058', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00058';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.BRIGHTNESS_VALUE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00059
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00059
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00059', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00059';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FLASH_ENERGY;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00060
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00060
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00060', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00060';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FACE_SMILE_SCORE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00061
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00061
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00061', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00061';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_VERSION_ID;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00062
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00062
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00062', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00062';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_LONGITUDE_REF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00063
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00063
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00063', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00063';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.EXPOSURE_PROGRAM;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00064
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00064
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00064', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00064';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SENSITIVITY_TYPE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00065
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00065
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00065', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00065';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.DATE_TIME_DIGITIZED;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00066
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00066
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00066', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00066';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.EXPOSURE_MODE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00067
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00067
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00067', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00067';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.MAX_APERTURE_VALUE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00068
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00068
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00068', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00068';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.DEVICE_SETTING_DESCRIPTION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00069
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00069
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00069', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00069';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.BODY_SERIAL_NUMBER;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00070
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00070
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00070', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00070';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.IMAGE_DESCRIPTION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: 'Image description info' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('Image description info')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00071
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00071
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00071', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00071';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.EXIF_VERSION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('Exif Version 2.1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00072
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00072
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00072', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00072';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SAMPLES_PER_PIXEL;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00073
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00073
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00073', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00073';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.STRIP_BYTE_COUNTS;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00074
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00074
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00074', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00074';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_MAP_DATUM;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00075
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00075
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00075', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00075';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.ARTIST;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00076
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00076
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00076', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00076';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.IS_XMAGE_SUPPORTED;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00077
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00077
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00077', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00077';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SHUTTER_SPEED;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00078
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00078
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00078', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00078';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.MAKE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: 'HUAWEI' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('HUAWEI')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00079
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00079
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00079', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00079';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_TRACK;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00080
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00080
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00080', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00080';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SCENE_TYPE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00081
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00081
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00081', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00081';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.OFFSET_TIME_ORIGINAL;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00082
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00082
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00082', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00082';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_LATITUDE_REF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00083
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00083
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00083', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00083';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SCENE_FOOD_CONF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00084
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00084
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00084', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00084';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_STATUS;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00085
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00085
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00085', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00085';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GAMMA;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00086
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00086
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00086', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00086';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FACE_LEYE_CENTER;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00087
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00087
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00087', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00087';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FACE_COUNT;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00088
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00088
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00088', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00088';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_DEST_DISTANCE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00089
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00089
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00089', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00089';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FOCAL_LENGTH;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00090
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00090
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00090', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00090';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_DEST_LONGITUDE_REF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00091
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00091
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00091', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00091';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FILE_SOURCE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00092
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00092
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00092', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00092';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_DEST_BEARING_REF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00093
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00093
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00093', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00093';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SHARPNESS;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00094
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00094
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00094', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00094';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FOCAL_LENGTH_IN_35_MM_FILM;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00095
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00095
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00095', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00095';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.RESOLUTION_UNIT;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('Inch')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00096
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00096
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00096', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00096';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.LENS_MAKE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00097
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00097
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00097', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00097';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.WHITE_POINT;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00098
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00098
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00098', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00098';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SENSING_METHOD;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00099
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00099
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00099', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00099';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SCENE_TEXT_CONF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00100
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00100
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00100';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FACE_POINTER;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00101
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00101
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00101', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00101';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SUBJECT_DISTANCE_RANGE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00102
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00102
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00102', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00102';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.DIGITAL_ZOOM_RATIO;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00103
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00103
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00103', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00103';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FACE_REYE_CENTER;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00104
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00104
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00104', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00104';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.OECF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00105
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00105
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00105', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00105';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.WIND_SNAPSHOT_MODE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00106
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00106
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00106', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00106';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_ALTITUDE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00107
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00107
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00107', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00107';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FOCAL_PLANE_Y_RESOLUTION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00108
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00108
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00108', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00108';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SOURCE_IMAGE_NUMBER_OF_COMPOSITE_IMAGE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00109
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00109
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00109', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00109';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SUBJECT_AREA;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00110
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00110
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00110', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00110';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.CONTRAST;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00111
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00111
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00111', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00111';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.XMAGE_TOP;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00112
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00112
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00112', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00112';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.NEW_SUBFILE_TYPE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00113
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00113
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00113', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00113';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_ALTITUDE_REF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00114
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00114
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00114', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00114';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.F_NUMBER;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00115
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00115
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00115', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00115';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SUBJECT_LOCATION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00116
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00116
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00116', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00116';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.OFFSET_TIME_DIGITIZED;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00117
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00117
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00117', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00117';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_DEST_LONGITUDE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00118
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00118
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00118', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00118';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SOFTWARE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('Adobe Photoshop CS Windows')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00119
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00119
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00119', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00119';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.X_RESOLUTION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('72')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00120
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00120
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00120', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00120';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.ISO_SPEED_RATINGS;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00121
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00121
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00121', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00121';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_LATITUDE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00122
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00122
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00122', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00122';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.PHYSICAL_APERTURE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00123
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00123
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00123', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00123';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GAIN_CONTROL;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00124
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00124
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00124', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00124';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FACE_MOUTH_CENTER;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00125
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00125
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00125', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00125';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.PIXEL_X_DIMENSION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1080')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00126
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00126
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00126', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00126';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_IMG_DIRECTION_REF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00127
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00127
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00127', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00127';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.PHOTOGRAPHIC_SENSITIVITY;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00128
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00128
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00128', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00128';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.Y_RESOLUTION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('72')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00129
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00129
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00129', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00129';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SCENE_FLOWERS_CONF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00130
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00130
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00130', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00130';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SPECTRAL_SENSITIVITY;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00131
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00131
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00131', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00131';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.PLANAR_CONFIGURATION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00132
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00132
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00132', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00132';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.PRIMARY_CHROMATICITIES;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00133
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00133
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00133', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00133';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_SPEED_REF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00134
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00134
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00134', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00134';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_DEST_LATITUDE_REF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00135
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00135
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00135', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00135';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.ROLL_ANGLE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00136
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00136
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00136', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00136';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_MEASURE_MODE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00137
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00137
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00137', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00137';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_LONGITUDE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00138
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00138
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00138', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00138';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.STRIP_OFFSETS;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00139
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00139
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00139', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00139';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.COPYRIGHT;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00140
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00140
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00140', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00140';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.JPEG_INTERCHANGE_FORMAT_LENGTH;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('3918')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00141
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00141
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00141', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00141';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.XMAGE_LEFT;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00142
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00142
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00142', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00142';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_TRACK_REF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00143
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00143
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00143', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00143';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SATURATION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00144
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00144
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00144', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00144';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SCENE_CAPTURE_TYPE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00145
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00145
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00145', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00145';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_DOP;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00146
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00146
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00146', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00146';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.JPEG_INTERCHANGE_FORMAT;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('326')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00147
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00147
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00147', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00147';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SCENE_STAGE_CONF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00148
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00148
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00148', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00148';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.APERTURE_VALUE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00149
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00149
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00149', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00149';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SCENE_SNOW_CONF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00150
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00150
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00150', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00150';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.CFA_PATTERN;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00151
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00151
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00151', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00151';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00152
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00152
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00152', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00152';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_SATELLITES;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00153
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00153
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00153', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00153';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.COMPOSITE_IMAGE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00154
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00154
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00154', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00154';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.WHITE_BALANCE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00155
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00155
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00155', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00155';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SCENE_BEACH_CONF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00156
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00156
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00156', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00156';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.DATE_TIME_ORIGINAL;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00157
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00157
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00157', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00157';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.OFFSET_TIME;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00158
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00158
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00158', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00158';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.STANDARD_OUTPUT_SENSITIVITY;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00159
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00159
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00159', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00159';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.CAMERA_OWNER_NAME;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00160
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00160
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00160', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00160';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SCENE_POINTER;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00161
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00161
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00161', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00161';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_TIME_STAMP;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00162
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00162
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00162', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00162';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_IMG_DIRECTION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00163
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00163
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00163', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00163';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SCENE_VERSION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00164
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00164
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00164', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00164';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SCENE_BLUE_SKY_CONF;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00165
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00165
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00165', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00165';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.METERING_MODE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00166
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00166
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00166', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00166';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.TRANSFER_FUNCTION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00167
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00167
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00167', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00167';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.XMAGE_RIGHT;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('default_exif_value')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00168
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00168
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00168', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00168';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.COMPRESSION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('JPEG compression')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00169
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00169
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00169', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00169';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.ROWS_PER_STRIP;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00170
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00170
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00170', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00170';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.RELATED_SOUND_FILE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00171
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00171
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00171', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00171';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.IMAGE_UNIQUE_ID;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00172
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00172
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00172', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00172';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.EXPOSURE_BIAS_VALUE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00173
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00173
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00173', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00173';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.PHOTOMETRIC_INTERPRETATION;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00174
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00174
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00174', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00174';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.USER_COMMENT;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00175
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00175
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00175', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00175';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SPATIAL_FREQUENCY_RESPONSE;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00176
     * @tc.number SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00176
     * @tc.desc   test image with getImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00176', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_00176';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_SPEED;
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '1' };
      await getImagePropertyTestOne(done, testName, path, key, options, (errCode: string) => {
        expect(errCode).assertEqual('1')
      });
    })

  })
}