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

const TAG = LOG_TAG + 'getImageProperties';

async function getImagePropertiesPromiseTest(done: Function, testName: string, pathUri: string,
  PropertyKey: image.PropertyKey[]) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path = 'file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource = await image.createImageSource(path);
    let data: Record<PropertyKey, string | null> = await imageSourceApi.getImageProperties(PropertyKey);
    imageSourceApi.release();
    expect(data != null).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function getImagePropertiesAbnormalPromiseTest(done: Function, testName: string, pathUri: string,
  PropertyKey: ESObject) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path = 'file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource = await image.createImageSource(path);
    let data: Record<PropertyKey, string | null> = await imageSourceApi.getImageProperties(PropertyKey);
    imageSourceApi.release();
    expect(data != null).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect(error.code == ErrorCode.PARAM_ERROR_CODE).assertTrue();
    done();
  }
}

export default function imageSourceGetImagePropertiesTest() {
  describe('imageSourceGetImagePropertiesTest', () => {

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
     * @tc.name   imageSource_getImageProperties_promise_001
     * @tc.number IMAGE_SOURCE_GET_IMAGE_PROPERTIES_001
     * @tc.desc   imageSource_getImageProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_getImageProperties_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperties_promise_001';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let PropertyKey = [image.PropertyKey.IMAGE_WIDTH, image.PropertyKey.IMAGE_LENGTH];
      await copyImageToSandbox(fileName, path);
      await getImagePropertiesPromiseTest(done, testName, path, PropertyKey);
    })

    /**
     * @tc.name   imageSource_getImageProperties_promise_002
     * @tc.number IMAGE_SOURCE_GET_IMAGE_PROPERTIES_002
     * @tc.desc   imageSource_getImageProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_getImageProperties_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperties_promise_002';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let PropertyKey = [image.PropertyKey.IMAGE_WIDTH];
      await copyImageToSandbox(fileName, path);
      await getImagePropertiesPromiseTest(done, testName, path, PropertyKey);
    })

    /**
     * @tc.name   imageSource_getImageProperties_promise_003
     * @tc.number IMAGE_SOURCE_GET_IMAGE_PROPERTIES_003
     * @tc.desc   imageSource_getImageProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_getImageProperties_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperties_promise_003';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let PropertyKey = [image.PropertyKey.IMAGE_LENGTH];
      await copyImageToSandbox(fileName, path);
      await getImagePropertiesPromiseTest(done, testName, path, PropertyKey);
    })

    /**
     * @tc.name   imageSource_getImageProperties_promise_004
     * @tc.number IMAGE_SOURCE_GET_IMAGE_PROPERTIES_004 //TODO  填入属性值 部分属性值会报错
     * @tc.desc   imageSource_getImageProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imageSource_getImageProperties_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperties_promise_004';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let PropertyKey = [image.PropertyKey.IMAGE_DESCRIPTION];
      await copyImageToSandbox(fileName, path);
      await getImagePropertiesPromiseTest(done, testName, path, PropertyKey);
    })*/

    /**
     * @tc.name   imageSource_getImageProperties_promise_005
     * @tc.number IMAGE_SOURCE_GET_IMAGE_PROPERTIES_005  //TODO  接口文档支持png 但是 会报错 无code
     * @tc.desc   imageSource_getImageProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imageSource_getImageProperties_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperties_promise_005';
      const fileName = 'test7.png';
      const path = new Date().getTime() + 'test7.png';
      let PropertyKey = [image.PropertyKey.IMAGE_LENGTH];
      await copyImageToSandbox(fileName, path);
      await getImagePropertiesPromiseTest(done, testName, path, PropertyKey);
    })*/

    /**
     * @tc.name   imageSource_getImageProperties_abnormal_promise_001
     * @tc.number IMAGE_SOURCE_GET_IMAGE_PROPERTIES_006
     * @tc.desc   imageSource_getImageProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imageSource_getImageProperties_abnormal_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperties_abnormal_promise_001';
      const fileName = 'test6.gif';
      const path = new Date().getTime() + 'test6.gif';
      let PropertyKey = [image.PropertyKey.IMAGE_LENGTH];
      await copyImageToSandbox(fileName, path);
      await getImagePropertiesAbnormalPromiseTest(done, testName, path, PropertyKey);
    })*/

    /**
     * @tc.name   imageSource_getImageProperties_abnormal_promise_002
     * @tc.number IMAGE_SOURCE_GET_IMAGE_PROPERTIES_007
     * @tc.desc   imageSource_getImageProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_getImageProperties_abnormal_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperties_abnormal_promise_002';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let PropertyKey = [];
      await copyImageToSandbox(fileName, path);
      await getImagePropertiesAbnormalPromiseTest(done, testName, path, PropertyKey);
    })

    /**
     * @tc.name   imageSource_getImageProperties_abnormal_promise_003
     * @tc.number IMAGE_SOURCE_GET_IMAGE_PROPERTIES_008
     * @tc.desc   imageSource_getImageProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_getImageProperties_abnormal_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperties_abnormal_promise_003';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let PropertyKey = undefined;
      await copyImageToSandbox(fileName, path);
      await getImagePropertiesAbnormalPromiseTest(done, testName, path, PropertyKey);
    })

    /**
     * @tc.name   imageSource_getImageProperties_abnormal_promise_004
     * @tc.number IMAGE_SOURCE_GET_IMAGE_PROPERTIES_009
     * @tc.desc   imageSource_getImageProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_getImageProperties_abnormal_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageProperties_abnormal_promise_004';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let PropertyKey = null;
      await copyImageToSandbox(fileName, path);
      await getImagePropertiesAbnormalPromiseTest(done, testName, path, PropertyKey);
    })
  })
}