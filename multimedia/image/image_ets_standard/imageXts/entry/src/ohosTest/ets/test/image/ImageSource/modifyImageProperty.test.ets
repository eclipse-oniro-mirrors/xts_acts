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
import { ErrorCode } from '../../CommonErrorCode';

const TAG = LOG_TAG + 'modifyImageProperty';

async function modifyImagePropertyPromiseTest(done: Function, testName: string, pathUri: string,
  PropertyKey: image.PropertyKey, value: string) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path = 'file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource = await image.createImageSource(path);
    await imageSourceApi.modifyImageProperty(PropertyKey, value);
    let data = await imageSourceApi.getImageProperty(PropertyKey);
    imageSourceApi.release();
    expect(data == value).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function modifyImagePropertyAbnormalPromiseTest(done: Function, testName: string, pathUri: string,
  PropertyKey: ESObject, value: ESObject) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path = 'file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource = await image.createImageSource(path);
    await imageSourceApi.modifyImageProperty(PropertyKey, value);
    let data = await imageSourceApi.getImageProperty(PropertyKey);
    imageSourceApi.release();
    expect(data == value).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect(error.code == ErrorCode.PARAM_ERROR_CODE).assertTrue();
    done();
  }
}

export default function imageSourceModifyImagePropertyTest() {
  describe('imageSourceModifyImagePropertyTest', () => {

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
     * @tc.name   imageSource_modifyImageProperty_promise_001
     * @tc.number IMAGE_SOURCE_MODIFY_IMAGE_PROPERTY_001
     * @tc.desc   imageSource_modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_modifyImageProperty_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_modifyImageProperty_promise_001';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let PropertyKey = image.PropertyKey.IMAGE_WIDTH;
      let value = '120';
      await copyImageToSandbox(fileName, path);
      await modifyImagePropertyPromiseTest(done, testName, path, PropertyKey, value);
    })

    /**
     * @tc.name   imageSource_modifyImageProperty_promise_002
     * @tc.number IMAGE_SOURCE_MODIFY_IMAGE_PROPERTY_002
     * @tc.desc   imageSource_modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_modifyImageProperty_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_modifyImageProperty_promise_002';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let PropertyKey = image.PropertyKey.IMAGE_LENGTH;
      let value = '120';
      await copyImageToSandbox(fileName, path);
      await modifyImagePropertyPromiseTest(done, testName, path, PropertyKey, value);
    })

    /**
     * @tc.name   imageSource_modifyImageProperty_promise_003
     * @tc.number IMAGE_SOURCE_MODIFY_IMAGE_PROPERTY_003
     * @tc.desc   imageSource_modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_modifyImageProperty_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_modifyImageProperty_promise_003';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let PropertyKey = image.PropertyKey.X_RESOLUTION;
      let value = '120';
      await copyImageToSandbox(fileName, path);
      await modifyImagePropertyPromiseTest(done, testName, path, PropertyKey, value);
    })

    /**
     * @tc.name   imageSource_modifyImageProperty_promise_004
     * @tc.number IMAGE_SOURCE_MODIFY_IMAGE_PROPERTY_004
     * @tc.desc   imageSource_modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_modifyImageProperty_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_modifyImageProperty_promise_004';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let PropertyKey = image.PropertyKey.Y_RESOLUTION;
      let value = '120';
      await copyImageToSandbox(fileName, path);
      await modifyImagePropertyPromiseTest(done, testName, path, PropertyKey, value);
    })

    /**
     * @tc.name   imageSource_modifyImageProperty_promise_005
     * @tc.number IMAGE_SOURCE_MODIFY_IMAGE_PROPERTY_005
     * @tc.desc   imageSource_modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_modifyImageProperty_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_modifyImageProperty_promise_005';
      const fileName = 'test7.png';
      const path = new Date().getTime() + 'test7.png'
      let PropertyKey = image.PropertyKey.IMAGE_WIDTH;
      let value = '120';
      await copyImageToSandbox(fileName, path);
      await modifyImagePropertyPromiseTest(done, testName, path, PropertyKey, value);
    })

    /**
     * @tc.name   imageSource_modifyImageProperty_promise_006
     * @tc.number IMAGE_SOURCE_MODIFY_IMAGE_PROPERTY_006
     * @tc.desc   imageSource_modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_modifyImageProperty_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_modifyImageProperty_promise_006';
      const fileName = 'test7.png';
      const path = new Date().getTime() + 'test7.png'
      let PropertyKey = image.PropertyKey.IMAGE_LENGTH;
      let value = '120';
      await copyImageToSandbox(fileName, path);
      await modifyImagePropertyPromiseTest(done, testName, path, PropertyKey, value);
    })

    /**
     * @tc.name   imageSource_modifyImageProperty_promise_007
     * @tc.number IMAGE_SOURCE_MODIFY_IMAGE_PROPERTY_007
     * @tc.desc   imageSource_modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_modifyImageProperty_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_modifyImageProperty_promise_007';
      const fileName = 'test7.png';
      const path = new Date().getTime() + 'test7.png'
      let PropertyKey = image.PropertyKey.X_RESOLUTION;
      let value = '120';
      await copyImageToSandbox(fileName, path);
      await modifyImagePropertyPromiseTest(done, testName, path, PropertyKey, value);
    })

    /**
     * @tc.name   imageSource_modifyImageProperty_promise_008
     * @tc.number IMAGE_SOURCE_MODIFY_IMAGE_PROPERTY_008
     * @tc.desc   imageSource_modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_modifyImageProperty_promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_modifyImageProperty_promise_008';
      const fileName = 'test7.png';
      const path = new Date().getTime() + 'test7.png'
      let PropertyKey = image.PropertyKey.Y_RESOLUTION;
      let value = '120';
      await copyImageToSandbox(fileName, path);
      await modifyImagePropertyPromiseTest(done, testName, path, PropertyKey, value);
    })

    /**
     * @tc.name   imageSource_modifyImageProperty_abnormal_promise_001
     * @tc.number IMAGE_SOURCE_MODIFY_IMAGE_PROPERTY_009
     * @tc.desc   imageSource_modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_modifyImageProperty_abnormal_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_modifyImageProperty_abnormal_promise_001';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg'
      let PropertyKey = image.PropertyKey.Y_RESOLUTION;
      let value = 120;
      await copyImageToSandbox(fileName, path);
      await modifyImagePropertyAbnormalPromiseTest(done, testName, path, PropertyKey, value);
    })

    /**
     * @tc.name   imageSource_modifyImageProperty_abnormal_promise_002
     * @tc.number IMAGE_SOURCE_MODIFY_IMAGE_PROPERTY_010
     * @tc.desc   imageSource_modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_modifyImageProperty_abnormal_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_modifyImageProperty_abnormal_promise_002';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg'
      let PropertyKey = undefined;
      let value = '120';
      await copyImageToSandbox(fileName, path);
      await modifyImagePropertyAbnormalPromiseTest(done, testName, path, PropertyKey, value);
    })

    /**
     * @tc.name   imageSource_modifyImageProperty_abnormal_promise_003
     * @tc.number IMAGE_SOURCE_MODIFY_IMAGE_PROPERTY_011
     * @tc.desc   imageSource_modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_modifyImageProperty_abnormal_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_modifyImageProperty_abnormal_promise_003';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg'
      let PropertyKey = undefined;
      let value = undefined;
      await copyImageToSandbox(fileName, path);
      await modifyImagePropertyAbnormalPromiseTest(done, testName, path, PropertyKey, value);
    })

    /**
     * @tc.name   imageSource_modifyImageProperty_abnormal_promise_004
     * @tc.number IMAGE_SOURCE_MODIFY_IMAGE_PROPERTY_012
     * @tc.desc   imageSource_modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_modifyImageProperty_abnormal_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_modifyImageProperty_abnormal_promise_004';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg'
      let PropertyKey = null;
      let value = null;
      await copyImageToSandbox(fileName, path);
      await modifyImagePropertyAbnormalPromiseTest(done, testName, path, PropertyKey, value);
    })
  })
}