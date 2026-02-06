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

const TAG = 'xts.ModifyImagePropertySuppTests';

async function modifyImagePropertyTestTwo(done: Function, testName: string, pathUri: string,
  key: image.PropertyKey, value: string, callback: (err: number) => void) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let path = `file://${testContext.filesDir}/${pathUri}`;
    let imageSource: image.ImageSource = image.createImageSource(path);
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

export default function modifyImagePropertyTests() {
  describe('modifyImagePropertyTests', () => {
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
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0001
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0001
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0001';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SUBFILE_TYPE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0002
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0002
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0002';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.REFERENCE_BLACK_WHITE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0003
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0003
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0003';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.ISO_SPEED_LATITUDE_ZZZ;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0004
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0004
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0004';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.PITCH_ANGLE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0005
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0005
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0005';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SCENE_NIGHT_CONF;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0006
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0006
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0006';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_DEST_LATITUDE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0007
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0007
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0007';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.CUSTOM_RENDERED;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0008
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0008
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0008';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FACE_CONF;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0009
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0009
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0009', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0009';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SUBSEC_TIME;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980123')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0010
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0010
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0010';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.COMPRESSED_BITS_PER_PIXEL;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0011
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0011
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0011', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0011';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.CAPTURE_MODE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0012
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0012
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0012', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0012';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.IMAGE_WIDTH;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0013
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0013
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0013', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0013';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.RECOMMENDED_EXPOSURE_INDEX;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0014
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0014
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0014', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0014';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SUBSEC_TIME_ORIGINAL;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980123')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0015
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0015
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0015', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0015';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FRONT_CAMERA;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0016
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0016
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0016', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0016';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_DEST_DISTANCE_REF;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0017
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0017
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0017', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0017';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.IMAGE_LENGTH;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0018
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0018
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0018', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0018';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.BURST_NUMBER;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0019
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0019
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0019', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0019';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.YCBCR_SUB_SAMPLING;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0020
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0020
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0020', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0020';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_DEST_BEARING;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0021
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0021
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0021', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0021';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.DEFAULT_CROP_SIZE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0022
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0022
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0022', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0022';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.EXPOSURE_TIME;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0023
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0023
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0023', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0023';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.LENS_SERIAL_NUMBER;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980123')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0024
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0024
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0024', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0024';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.XMAGE_MODE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0025
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0025
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0025', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0025';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.XMAGE_BOTTOM;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0026
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0026
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0026', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0026';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FOCAL_PLANE_RESOLUTION_UNIT;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0027
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0027
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0027', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0027';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SUBSEC_TIME_DIGITIZED;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980123')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0028
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0028
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0028', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0028';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.PHOTO_MODE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0029
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0029
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0029', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0029';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.ISO_SPEED_LATITUDE_YYY;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0030
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0030
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0030', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0030';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.ISO_SPEED;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0031
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0031
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0031', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0031';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.LIGHT_SOURCE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0032
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0032
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0032', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0032';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FOCUS_MODE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0033
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0033
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0033', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0033';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.YCBCR_POSITIONING;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0034
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0034
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0034', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0034';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FACE_VERSION;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0035
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0035
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0035', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0035';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_PROCESSING_METHOD;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980123')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0036
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0036
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0036', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0036';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.DNG_VERSION;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0037
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0037
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0037', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0037';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_AREA_INFORMATION;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980123')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0038
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0038
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0038', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0038';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.LENS_MODEL;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980123')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0039
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0039
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0039', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0039';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.LENS_SPECIFICATION;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0040
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0040
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0040', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0040';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_DATE_STAMP;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0041
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0041
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0041', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0041';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FACE_RECT;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0042
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0042
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0042', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0042';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.COMPONENTS_CONFIGURATION;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0043
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0043
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0043', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0043';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.COLOR_SPACE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0044
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0044
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0044', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0044';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.DATE_TIME;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0045
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0045
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0045', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0045';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FLASH;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0046
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0046
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0046', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0046';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_H_POSITIONING_ERROR;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0047
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0047
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0047', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0047';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.MODEL;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980123')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0048
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0048
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0048', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0048';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SCENE_SUNSET_CONF;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0049
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0049
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0049', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0049';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FOCAL_PLANE_X_RESOLUTION;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0050
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0050
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0050', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0050';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FLASHPIX_VERSION;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0051
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0051
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0051', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0051';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SCENE_GREEN_PLANT_CONF;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0052
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0052
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0052', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0052';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SUBJECT_DISTANCE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0053
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0053
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0053', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0053';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_DIFFERENTIAL;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0054
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0054
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0054', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0054';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.YCBCR_COEFFICIENTS;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0055
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0055
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0055', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0055';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.PIXEL_Y_DIMENSION;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0056
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0056
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0056', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0056';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.EXPOSURE_INDEX;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0057
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0057
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0057', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0057';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.CLOUD_ENHANCEMENT_MODE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0058
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0058
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0058', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0058';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.BRIGHTNESS_VALUE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0059
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0059
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0059', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0059';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FLASH_ENERGY;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0060
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0060
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0060', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0060';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FACE_SMILE_SCORE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0061
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0061
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0061', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0061';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_VERSION_ID;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0062
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0062
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0062', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0062';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_LONGITUDE_REF;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0063
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0063
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0063', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0063';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.EXPOSURE_PROGRAM;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0064
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0064
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0064', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0064';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SENSITIVITY_TYPE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0065
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0065
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0065', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0065';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.DATE_TIME_DIGITIZED;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0066
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0066
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0066', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0066';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.EXPOSURE_MODE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0067
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0067
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0067', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0067';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.MAX_APERTURE_VALUE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0068
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0068
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0068', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0068';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.DEVICE_SETTING_DESCRIPTION;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980123')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0069
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0069
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0069', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0069';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.BODY_SERIAL_NUMBER;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980123')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0070
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0070
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0070', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0070';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.IMAGE_DESCRIPTION;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980123')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0071
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0071
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0071', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0071';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.EXIF_VERSION;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0072
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0072
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0072', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0072';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SAMPLES_PER_PIXEL;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0073
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0073
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0073', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0073';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.STRIP_BYTE_COUNTS;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0074
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0074
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0074', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0074';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_MAP_DATUM;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980123')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0075
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0075
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0075', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0075';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.ARTIST;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980123')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0076
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0076
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0076', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0076';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.IS_XMAGE_SUPPORTED;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0077
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0077
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0077', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0077';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SHUTTER_SPEED;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0078
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0078
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0078', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0078';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.MAKE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980123')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0079
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0079
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0079', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0079';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_TRACK;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0080
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0080
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0080', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0080';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SCENE_TYPE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0081
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0081
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0081', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0081';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.OFFSET_TIME_ORIGINAL;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980123')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0082
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0082
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0082', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0082';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_LATITUDE_REF;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0083
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0083
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0083', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0083';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SCENE_FOOD_CONF;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0084
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0084
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0084', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0084';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_STATUS;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0085
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0085
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0085', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0085';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GAMMA;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0086
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0086
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0086', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0086';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FACE_LEYE_CENTER;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0087
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0087
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0087', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0087';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FACE_COUNT;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0088
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0088
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0088', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0088';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_DEST_DISTANCE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0089
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0089
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0089', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0089';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FOCAL_LENGTH;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0090
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0090
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0090', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0090';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_DEST_LONGITUDE_REF;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0091
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0091
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0091', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0091';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FILE_SOURCE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980123')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0092
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0092
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0092', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0092';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_DEST_BEARING_REF;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0093
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0093
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0093', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0093';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SHARPNESS;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0094
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0094
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0094', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0094';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FOCAL_LENGTH_IN_35_MM_FILM;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0095
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0095
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0095', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0095';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.RESOLUTION_UNIT;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0096
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0096
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0096', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0096';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.LENS_MAKE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980123')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0097
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0097
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0097', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0097';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.WHITE_POINT;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0098
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0098
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0098', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0098';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SENSING_METHOD;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980123')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0099
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0099
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0099', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0099';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SCENE_TEXT_CONF;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0100
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0100
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0100';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FACE_POINTER;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0101
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0101
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0101', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0101';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SUBJECT_DISTANCE_RANGE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0102
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0102
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0102', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0102';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.DIGITAL_ZOOM_RATIO;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0103
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0103
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0103', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0103';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FACE_REYE_CENTER;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0104
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0104
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0104', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0104';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.OECF;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980123')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0105
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0105
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0105', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0105';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.WIND_SNAPSHOT_MODE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0106
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0106
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0106', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0106';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_ALTITUDE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0107
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0107
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0107', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0107';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FOCAL_PLANE_Y_RESOLUTION;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0108
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0108
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0108', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0108';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SOURCE_IMAGE_NUMBER_OF_COMPOSITE_IMAGE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0109
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0109
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0109', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0109';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SUBJECT_AREA;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0110
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0110
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0110', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0110';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.CONTRAST;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0111
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0111
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0111', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0111';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.XMAGE_TOP;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0112
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0112
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0112', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0112';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.NEW_SUBFILE_TYPE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0113
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0113
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0113', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0113';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_ALTITUDE_REF;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0114
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0114
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0114', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0114';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.F_NUMBER;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0115
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0115
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0115', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0115';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SUBJECT_LOCATION;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0116
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0116
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0116', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0116';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.OFFSET_TIME_DIGITIZED;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980123')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0117
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0117
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0117', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0117';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_DEST_LONGITUDE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0118
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0118
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0118', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0118';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SOFTWARE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980123')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0119
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0119
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0119', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0119';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.X_RESOLUTION;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0120
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0120
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0120', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0120';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.ISO_SPEED_RATINGS;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0121
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0121
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0121', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0121';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_LATITUDE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0122
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0122
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0122', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0122';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.PHYSICAL_APERTURE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0123
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0123
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0123', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0123';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GAIN_CONTROL;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0124
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0124
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0124', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0124';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.FACE_MOUTH_CENTER;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0125
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0125
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0125', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0125';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.PIXEL_X_DIMENSION;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0126
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0126
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0126', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0126';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_IMG_DIRECTION_REF;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0127
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0127
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0127', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0127';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.PHOTOGRAPHIC_SENSITIVITY;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0128
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0128
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0128', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0128';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.Y_RESOLUTION;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0129
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0129
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0129', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0129';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SCENE_FLOWERS_CONF;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0130
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0130
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0130', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0130';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SPECTRAL_SENSITIVITY;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980123')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0131
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0131
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0131', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0131';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.PLANAR_CONFIGURATION;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0132
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0132
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0132', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0132';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.PRIMARY_CHROMATICITIES;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0133
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0133
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0133', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0133';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_SPEED_REF;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0134
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0134
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0134', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0134';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_DEST_LATITUDE_REF;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0135
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0135
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0135', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0135';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.ROLL_ANGLE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0136
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0136
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0136', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0136';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_MEASURE_MODE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0137
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0137
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0137', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0137';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_LONGITUDE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0138
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0138
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0138', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0138';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.STRIP_OFFSETS;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0139
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0139
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0139', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0139';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.COPYRIGHT;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980123')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0140
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0140
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0140', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0140';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.JPEG_INTERCHANGE_FORMAT_LENGTH;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0141
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0141
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0141', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0141';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.XMAGE_LEFT;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0142
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0142
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0142', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0142';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_TRACK_REF;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0143
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0143
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0143', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0143';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SATURATION;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0144
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0144
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0144', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0144';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SCENE_CAPTURE_TYPE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0145
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0145
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0145', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0145';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_DOP;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0146
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0146
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0146', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0146';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.JPEG_INTERCHANGE_FORMAT;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0147
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0147
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0147', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0147';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SCENE_STAGE_CONF;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0148
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0148
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0148', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0148';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.APERTURE_VALUE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0149
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0149
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0149', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0149';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SCENE_SNOW_CONF;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0150
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0150
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0150', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0150';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.CFA_PATTERN;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980123')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0151
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0151
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0151', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0151';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980123')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0152
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0152
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0152', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0152';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_SATELLITES;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980123')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0153
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0153
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0153', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0153';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.COMPOSITE_IMAGE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0154
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0154
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0154', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0154';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.WHITE_BALANCE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0155
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0155
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0155', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0155';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SCENE_BEACH_CONF;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0156
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0156
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0156', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0156';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.DATE_TIME_ORIGINAL;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0157
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0157
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0157', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0157';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.OFFSET_TIME;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0158
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0158
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0158', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0158';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.STANDARD_OUTPUT_SENSITIVITY;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0159
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0159
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0159', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0159';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.CAMERA_OWNER_NAME;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980123')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0160
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0160
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0160', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0160';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SCENE_POINTER;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0161
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0161
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0161', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0161';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_TIME_STAMP;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0162
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0162
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0162', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0162';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_IMG_DIRECTION;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0163
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0163
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0163', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0163';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SCENE_VERSION;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0164
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0164
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0164', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0164';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SCENE_BLUE_SKY_CONF;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980146')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0165
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0165
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0165', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0165';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.METERING_MODE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0166
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0166
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0166', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0166';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.TRANSFER_FUNCTION;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980123')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0167
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0167
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0167', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0167';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.XMAGE_RIGHT;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0168
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0168
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0168', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0168';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.COMPRESSION;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0169
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0169
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0169', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0169';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.ROWS_PER_STRIP;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0170
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0170
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0170', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0170';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.RELATED_SOUND_FILE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980123')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0171
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0171
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0171', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0171';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.IMAGE_UNIQUE_ID;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980123')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0172
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0172
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0172', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0172';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.EXPOSURE_BIAS_VALUE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0173
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0173
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0173', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0173';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.PHOTOMETRIC_INTERPRETATION;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0174
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0174
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0174', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0174';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.USER_COMMENT;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980123')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0175
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0175
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0175', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0175';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.SPATIAL_FREQUENCY_RESPONSE;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980123')
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0176
     * @tc.number SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0176
     * @tc.desc   test image with modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0176', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MODIFY_IMAGE_PROPERTY_S_0176';
      const path = 'test_exif.png'
      let key: image.PropertyKey = image.PropertyKey.GPS_SPEED;
      let value: string = '';
      await modifyImagePropertyTestTwo(done, testName, path, key, value, (errCode: number) => {
        expect(errCode).assertEqual('62980135')
      });
    })
  })
}