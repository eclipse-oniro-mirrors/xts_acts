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
import { JSON } from '@kit.ArkTS';
const TAG = 'xts.GetImagePropertySuppTest';

export default function GetImagePropertyPNGNullTest() {
  describe('GetImagePropertyPNGNullTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let path = 'test_exif.png';
    let pathUri = `file://${testContext.filesDir}/${path}`;
    let ImageSource: image.ImageSource = image.createImageSource(pathUri);
    console.info(TAG, 'createImageSource success');
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
      ImageSource.release();
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_0100
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_0100
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_0100';
      let key: image.PropertyKey = image.PropertyKey.PIXEL_Y_DIMENSION;
      try {
        let result = await ImageSource.getImageProperty(key, null);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('1920');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_0200
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_0200
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_0200';
      let key: image.PropertyKey = image.PropertyKey.X_RESOLUTION
;
      try {
        let result = await ImageSource.getImageProperty(key, null);
        console.info(TAG, testName, 'getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('72');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_0300
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_0300
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_0300';
      let key: image.PropertyKey = image.PropertyKey.SUBSEC_TIME;
      try {
        let result = await ImageSource.getImageProperty(key, null);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('140');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_0400
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_0400
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_0400';
      let key: image.PropertyKey = image.PropertyKey.PIXEL_Y_DIMENSION;
      try {
        let result = await ImageSource.getImageProperty(key, undefined);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('1920');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_0500
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_0500
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_0500';
      let key: image.PropertyKey = image.PropertyKey.X_RESOLUTION
;
      try {
        let result = await ImageSource.getImageProperty(key, undefined);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('72');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_0600
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_0600
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_0600';
      let key: image.PropertyKey = image.PropertyKey.SUBSEC_TIME;
      try {
        let result = await ImageSource.getImageProperty(key, undefined);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('140');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_0700
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_0700
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_0700';
      let key: image.PropertyKey = image.PropertyKey.REFERENCE_BLACK_WHITE;
      try {
        let result = await ImageSource.getImageProperty(key, null);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect(error.code).assertEqual('62980123');
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_0800
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_0800
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_0800';
      let key: image.PropertyKey = image.PropertyKey.ISO_SPEED_LATITUDE_ZZZ;
      try {
        let result = await ImageSource.getImageProperty(key, null);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect(error.code).assertEqual('62980123');
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_0900
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_0900
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_0900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_0900';
      let key: image.PropertyKey = image.PropertyKey.CUSTOM_RENDERED;
      try {
        let result = await ImageSource.getImageProperty(key, null);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect(error.code).assertEqual('62980123');
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_1000
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_1000
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_1000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_1000';
      let key: image.PropertyKey = image.PropertyKey.REFERENCE_BLACK_WHITE;
      try {
        let result = await ImageSource.getImageProperty(key, undefined);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect(error.code).assertEqual('62980123');
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_1100
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_1100
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_1100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_1100';
      let key: image.PropertyKey = image.PropertyKey.ISO_SPEED_LATITUDE_ZZZ;
      try {
        let result = await ImageSource.getImageProperty(key, undefined);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect(error.code).assertEqual('62980123');
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_1200
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_1200
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_1200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_PNG_1200';
      let key: image.PropertyKey = image.PropertyKey.CUSTOM_RENDERED;
      try {
        let result = await ImageSource.getImageProperty(key, undefined);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect(error.code).assertEqual('62980123');
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_0100
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_0100
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_0100';
      let key: string = "PixelYDimension";
      try {
        let result = await ImageSource.getImageProperty(key, null);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('1920');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_0200
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_0200
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_0200';
      let key: string = "XResolution";
      try {
        let result = await ImageSource.getImageProperty(key, null);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('72');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_0300
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_0300
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_0300';
      let key: string = "SubsecTime";
      try {
        let result = await ImageSource.getImageProperty(key, null);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('140');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_0400
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_0400
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_0400';
      let key: string = "PixelYDimension";
      try {
        let result = await ImageSource.getImageProperty(key, undefined);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('1920');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_0500
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_0500
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_0500';
      let key: string = "XResolution";
      try {
        let result = await ImageSource.getImageProperty(key, undefined);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('72');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_0600
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_0600
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_0600';
      let key: string = "SubsecTime";
      try {
        let result = await ImageSource.getImageProperty(key, undefined);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('140');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_0700
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_0700
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_0700';
      let key: string = "ReferenceBlackWhite";
      try {
        let result = await ImageSource.getImageProperty(key, null);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect(error.code).assertEqual('62980123');
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_0900
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_0900
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_0900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_0900';
      let key: string = "CustomRendered";
      try {
        let result = await ImageSource.getImageProperty(key, null);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect(error.code).assertEqual('62980123');
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_1000
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_1000
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_1000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_1000';
      let key: string = "ReferenceBlackWhite";
      try {
        let result = await ImageSource.getImageProperty(key, undefined);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect(error.code).assertEqual('62980123');
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_1100
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_1100
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_1100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_1100';
      let key: string = "ISOSpeedLatitudezzz";
      try {
        let result = await ImageSource.getImageProperty(key, undefined);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect(error.code).assertEqual('62980123');
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_1200
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_1200
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_1200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_1200';
      let key: string = "CustomRendered";
      try {
        let result = await ImageSource.getImageProperty(key, undefined);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect(error.code).assertEqual('62980123');
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_1300
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_1300
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_1300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_PNG_1300';
      let key: string = "";
      try {
        let result = await ImageSource.getImageProperty(key, { index: 0, defaultValue: '1' });
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('1');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_CALLBACK_PNG_0200
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_CALLBACK_PNG_0200
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_CALLBACK_PNG_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_CALLBACK_PNG_0200';
      let key: string = "";
      console.info(TAG, testName, 'getImageProperty Start ');
      try {
        ImageSource.getImageProperty(key, (error, data: string) => {
          if (error) {
            console.error(TAG, testName, 'getImageProperty Failed', error);
            expect(error != undefined).assertTrue();
          } else {
            console.info(TAG, testName, 'getImageProperty Success:', JSON.stringify(data));
          }
          console.info(TAG, testName, 'getImageProperty exit:');
          done();
        })
      } catch (err) {
        console.error(TAG, testName, 'Callback error:', JSON.stringify(err), err.code);
        expect(err.code).assertUndefined();

        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_PNG_0100
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_PNG_0100
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_PNG_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_PNG_0100';
      let key: string = "PixelYDimension";
      try {
        ImageSource.getImageProperty(key, null, (error, data: string) => {
          if (error) {
            console.error('getImageProperty Failed');
            expect().assertFail();
            done();
          } else {
            console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(data));
            expect(data).assertEqual('1920');
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_PNG_0200
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_PNG_0200
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_PNG_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_PNG_0200';
      let key: string = "XResolution";
      try {
        ImageSource.getImageProperty(key, null, (error, data: string) => {
          if (error) {
            console.error('getImageProperty Failed');
            expect().assertFail();
            done();
          } else {
            console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(data));
            expect(data).assertEqual('72');
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_PNG_0300
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_PNG_0300
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_PNG_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_PNG_0300';
      let key: string = "SubsecTime";
      try {
        ImageSource.getImageProperty(key, null, (error, data: string) => {
          if (error) {
            console.error('getImageProperty Failed');
            expect().assertFail();
            done();
          } else {
            console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(data));
            expect(data).assertEqual('140');
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_PNG_0400
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_PNG_0400
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_PNG_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_PNG_0400';
      let key: string = "PixelYDimension";
      try {
        ImageSource.getImageProperty(key, undefined, (error, data: string) => {
          if (error) {
            console.error('getImageProperty Failed');
            expect().assertFail();
            done();
          } else {
            console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(data));
            expect(data).assertEqual('1920');
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_PNG_0500
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_PNG_0500
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_PNG_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_PNG_0500';
      let key: string = "XResolution";
      try {
        ImageSource.getImageProperty(key, undefined, (error, data: string) => {
          if (error) {
            console.error('getImageProperty Failed');
            expect().assertFail();
            done();
          } else {
            console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(data));
            expect(data).assertEqual('72');
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_PNG_0600
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_PNG_0600
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_PNG_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_PNG_0600';
      let key: string = "SubsecTime";
      try {
        ImageSource.getImageProperty(key, undefined, (error, data: string) => {
          if (error) {
            console.error('getImageProperty Failed');
            expect().assertFail();
            done();
          } else {
            console.info(TAG, testName, 'getImageProperty success ', JSON.stringify(data));
            expect(data).assertEqual('140');
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_PNG_1300
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_PNG_1300
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_PNG_1300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_PNG_1300';
      let key: string = "";
      try {
        ImageSource.getImageProperty(key, { index: 0, defaultValue: '1' }, (error, data: string) => {
          if (error) {
            console.error(TAG, testName, 'getImageProperty Failed1');
            expect(error != undefined).assertTrue();
            done();
          } else {
            console.info(TAG, testName, 'getImageProperty success', JSON.stringify(data));
            expect(data).assertEqual('1');
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect(error.code).assertUndefined();
        done();
      }
    })
  })
}