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

const TAG = LOG_TAG + 'modifyImageProperties';

async function modifyImagePropertiesPromiseTest(done: Function, testName: string, pathUri: string,
  keyValues: Record<PropertyKey, string | null>, checkKey: image.PropertyKey[]) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path ='file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource = await image.createImageSource(path);
    await imageSourceApi.modifyImageProperties(keyValues);
    await imageSourceApi.getImageProperties(checkKey);
    imageSourceApi.release();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function modifyImagePropertiesAbnormalPromiseTest(done: Function, testName: string, pathUri: string,
  keyValues: Record<PropertyKey, string | null>, checkKey: image.PropertyKey[]) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path = 'file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource = await image.createImageSource(path);
    await imageSourceApi.modifyImageProperties(keyValues);
    await imageSourceApi.getImageProperties(checkKey);
    imageSourceApi.release();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect(error.code == ErrorCode.PARAM_ERROR_CODE).assertTrue();
    done();
  }
}


export default function imageSourceModifyImagePropertiesTest() {
  describe('imageSourceModifyImagePropertiesTest', () => {

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
     * @tc.name   imageSource_modifyImageProperties_promise_001
     * @tc.number IMAGE_SOURCE_MODIFY_IMAGE_PROPERTIES_001
     * @tc.desc   imageSource_modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_modifyImageProperties_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_modifyImageProperties_promise_001';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let keyValues: Record<PropertyKey, string | null> = {
        [image.PropertyKey.IMAGE_WIDTH]: "1024",
        [image.PropertyKey.IMAGE_LENGTH]: "1024"
      };
      let checkKey = [image.PropertyKey.IMAGE_WIDTH, image.PropertyKey.IMAGE_LENGTH];
      await copyImageToSandbox(fileName, path);
      await modifyImagePropertiesPromiseTest(done, testName, path, keyValues, checkKey);
    })

    /**
     * @tc.name   imageSource_modifyImageProperties_promise_002
     * @tc.number IMAGE_SOURCE_MODIFY_IMAGE_PROPERTIES_002
     * @tc.desc   imageSource_modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_modifyImageProperties_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_modifyImageProperties_promise_002';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let keyValues: Record<PropertyKey, string | null> = {
        [image.PropertyKey.IMAGE_LENGTH]: "1024"
      };
      let checkKey = [image.PropertyKey.IMAGE_WIDTH, image.PropertyKey.IMAGE_LENGTH];
      await copyImageToSandbox(fileName, path);
      await modifyImagePropertiesPromiseTest(done, testName, path, keyValues, checkKey);
    })

    /**
     * @tc.name   imageSource_modifyImageProperties_promise_003
     * @tc.number IMAGE_SOURCE_MODIFY_IMAGE_PROPERTIES_003
     * @tc.desc   imageSource_modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_modifyImageProperties_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_modifyImageProperties_promise_003';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let keyValues: Record<PropertyKey, string | null> = {
        [image.PropertyKey.IMAGE_WIDTH]: "1024"
      };
      let checkKey = [image.PropertyKey.IMAGE_WIDTH, image.PropertyKey.IMAGE_LENGTH];
      await copyImageToSandbox(fileName, path);
      await modifyImagePropertiesPromiseTest(done, testName, path, keyValues, checkKey);
    })

    /**
     * @tc.name   imageSource_modifyImageProperties_promise_004
     * @tc.number IMAGE_SOURCE_MODIFY_IMAGE_PROPERTIES_004
     * @tc.desc   imageSource_modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_modifyImageProperties_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_modifyImageProperties_promise_004';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let keyValues: Record<PropertyKey, string | null> = {
        [image.PropertyKey.X_RESOLUTION]: "1024",
        [image.PropertyKey.Y_RESOLUTION]: "1024"
      };
      let checkKey = [image.PropertyKey.IMAGE_WIDTH, image.PropertyKey.IMAGE_LENGTH];
      await copyImageToSandbox(fileName, path);
      await modifyImagePropertiesPromiseTest(done, testName, path, keyValues, checkKey);
    })

    /**
     * @tc.name   imageSource_modifyImageProperties_promise_005
     * @tc.number IMAGE_SOURCE_MODIFY_IMAGE_PROPERTIES_005
     * @tc.desc   imageSource_modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_modifyImageProperties_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_modifyImageProperties_promise_005';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let keyValues: Record<PropertyKey, string | null> = {
        [image.PropertyKey.Y_RESOLUTION]: "1024"
      };
      let checkKey = [image.PropertyKey.IMAGE_WIDTH, image.PropertyKey.IMAGE_LENGTH];
      await copyImageToSandbox(fileName, path);
      await modifyImagePropertiesPromiseTest(done, testName, path, keyValues, checkKey);
    })

    /**
     * @tc.name   imageSource_modifyImageProperties_promise_006
     * @tc.number IMAGE_SOURCE_MODIFY_IMAGE_PROPERTIES_006
     * @tc.desc   imageSource_modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_modifyImageProperties_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_modifyImageProperties_promise_006';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let keyValues: Record<PropertyKey, string | null> = {
        [image.PropertyKey.X_RESOLUTION]: "1024"
      };
      let checkKey = [image.PropertyKey.IMAGE_WIDTH, image.PropertyKey.IMAGE_LENGTH];
      await copyImageToSandbox(fileName, path);
      await modifyImagePropertiesPromiseTest(done, testName, path, keyValues, checkKey);
    })

    /**
     * @tc.name   imageSource_modifyImageProperties_promise_007
     * @tc.number IMAGE_SOURCE_MODIFY_IMAGE_PROPERTIES_007
     * @tc.desc   imageSource_modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_modifyImageProperties_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_modifyImageProperties_promise_007';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let keyValues: Record<PropertyKey, string | null> = {
        [image.PropertyKey.X_RESOLUTION]: "1024",
        [image.PropertyKey.Y_RESOLUTION]: "1024",
        [image.PropertyKey.IMAGE_WIDTH]: "1024",
        [image.PropertyKey.IMAGE_LENGTH]: "1024"
      };
      let checkKey = [image.PropertyKey.IMAGE_WIDTH, image.PropertyKey.IMAGE_LENGTH];
      await copyImageToSandbox(fileName, path);
      await modifyImagePropertiesPromiseTest(done, testName, path, keyValues, checkKey);
    })

    /**
     * @tc.name   imageSource_modifyImageProperties_abnormal_promise_001
     * @tc.number IMAGE_SOURCE_MODIFY_IMAGE_PROPERTIES_008
     * @tc.desc   imageSource_modifyImageProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_modifyImageProperties_abnormal_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_modifyImageProperties_abnormal_promise_001';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let keyValues: Record<PropertyKey, string | null> = {};
      let checkKey = [image.PropertyKey.IMAGE_WIDTH, image.PropertyKey.IMAGE_LENGTH];
      await copyImageToSandbox(fileName, path);
      await modifyImagePropertiesAbnormalPromiseTest(done, testName, path, keyValues, checkKey);
    })
  })
}