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

export default function GetImagePropertyJPGNullTest() {
  describe('GetImagePropertyJPGNullTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let path = 'test_exif.jpg';
    let pathUri = `file://${testContext.filesDir}/${path}`;
    let ImageSource: image.ImageSource;
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      ImageSource = image.createImageSource(pathUri);
      console.info(TAG, 'createImageSource success',JSON.stringify(ImageSource));
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
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_0100
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_0100
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_0100';
      let key: image.PropertyKey = image.PropertyKey.IMAGE_LENGTH;
      try {
        let result = await ImageSource.getImageProperty(key, null);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('4608');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_0200
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_0200
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_0200';
      let key: image.PropertyKey = image.PropertyKey.IMAGE_WIDTH;
      try {
        let result = await ImageSource.getImageProperty(key, null);
        console.info(TAG, testName, 'getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('3456');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_0300
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_0300
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_0300';
      let key: image.PropertyKey = image.PropertyKey.SUBSEC_TIME;
      try {
        let result = await ImageSource.getImageProperty(key, null);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('543792');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_0400
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_0400
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_0400';
      let key: image.PropertyKey = image.PropertyKey.IMAGE_LENGTH;
      try {
        let result = await ImageSource.getImageProperty(key, undefined);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('4608');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_0500
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_0500
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_0500';
      let key: image.PropertyKey = image.PropertyKey.IMAGE_WIDTH;
      try {
        let result = await ImageSource.getImageProperty(key, undefined);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('3456');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_0600
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_0600
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_0600';
      let key: image.PropertyKey = image.PropertyKey.SUBSEC_TIME;
      try {
        let result = await ImageSource.getImageProperty(key, undefined);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('543792');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_0700
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_0700
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_0700';
      let key: image.PropertyKey = image.PropertyKey.GPS_DEST_BEARING;
      try {
        let result = await ImageSource.getImageProperty(key, null);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('4608');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect(error.code).assertEqual('62980123');
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_0800
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_0800
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_0800';
      let key: image.PropertyKey = image.PropertyKey.FOCAL_PLANE_RESOLUTION_UNIT;
      try {
        let result = await ImageSource.getImageProperty(key, null);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('4608');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect(error.code).assertEqual('62980123');
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_0900
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_0900
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_0900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_0900';
      let key: image.PropertyKey = image.PropertyKey.GPS_DEST_DISTANCE_REF;
      try {
        let result = await ImageSource.getImageProperty(key, null);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('4608');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect(error.code).assertEqual('62980123');
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_1000
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_1000
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_1000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_1000';
      let key: image.PropertyKey = image.PropertyKey.GPS_DEST_BEARING;
      try {
        let result = await ImageSource.getImageProperty(key, undefined);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('4608');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect(error.code).assertEqual('62980123');
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_1100
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_1100
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_1100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_1100';
      let key: image.PropertyKey = image.PropertyKey.FOCAL_PLANE_RESOLUTION_UNIT;
      try {
        let result = await ImageSource.getImageProperty(key, undefined);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('4608');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect(error.code).assertEqual('62980123');
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_1200
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_1200
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_1200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_JPG_1200';
      let key: image.PropertyKey = image.PropertyKey.GPS_DEST_DISTANCE_REF;
      try {
        let result = await ImageSource.getImageProperty(key, undefined);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('4608');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect(error.code).assertEqual('62980123');
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_0100
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_0100
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_0100';
      let key: string = "ImageLength";
      try {
        let result = await ImageSource.getImageProperty(key, null);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('4608');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_0200
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_0200
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_0200';
      let key: string = "ImageWidth";
      try {
        let result = await ImageSource.getImageProperty(key, null);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('3456');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_0300
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_0300
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_0300';
      let key: string = "SubsecTime";
      try {
        let result = await ImageSource.getImageProperty(key, null);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('543792');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_0400
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_0400
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_0400';
      let key: string = "ImageLength";
      try {
        let result = await ImageSource.getImageProperty(key, undefined);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('4608');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_0500
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_0500
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_0500';
      let key: string = "ImageWidth";
      try {
        let result = await ImageSource.getImageProperty(key, undefined);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('3456');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_0600
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_0600
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_0600';
      let key: string = "SubsecTime";
      try {
        let result = await ImageSource.getImageProperty(key, undefined);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('543792');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_0700
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_0700
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_0700';
      let key: string = "GPSDestBearing";
      try {
        let result = await ImageSource.getImageProperty(key, null);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('4608');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect(error.code).assertEqual('62980123');
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_0800
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_0800
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_0800';
      let key: string = "FocalPlaneResolutionUnit";
      try {
        let result = await ImageSource.getImageProperty(key, null);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('4608');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect(error.code).assertEqual('62980123');
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_0900
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_0900
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_0900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_0900';
      let key: string = "GPSDestDistanceRef";
      try {
        let result = await ImageSource.getImageProperty(key, null);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('4608');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect(error.code).assertEqual('62980123');
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_1000
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_1000
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_1000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_1000';
      let key: string = "GPSDestBearing";
      try {
        let result = await ImageSource.getImageProperty(key, undefined);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('4608');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect(error.code).assertEqual('62980123');
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_1100
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_1100
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_1100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_1100';
      let key: string = "FocalPlaneResolutionUnit";
      try {
        let result = await ImageSource.getImageProperty(key, undefined);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('4608');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect(error.code).assertEqual('62980123');
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_1200
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_1200
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_1200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_1200';
      let key: string = "GPSDestDistanceRef";
      try {
        let result = await ImageSource.getImageProperty(key, undefined);
        console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(result));
        expect(result).assertEqual('4608');
        done();
      } catch (error) {
        console.error(TAG, testName, `getImageProperty Failed`, JSON.stringify(error), error.code);
        expect(error.code).assertEqual('62980123');
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_1300
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_1300
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_1300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_KEY_JPG_1300';
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
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_CALLBACK_JPG_0200
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_CALLBACK_JPG_0200
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_CALLBACK_JPG_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_CALLBACK_JPG_0200';
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
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_JPG_0100
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_JPG_0100
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_JPG_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_JPG_0100';
      let key: string = "ImageLength";
      try {
        ImageSource.getImageProperty(key, null, (error, data: string) => {
          if (error) {
            console.error('getImageProperty Failed');
            expect().assertFail();
            done();
          } else {
            console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(data));
            expect(data).assertEqual('4608');
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
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_JPG_0200
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_JPG_0200
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_JPG_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_JPG_0200';
      let key: string = "ImageWidth";
      try {
        ImageSource.getImageProperty(key, null, (error, data: string) => {
          if (error) {
            console.error('getImageProperty Failed');
            expect().assertFail();
            done();
          } else {
            console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(data));
            expect(data).assertEqual('3456');
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
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_JPG_0300
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_JPG_0300
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_JPG_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_JPG_0300';
      let key: string = "SubsecTime";
      try {
        ImageSource.getImageProperty(key, null, (error, data: string) => {
          if (error) {
            console.error('getImageProperty Failed');
            expect().assertFail();
            done();
          } else {
            console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(data));
            expect(data).assertEqual('543792');
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
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_JPG_0400
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_JPG_0400
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_JPG_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_JPG_0400';
      let key: string = "ImageLength";
      try {
        ImageSource.getImageProperty(key, undefined, (error, data: string) => {
          if (error) {
            console.error('getImageProperty Failed');
            expect().assertFail();
            done();
          } else {
            console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(data));
            expect(data).assertEqual('4608');
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
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_JPG_0500
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_JPG_0500
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_JPG_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_JPG_0500';
      let key: string = "ImageWidth";
      try {
        ImageSource.getImageProperty(key, undefined, (error, data: string) => {
          if (error) {
            console.error('getImageProperty Failed');
            expect().assertFail();
            done();
          } else {
            console.info(TAG, testName, ' getImageProperty success ', JSON.stringify(data));
            expect(data).assertEqual('3456');
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
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_JPG_0600
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_JPG_0600
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_JPG_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_JPG_0600';
      let key: string = "SubsecTime";
      try {
        ImageSource.getImageProperty(key, undefined, (error, data: string) => {
          if (error) {
            console.error('getImageProperty Failed');
            expect().assertFail();
            done();
          } else {
            console.info(TAG, testName, 'getImageProperty success ', JSON.stringify(data));
            expect(data).assertEqual('543792');
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
     * @tc.number    SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_JPG_1300
     * @tc.name      SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_JPG_1300
     * @tc.desc      test image with getImageProperty
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_JPG_1300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_GET_IMAGE_PROPERTY_OPTIONS_JPG_1300';
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