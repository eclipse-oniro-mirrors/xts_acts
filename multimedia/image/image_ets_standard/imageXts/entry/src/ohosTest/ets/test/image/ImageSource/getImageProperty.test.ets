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

import { image } from '@kit.ImageKit';
import common from '@ohos.app.ability.common';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG, copyImageToSandbox } from '../../common';

const TAG = LOG_TAG + 'getImageProperty';

async function getImagePropertyPromiseTest(done: Function, testName: string, pathUri: string,
  options: image.ImagePropertyOptions, PropertyKey: image.PropertyKey) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path = 'file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource = await image.createImageSource(path);
    let imageProperty: string = await imageSourceApi.getImageProperty(PropertyKey, options);
    imageSourceApi.release();
    expect(imageProperty != options.defaultValue).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function imageSourceGetImagePropertyTest() {
  describe('imageSourceGetImagePropertyTest', () => {

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
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_001
     * @tc.name      : imageSource_getImageProperty_promise_001
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_001';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.BITS_PER_SAMPLE;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_002
     * @tc.name      : imageSource_getImageProperty_promise_002
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_002';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '0' };
      let PropertyKey = image.PropertyKey.BITS_PER_SAMPLE;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_003
     * @tc.name      : imageSource_getImageProperty_promise_003
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_003';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '0' };
      let PropertyKey = image.PropertyKey.ORIENTATION;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_004
     * @tc.name      : imageSource_getImageProperty_promise_004
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_004';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '0' };
      let PropertyKey = image.PropertyKey.IMAGE_LENGTH;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_005
     * @tc.name      : imageSource_getImageProperty_promise_005
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_005';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '0' };
      let PropertyKey = image.PropertyKey.IMAGE_WIDTH;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_006
     * @tc.name      : imageSource_getImageProperty_promise_006
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_006';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '0' };
      let PropertyKey = image.PropertyKey.GPS_LATITUDE;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_007
     * @tc.name      : imageSource_getImageProperty_promise_007
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_007';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '0' };
      let PropertyKey = image.PropertyKey.GPS_LONGITUDE;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_008
     * @tc.name      : imageSource_getImageProperty_promise_008
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_008';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '0' };
      let PropertyKey = image.PropertyKey.GPS_LATITUDE_REF;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_009
     * @tc.name      : imageSource_getImageProperty_promise_009
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_009';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '0' };
      let PropertyKey = image.PropertyKey.GPS_LONGITUDE_REF;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_010
     * @tc.name      : imageSource_getImageProperty_promise_010
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_010';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '0' };
      let PropertyKey = image.PropertyKey.DATE_TIME_ORIGINAL;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_011
     * @tc.name      : imageSource_getImageProperty_promise_011
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_011';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '0' };
      let PropertyKey = image.PropertyKey.EXPOSURE_TIME;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_012
     * @tc.name      : imageSource_getImageProperty_promise_012
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_012';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '0' };
      let PropertyKey = image.PropertyKey.SCENE_TYPE;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_013
     * @tc.name      : imageSource_getImageProperty_promise_013
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_013';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.ISO_SPEED_RATINGS;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_014
     * @tc.name      : imageSource_getImageProperty_promise_014
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_014';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '8888' };
      let PropertyKey = image.PropertyKey.F_NUMBER;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_015
     * @tc.name      : imageSource_getImageProperty_promise_015
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_015';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '888' };
      let PropertyKey = image.PropertyKey.DATE_TIME;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_016
     * @tc.name      : imageSource_getImageProperty_promise_016
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_016';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '666' };
      let PropertyKey = image.PropertyKey.GPS_TIME_STAMP;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_017
     * @tc.name      : imageSource_getImageProperty_promise_017
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_017';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.GPS_DATE_STAMP;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_018
     * @tc.name      : imageSource_getImageProperty_promise_018
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('imageSource_getImageProperty_promise_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_018';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.IMAGE_DESCRIPTION;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })*/

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_019
     * @tc.name      : imageSource_getImageProperty_promise_019
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_019';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.MAKE;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_020
     * @tc.name      : imageSource_getImageProperty_promise_020
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_020', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_020';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.MODEL;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_021
     * @tc.name      : imageSource_getImageProperty_promise_021
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('imageSource_getImageProperty_promise_021', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_021';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.PHOTO_MODE;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })*/

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_022
     * @tc.name      : imageSource_getImageProperty_promise_022
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('imageSource_getImageProperty_promise_022', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_022';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.STANDARD_OUTPUT_SENSITIVITY;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })*/

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_023
     * @tc.name      : imageSource_getImageProperty_promise_023
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('imageSource_getImageProperty_promise_023', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_023';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.RECOMMENDED_EXPOSURE_INDEX;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })*/

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_024
     * @tc.name      : imageSource_getImageProperty_promise_024
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_024', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_024';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.ISO_SPEED;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_025
     * @tc.name      : imageSource_getImageProperty_promise_025
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_025', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_025';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.APERTURE_VALUE;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_026
     * @tc.name      : imageSource_getImageProperty_promise_026
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_026', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_026';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.EXPOSURE_BIAS_VALUE;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_027
     * @tc.name      : imageSource_getImageProperty_promise_027
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_027', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_027';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.METERING_MODE;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_028
     * @tc.name      : imageSource_getImageProperty_promise_028
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_028', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_028';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.LIGHT_SOURCE;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_029
     * @tc.name      : imageSource_getImageProperty_promise_029
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_029', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_029';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.FLASH;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_030
     * @tc.name      : imageSource_getImageProperty_promise_030
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_030', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_030';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.FOCAL_LENGTH;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_031
     * @tc.name      : imageSource_getImageProperty_promise_031
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('imageSource_getImageProperty_promise_031', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_031';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.USER_COMMENT;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })*/

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_032
     * @tc.name      : imageSource_getImageProperty_promise_032
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_032', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_032';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.PIXEL_X_DIMENSION;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_033
     * @tc.name      : imageSource_getImageProperty_promise_033
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_033', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_033';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.PIXEL_Y_DIMENSION;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_034
     * @tc.name      : imageSource_getImageProperty_promise_034
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_034', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_034';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.WHITE_BALANCE;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_035
     * @tc.name      : imageSource_getImageProperty_promise_035
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_035', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_035';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.FOCAL_LENGTH_IN_35_MM_FILM;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_036
     * @tc.name      : imageSource_getImageProperty_promise_036
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_036', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_036';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.CAPTURE_MODE;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_037
     * @tc.name      : imageSource_getImageProperty_promise_037
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_037', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_037';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.PHYSICAL_APERTURE;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_038
     * @tc.name      : imageSource_getImageProperty_promise_038
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_038', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_038';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.ROLL_ANGLE;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_039
     * @tc.name      : imageSource_getImageProperty_promise_039
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_039', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_039';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.PITCH_ANGLE;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_040
     * @tc.name      : imageSource_getImageProperty_promise_040
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_040', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_040';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.SCENE_FOOD_CONF;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_041
     * @tc.name      : imageSource_getImageProperty_promise_041
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('imageSource_getImageProperty_promise_041', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_041';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.SENSITIVITY_TYPE;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })*/

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_042
     * @tc.name      : imageSource_getImageProperty_promise_042
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_042', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_042';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.SCENE_STAGE_CONF;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_043
     * @tc.name      : imageSource_getImageProperty_promise_043
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_043', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_043';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.SCENE_BLUE_SKY_CONF;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_044
     * @tc.name      : imageSource_getImageProperty_promise_044
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_044', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_044';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.SCENE_GREEN_PLANT_CONF;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_045
     * @tc.name      : imageSource_getImageProperty_promise_045
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_045', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_045';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.SCENE_BEACH_CONF;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_046
     * @tc.name      : imageSource_getImageProperty_promise_046
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_046', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_046';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.SCENE_SNOW_CONF;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_047
     * @tc.name      : imageSource_getImageProperty_promise_047
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_047', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_047';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.SCENE_SUNSET_CONF;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_048
     * @tc.name      : imageSource_getImageProperty_promise_048
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_048', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_048';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.SCENE_FLOWERS_CONF;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_049
     * @tc.name      : imageSource_getImageProperty_promise_049
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_049', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_049';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.SCENE_NIGHT_CONF;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_050
     * @tc.name      : imageSource_getImageProperty_promise_050
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_050', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_050';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.SCENE_TEXT_CONF;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_051
     * @tc.name      : imageSource_getImageProperty_promise_051
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_051', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_051';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.FACE_COUNT;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_052
     * @tc.name      : imageSource_getImageProperty_promise_052
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_052', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_052';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.FOCUS_MODE;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_053
     * @tc.name      : imageSource_getImageProperty_promise_053
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_053', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_053';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.COMPRESSION;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_054
     * @tc.name      : imageSource_getImageProperty_promise_054
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('imageSource_getImageProperty_promise_054', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_054';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.PHOTOMETRIC_INTERPRETATION;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })*/

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_055
     * @tc.name      : imageSource_getImageProperty_promise_055
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('imageSource_getImageProperty_promise_055', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_055';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.STRIP_OFFSETS;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })*/

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_056
     * @tc.name      : imageSource_getImageProperty_promise_056
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('imageSource_getImageProperty_promise_056', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_056';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.SAMPLES_PER_PIXEL;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })*/

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_057
     * @tc.name      : imageSource_getImageProperty_promise_057
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('imageSource_getImageProperty_promise_057', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_057';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.ROWS_PER_STRIP;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })*/

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_058
     * @tc.name      : imageSource_getImageProperty_promise_058
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('imageSource_getImageProperty_promise_058', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_058';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.ROWS_PER_STRIP;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })*/

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_059
     * @tc.name      : imageSource_getImageProperty_promise_059
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('imageSource_getImageProperty_promise_059', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_059';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.STRIP_BYTE_COUNTS;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })*/

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_060
     * @tc.name      : imageSource_getImageProperty_promise_060
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_060', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_060';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.X_RESOLUTION;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_061
     * @tc.name      : imageSource_getImageProperty_promise_061
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_061', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_061';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.Y_RESOLUTION;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_062
     * @tc.name      : imageSource_getImageProperty_promise_062
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('imageSource_getImageProperty_promise_062', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_062';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.PLANAR_CONFIGURATION;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })*/

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_063
     * @tc.name      : imageSource_getImageProperty_promise_063
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_063', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_063';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.RESOLUTION_UNIT;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_064
     * @tc.name      : imageSource_getImageProperty_promise_064
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('imageSource_getImageProperty_promise_064', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_064';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.TRANSFER_FUNCTION;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })*/

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_065
     * @tc.name      : imageSource_getImageProperty_promise_065
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getImageProperty_promise_065', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_065';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.SOFTWARE;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_066
     * @tc.name      : imageSource_getImageProperty_promise_066
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*    it('imageSource_getImageProperty_promise_066', Level.LEVEL0, async (done: Function) => {
          const testName = 'imageSource_getImageProperty_promise_066';
          const fileName = 'test.jpeg';
          const path = new Date().getTime() + 'test.jpeg';
          let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
          let PropertyKey = image.PropertyKey.ARTIST;
          await copyImageToSandbox(fileName, path);
          await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
        })*/

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_067
     * @tc.name      : imageSource_getImageProperty_promise_067
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('imageSource_getImageProperty_promise_067', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_067';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.WHITE_POINT;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })*/

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_068
     * @tc.name      : imageSource_getImageProperty_promise_068
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('imageSource_getImageProperty_promise_068', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_068';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.PRIMARY_CHROMATICITIES;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })*/

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_069
     * @tc.name      : imageSource_getImageProperty_promise_069
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('imageSource_getImageProperty_promise_069', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_069';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.YCBCR_COEFFICIENTS;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })*/

    /**
     * @tc.number    : IMAGE_SOURCE_GET_IMAGE_PROPERTY_070
     * @tc.name      : imageSource_getImageProperty_promise_070
     * @tc.desc      : imageSource_getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('imageSource_getImageProperty_promise_070', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperty_promise_070';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' };
      let PropertyKey = image.PropertyKey.YCBCR_SUB_SAMPLING;
      await copyImageToSandbox(fileName, path);
      await getImagePropertyPromiseTest(done, testName, path, options, PropertyKey);
    })*/
  })
}