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

const TAG = LOG_TAG + 'updateData';

async function updateDataPromiseTest(done: Function, testName: string, pathUri: string, array: ArrayBuffer,
  isFinished: boolean, offset: number, length: number) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path = 'file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource = await image.createImageSource(path);
    await imageSourceApi.updateData(array, isFinished, offset, length);
    imageSourceApi.release();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function updateDataAbnormalPromiseTest(done: Function, testName: string, pathUri: string, array: ESObject,
  isFinished: ESObject, offset: ESObject, length: ESObject) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path = 'file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource = await image.createImageSource(path);
    await imageSourceApi.updateData(array, isFinished, offset, length);
    imageSourceApi.release();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function updateDataCallbackTest(done: Function, testName: string, pathUri: string, array: ArrayBuffer,
  isFinished: boolean, offset: number, length: number) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path = 'file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource = await image.createImageSource(path);
    imageSourceApi.updateData(array, isFinished, offset, length, (error: BusinessError) => {
      imageSourceApi.release();
      if (error) {
        expect().assertFail();
      } else {
        console.info(`release success`);
      }
      done();
    })
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function updateDataCallbackAbnormalTest(done: Function, testName: string, pathUri: string, array: ESObject,
  isFinished: ESObject, offset: ESObject, length: ESObject) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path = 'file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource = await image.createImageSource(path);
    imageSourceApi.updateData(array, isFinished, offset, length, (error: BusinessError) => {
      imageSourceApi.release();
      if (error) {
        expect().assertFail();
      } else {
        console.info(`release success`);
      }
      done();
    })
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function imageSourceUpdateDataPropertyTest() {
  describe('imageSourceUpdateDataPropertyTest', () => {

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
     * @tc.number    : IMAGE_SOURCE_UPDATE_DATA_001
     * @tc.name      : imageSource_updateData_promise_001
     * @tc.desc      : imageSource_updateData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_updateData_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_updateData_promise_001';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      const array: ArrayBuffer = new ArrayBuffer(100);
      const isFinished = false;
      const offset = 0;
      const length = 10;
      await copyImageToSandbox(fileName, path);
      await updateDataPromiseTest(done, testName, path, array, isFinished, offset, length);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_UPDATE_DATA_002
     * @tc.name      : imageSource_updateData_promise_002
     * @tc.desc      : imageSource_updateData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_updateData_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_updateData_promise_002';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      const array: ArrayBuffer = new ArrayBuffer(100);
      const isFinished = true;
      const offset = 0;
      const length = 10;
      await copyImageToSandbox(fileName, path);
      await updateDataPromiseTest(done, testName, path, array, isFinished, offset, length);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_UPDATE_DATA_003
     * @tc.name      : imageSource_updateData_promise_003
     * @tc.desc      : imageSource_updateData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_updateData_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_updateData_promise_003';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      const array: ArrayBuffer = new ArrayBuffer(100);
      const isFinished = true;
      const offset = 100;
      const length = 100;
      await copyImageToSandbox(fileName, path);
      await updateDataPromiseTest(done, testName, path, array, isFinished, offset, length);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_UPDATE_DATA_004
     * @tc.name      : imageSource_updateData_promise_004
     * @tc.desc      : imageSource_updateData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_updateData_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_updateData_promise_004';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      const array: ArrayBuffer = new ArrayBuffer(9999);
      const isFinished = true;
      const offset = 9999;
      const length = 9999;
      await copyImageToSandbox(fileName, path);
      await updateDataPromiseTest(done, testName, path, array, isFinished, offset, length);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_UPDATE_DATA_005
     * @tc.name      : imageSource_updateData_promise_005
     * @tc.desc      : imageSource_updateData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_updateData_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_updateData_promise_005';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      const array: ArrayBuffer = new ArrayBuffer(100);
      const isFinished = true;
      const offset = 0;
      const length = 0;
      await copyImageToSandbox(fileName, path);
      await updateDataPromiseTest(done, testName, path, array, isFinished, offset, length);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_UPDATE_DATA_006
     * @tc.name      : imageSource_updateData_abnormal_promise_001
     * @tc.desc      : imageSource_updateData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('imageSource_updateData_abnormal_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_updateData_abnormal_promise_001';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      const array: ArrayBuffer = new ArrayBuffer(100);
      const isFinished = true;
      const offset = null;
      const length = null;
      await copyImageToSandbox(fileName, path);
      await updateDataAbnormalPromiseTest(done, testName, path, array, isFinished, offset, length);
    })*/

    /**
     * @tc.number    : IMAGE_SOURCE_UPDATE_DATA_007
     * @tc.name      : imageSource_updateData_abnormal_promise_002
     * @tc.desc      : imageSource_updateData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('imageSource_updateData_abnormal_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_updateData_abnormal_promise_002';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      const array: ArrayBuffer = new ArrayBuffer(100);
      const isFinished = true;
      const offset = undefined;
      const length = undefined;
      await copyImageToSandbox(fileName, path);
      await updateDataAbnormalPromiseTest(done, testName, path, array, isFinished, offset, length);
    })*/

    /**
     * @tc.number    : IMAGE_SOURCE_UPDATE_DATA_008
     * @tc.name      : imageSource_updateData_abnormal_promise_003
     * @tc.desc      : imageSource_updateData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('imageSource_updateData_abnormal_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_updateData_abnormal_promise_003';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      const array: ArrayBuffer = new ArrayBuffer(100);
      const isFinished = undefined;
      const offset = undefined;
      const length = undefined;
      await copyImageToSandbox(fileName, path);
      await updateDataAbnormalPromiseTest(done, testName, path, array, isFinished, offset, length);
    })*/

    /**
     * @tc.number    : IMAGE_SOURCE_UPDATE_DATA_009
     * @tc.name      : imageSource_updateData_abnormal_promise_004
     * @tc.desc      : imageSource_updateData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('imageSource_updateData_abnormal_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_updateData_abnormal_promise_004';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      const array = '汉字';
      const isFinished = '汉字';
      const offset = '汉字';
      const length = '汉字';
      await copyImageToSandbox(fileName, path);
      await updateDataAbnormalPromiseTest(done, testName, path, array, isFinished, offset, length);
    })*/

    /**
     * @tc.number    : IMAGE_SOURCE_UPDATE_DATA_010
     * @tc.name      : imageSource_updateData_callback_001
     * @tc.desc      : imageSource_updateData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_updateData_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_updateData_callback_001';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      const array: ArrayBuffer = new ArrayBuffer(100);
      const isFinished = false;
      const offset = 0;
      const length = 10;
      await copyImageToSandbox(fileName, path);
      await updateDataCallbackTest(done, testName, path, array, isFinished, offset, length);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_UPDATE_DATA_011
     * @tc.name      : imageSource_updateData_callback_002
     * @tc.desc      : imageSource_updateData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_updateData_callback_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_updateData_callback_002';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      const array: ArrayBuffer = new ArrayBuffer(100);
      const isFinished = true;
      const offset = 0;
      const length = 10;
      await copyImageToSandbox(fileName, path);
      await updateDataCallbackTest(done, testName, path, array, isFinished, offset, length);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_UPDATE_DATA_012
     * @tc.name      : imageSource_updateData_callback_003
     * @tc.desc      : imageSource_updateData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_updateData_callback_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_updateData_callback_003';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      const array: ArrayBuffer = new ArrayBuffer(100);
      const isFinished = true;
      const offset = 100;
      const length = 100;
      await copyImageToSandbox(fileName, path);
      await updateDataCallbackTest(done, testName, path, array, isFinished, offset, length);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_UPDATE_DATA_013
     * @tc.name      : imageSource_updateData_callback_004
     * @tc.desc      : imageSource_updateData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_updateData_callback_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_updateData_callback_004';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      const array: ArrayBuffer = new ArrayBuffer(9999);
      const isFinished = true;
      const offset = 9999;
      const length = 9999;
      await copyImageToSandbox(fileName, path);
      await updateDataCallbackTest(done, testName, path, array, isFinished, offset, length);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_UPDATE_DATA_014
     * @tc.name      : imageSource_updateData_callback_005
     * @tc.desc      : imageSource_updateData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_updateData_callback_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_updateData_callback_005';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      const array: ArrayBuffer = new ArrayBuffer(0);
      const isFinished = true;
      const offset = 0;
      const length = 0;
      await copyImageToSandbox(fileName, path);
      await updateDataCallbackTest(done, testName, path, array, isFinished, offset, length);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_UPDATE_DATA_015
     * @tc.name      : imageSource_updateData_callback_abnormal_001
     * @tc.desc      : imageSource_updateData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('imageSource_updateData_callback_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_updateData_callback_abnormal_001';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      const array = undefined;
      const isFinished = undefined;
      const offset = undefined;
      const length = undefined;
      await copyImageToSandbox(fileName, path);
      await updateDataCallbackAbnormalTest(done, testName, path, array, isFinished, offset, length);
    })*/

    /**
     * @tc.number    : IMAGE_SOURCE_UPDATE_DATA_016
     * @tc.name      : imageSource_updateData_callback_abnormal_002
     * @tc.desc      : imageSource_updateData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('imageSource_updateData_callback_abnormal_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_updateData_callback_abnormal_002';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      const array = '汉字';
      const isFinished = '汉字';
      const offset = '汉字';
      const length = '汉字';
      await copyImageToSandbox(fileName, path);
      await updateDataCallbackAbnormalTest(done, testName, path, array, isFinished, offset, length);
    })*/

    /**
     * @tc.number    : IMAGE_SOURCE_UPDATE_DATA_017
     * @tc.name      : imageSource_updateData_callback_abnormal_003
     * @tc.desc      : imageSource_updateData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('imageSource_updateData_callback_abnormal_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_updateData_callback_abnormal_003';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      const array = null;
      const isFinished = null;
      const offset = null;
      const length = null;
      await copyImageToSandbox(fileName, path);
      await updateDataCallbackAbnormalTest(done, testName, path, array, isFinished, offset, length);
    })*/
  })
}