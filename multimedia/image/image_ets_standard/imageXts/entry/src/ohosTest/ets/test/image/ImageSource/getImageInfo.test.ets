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
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = LOG_TAG + 'getImageInfo ';

async function getImageInfoIndexCallbackTest(done: Function, testName: string, pathUri: string, index: number) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path = 'file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource = await image.createImageSource(path);
    imageSourceApi.getImageInfo(index, (error: BusinessError, imageInfo: image.ImageInfo) => {
      if (error) {
        console.error(TAG, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      } else {
        expect(JSON.stringify(imageInfo) !== undefined).assertTrue();
        done();
      }
    })
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function getImageInfoCallbackTest(done: Function, testName: string, pathUri: string) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path = 'file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource = await image.createImageSource(path);
    imageSourceApi.getImageInfo((error: BusinessError, imageInfo: image.ImageInfo) => {
      imageSourceApi.release();
      if (error) {
        console.error(TAG, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      } else {
        expect(JSON.stringify(imageInfo) !== undefined).assertTrue();
        done();
      }
    })
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function getImageInfoPromiseTest(done: Function, testName: string, pathUri: string, index?: number) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path = 'file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource = await image.createImageSource(path);
    const imageInfo: image.ImageInfo = await imageSourceApi.getImageInfo(index)
    imageSourceApi.release();
    expect(imageInfo !== undefined).assertTrue()
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function getImageInfoAbnormalPromiseTest(done: Function, testName: string, pathUri: string, index?: ESObject) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path = 'file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource = await image.createImageSource(path);
    const imageInfo: ESObject = await imageSourceApi.getImageInfo(index)
    imageSourceApi.release();
    expect(imageInfo !== undefined).assertTrue()
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function getImageInfoSyncPromiseTest(done: Function, testName: string, pathUri: string, index?: number) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path = 'file://' + testContext.filesDir + "/" + pathUri;
    let imageSource: image.ImageSource = await image.createImageSource(path);
    let imageInfo: image.ImageInfo = imageSource.getImageInfoSync(index);
    if (imageInfo == undefined) {
      console.error(TAG, 'Failed to obtain the image information.');
      expect().assertFail();
      done();
    } else {
      console.info(TAG, 'Succeeded in obtaining the image information.');
      console.info(TAG, 'imageInfo.size.height:' + imageInfo.size.height);
      console.info(TAG, 'imageInfo.size.width:' + imageInfo.size.width);
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function imageSourceGetImageInfoTest() {
  describe('imageSourceGetImageInfoTest', () => {

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
     * @tc.name   imageSource_getImageInfo_callback_001
     * @tc.number IMAGE_SOURCE_GET_IMAGE_INFO_001
     * @tc.desc   imageSource_getImageInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_getImageInfo_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageInfo_callback_001';
      const fileName = 'test.svg';
      const path = new Date().getTime() + 'test.svg';
      const index = 0;
      await copyImageToSandbox(fileName, path);
      await getImageInfoIndexCallbackTest(done, testName, path, index);
    })

    /**
     * @tc.name   imageSource_getImageInfo_callback_002
     * @tc.number IMAGE_SOURCE_GET_IMAGE_INFO_002
     * @tc.desc   imageSource_getImageInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_getImageInfo_callback_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageInfo_callback_002';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      const index = 0;
      await copyImageToSandbox(fileName, path);
      await getImageInfoIndexCallbackTest(done, testName, path, index);
    })

    /**
     * @tc.name   imageSource_getImageInfo_callback_003
     * @tc.number IMAGE_SOURCE_GET_IMAGE_INFO_003
     * @tc.desc   imageSource_getImageInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_getImageInfo_callback_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageInfo_callback_003';
      const fileName = 'test.svg';
      const path = new Date().getTime() + 'test.svg';
      await copyImageToSandbox(fileName, path);
      await getImageInfoCallbackTest(done, testName, path);
    })

    /**
     * @tc.name   imageSource_getImageInfo_callback_004
     * @tc.number IMAGE_SOURCE_GET_IMAGE_INFO_004
     * @tc.desc   imageSource_getImageInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_getImageInfo_callback_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageInfo_callback_004';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      await copyImageToSandbox(fileName, path);
      await getImageInfoCallbackTest(done, testName, path);
    })

    /**
     * @tc.name   imageSource_getImageInfo_promise_001
     * @tc.number IMAGE_SOURCE_GET_IMAGE_INFO_005
     * @tc.desc   imageSource_getImageInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_getImageInfo_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageInfo_promise_001';
      const fileName = 'test.svg';
      const path = new Date().getTime() + 'test.svg';
      const index = 0;
      await copyImageToSandbox(fileName, path);
      await getImageInfoPromiseTest(done, testName, path, index);
    })

    /**
     * @tc.name   imageSource_getImageInfo_promise_002
     * @tc.number IMAGE_SOURCE_GET_IMAGE_INFO_006
     * @tc.desc   imageSource_getImageInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_getImageInfo_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageInfo_promise_002';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      const index = 0;
      await copyImageToSandbox(fileName, path);
      await getImageInfoPromiseTest(done, testName, path, index);
    })

    /**
     * @tc.name   imageSource_getImageInfo_promise_003
     * @tc.number IMAGE_SOURCE_GET_IMAGE_INFO_007
     * @tc.desc   imageSource_getImageInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_getImageInfo_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageInfo_promise_003';
      const fileName = 'test.svg';
      const path = new Date().getTime() + 'test.svg';
      await copyImageToSandbox(fileName, path);
      await getImageInfoPromiseTest(done, testName, path);
    })

    /**
     * @tc.name   imageSource_getImageInfo_promise_004
     * @tc.number IMAGE_SOURCE_GET_IMAGE_INFO_008
     * @tc.desc   imageSource_getImageInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_getImageInfo_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageInfo_promise_004';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      await copyImageToSandbox(fileName, path);
      await getImageInfoPromiseTest(done, testName, path);
    })

    /**
     * @tc.name   imageSource_getImageInfoSync_promise_001
     * @tc.number IMAGE_SOURCE_GET_IMAGE_INFO_SYNC_001
     * @tc.desc   imageSource_getImageInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_getImageInfoSync_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageInfoSync_promise_001';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      await copyImageToSandbox(fileName, path);
      await getImageInfoSyncPromiseTest(done, testName, path);
    })

    /**
     * @tc.name   imageSource_getImageInfoSync_promise_002
     * @tc.number IMAGE_SOURCE_GET_IMAGE_INFO_SYNC_002
     * @tc.desc   imageSource_getImageInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_getImageInfoSync_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageInfoSync_promise_002';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      const index = 0;
      await copyImageToSandbox(fileName, path);
      await getImageInfoSyncPromiseTest(done, testName, path, index);
    })

    /**
     * @tc.name   imageSource_getImageInfoSync_promise_003
     * @tc.number IMAGE_SOURCE_GET_IMAGE_INFO_SYNC_003
     * @tc.desc   imageSource_getImageInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_getImageInfoSync_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageInfoSync_promise_003';
      const fileName = 'test.svg';
      const path = new Date().getTime() + 'test.svg';
      await copyImageToSandbox(fileName, path);
      await getImageInfoSyncPromiseTest(done, testName, path);
    })

    /**
     * @tc.name   imageSource_getImageInfoSync_promise_004
     * @tc.number IMAGE_SOURCE_GET_IMAGE_INFO_SYNC_004
     * @tc.desc   imageSource_getImageInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSource_getImageInfoSync_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getImageInfoSync_promise_004';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      const index = 0;
      await copyImageToSandbox(fileName, path);
      await getImageInfoSyncPromiseTest(done, testName, path, index);
    })
  })
}