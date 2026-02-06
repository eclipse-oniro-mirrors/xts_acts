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
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = LOG_TAG + 'getDelayTimeList';

async function getDelayTimeListPromiseTest(done: Function, testName: string, pathUri: string) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path = 'file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource = await image.createImageSource(path);
    let delayTimes: Array<number> = await imageSourceApi.getDelayTimeList();
    imageSourceApi.release();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function getDelayTimeListAbnormalPromiseTest(done: Function, testName: string, pathUri: string) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path = 'file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource = await image.createImageSource(path);
    let delayTimes: Array<number> = await imageSourceApi.getDelayTimeList();
    imageSourceApi.release();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    if (error && error.code) {
      expect(error.code == ErrorCode.Invalid_Image_Source || error.code == ErrorCode.Invalid_Media_operation)
        .assertTrue();
      done();
    } else {
      expect(error == ErrorCode.Invalid_Image_Source || error == ErrorCode.Invalid_Media_operation).assertTrue();
      done();
    }
  }
}

async function getDelayTimeListCallbackTest(done: Function, testName: string, pathUri: string) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path = 'file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource = await image.createImageSource(path);
    imageSourceApi.getDelayTimeList((err: BusinessError, delayTimes: Array<number>) => {
      imageSourceApi.release();
      if (err) {
        console.error(TAG, `Failed to get delayTimes object.code is ${err.code},message is ${err.message}`);
        expect().assertFail();
      } else {
        console.info(TAG, 'Succeeded in getting delayTimes object.');
      }
      done();
    })
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function getDelayTimeListCallbackAbnormalTest(done: Function, testName: string, pathUri: string) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path = 'file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource = await image.createImageSource(path);
    imageSourceApi.getDelayTimeList((err: BusinessError, delayTimes: Array<number>) => {
      imageSourceApi.release();
      if (err) {
        console.error(TAG, `Failed to get delayTimes object.code is ${err.code},message is ${err.message}`);
        expect(err.code == ErrorCode.Invalid_Image_Source || err.code == ErrorCode.Invalid_Media_operation)
          .assertTrue();
      } else {
        console.info(TAG, 'Succeeded in getting delayTimes object.');
      }
      done();
    })
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    if (error && error.code) {
      expect(error.code == ErrorCode.Invalid_Image_Source || error.code == ErrorCode.Invalid_Media_operation)
        .assertTrue();
    } else {
      expect(error == ErrorCode.Invalid_Image_Source || error == ErrorCode.Invalid_Media_operation).assertTrue();
    }
    done();
  }
}


export default function imageSourceGetDelayTimeListTest() {
  describe('imageSourceGetDelayTimeListTest', () => {

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
     * @tc.number    : IMAGE_SOURCE_GET_DELAY_TIME_LIST_001
     * @tc.name      : imageSource_getDelayTimeList_promise_001
     * @tc.desc      : imageSource_getDelayTimeList
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getDelayTimeList_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getDelayTimeList_promise_001';
      const fileName = 'test6.gif';
      const path = new Date().getTime() + 'test6.gif';
      await copyImageToSandbox(fileName, path);
      await getDelayTimeListPromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_DELAY_TIME_LIST_002
     * @tc.name      : imageSource_getDelayTimeList_promise_002
     * @tc.desc      : imageSource_getDelayTimeList
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getDelayTimeList_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getDelayTimeList_promise_002';
      const fileName = 'test_exif_empty2.webp';
      const path = new Date().getTime() + 'test_exif_empty2.webp';
      await copyImageToSandbox(fileName, path);
      await getDelayTimeListPromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_DELAY_TIME_LIST_003
     * @tc.name      : imageSource_getDelayTimeList_abnormal_promise_001
     * @tc.desc      : imageSource_getDelayTimeList
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getDelayTimeList_abnormal_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getDelayTimeList_abnormal_promise_001';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      await copyImageToSandbox(fileName, path);
      await getDelayTimeListAbnormalPromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_DELAY_TIME_LIST_004
     * @tc.name      : imageSource_getDelayTimeList_abnormal_promise_002
     * @tc.desc      : imageSource_getDelayTimeList
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getDelayTimeList_abnormal_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getDelayTimeList_abnormal_promise_002';
      const fileName = 'test.svg';
      const path = new Date().getTime() + 'test.svg';
      await copyImageToSandbox(fileName, path);
      await getDelayTimeListAbnormalPromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_DELAY_TIME_LIST_005
     * @tc.name      : imageSource_getDelayTimeList_abnormal_promise_003
     * @tc.desc      : imageSource_getDelayTimeList
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getDelayTimeList_abnormal_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getDelayTimeList_abnormal_promise_003';
      const fileName = 'test7.png';
      const path = new Date().getTime() + 'test7.png';
      await copyImageToSandbox(fileName, path);
      await getDelayTimeListAbnormalPromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_DELAY_TIME_LIST_006
     * @tc.name      : imageSource_getDelayTimeList_abnormal_promise_004
     * @tc.desc      : imageSource_getDelayTimeList
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getDelayTimeList_abnormal_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getDelayTimeList_abnormal_promise_004';
      const fileName = 'test8.bmp';
      const path = new Date().getTime() + 'test8.bmp';
      await copyImageToSandbox(fileName, path);
      await getDelayTimeListAbnormalPromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_DELAY_TIME_LIST_007
     * @tc.name      : imageSource_getDelayTimeList_abnormal_promise_005
     * @tc.desc      : imageSource_getDelayTimeList
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getDelayTimeList_abnormal_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getDelayTimeList_abnormal_promise_005';
      const fileName = 'test_aisr.dng';
      const path = new Date().getTime() + 'test_aisr.dng';
      await copyImageToSandbox(fileName, path);
      await getDelayTimeListAbnormalPromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_DELAY_TIME_LIST_008
     * @tc.name      : imageSource_getDelayTimeList_abnormal_promise_006
     * @tc.desc      : imageSource_getDelayTimeList
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getDelayTimeList_abnormal_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getDelayTimeList_abnormal_promise_006';
      const fileName = 'test_aisr.ico';
      const path = new Date().getTime() + 'test_aisr.ico';
      await copyImageToSandbox(fileName, path);
      await getDelayTimeListAbnormalPromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_DELAY_TIME_LIST_009
     * @tc.name      : imageSource_getDelayTimeList_callback_001
     * @tc.desc      : imageSource_getDelayTimeList
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getDelayTimeList_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getDelayTimeList_callback_001';
      const fileName = 'test6.gif';
      const path = new Date().getTime() + 'test6.gif';
      await copyImageToSandbox(fileName, path);
      await getDelayTimeListCallbackTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_DELAY_TIME_LIST_010
     * @tc.name      : imageSource_getDelayTimeList_callback_002
     * @tc.desc      : imageSource_getDelayTimeList
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getDelayTimeList_callback_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getDelayTimeList_callback_002';
      const fileName = 'test_exif_empty2.webp';
      const path = new Date().getTime() + 'test_exif_empty2.webp';
      await copyImageToSandbox(fileName, path);
      await getDelayTimeListCallbackTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_DELAY_TIME_LIST_011
     * @tc.name      : imageSource_getDelayTimeList_abnormal_callback_003
     * @tc.desc      : imageSource_getDelayTimeList
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getDelayTimeList_abnormal_callback_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getDelayTimeList_abnormal_callback_003';
      const fileName = 'test.svg';
      const path = new Date().getTime() + 'test.svg';
      await copyImageToSandbox(fileName, path);
      await getDelayTimeListCallbackAbnormalTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_DELAY_TIME_LIST_012
     * @tc.name      : imageSource_getDelayTimeList_abnormal_callback_004
     * @tc.desc      : imageSource_getDelayTimeList
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getDelayTimeList_abnormal_callback_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getDelayTimeList_abnormal_callback_004';
      const fileName = 'test7.png';
      const path = new Date().getTime() + 'test7.png';
      await copyImageToSandbox(fileName, path);
      await getDelayTimeListCallbackAbnormalTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_DELAY_TIME_LIST_013
     * @tc.name      : imageSource_getDelayTimeList_abnormal_callback_005
     * @tc.desc      : imageSource_getDelayTimeList
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getDelayTimeList_abnormal_callback_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getDelayTimeList_abnormal_callback_005';
      const fileName = 'test8.bmp';
      const path = new Date().getTime() + 'test8.bmp';
      await copyImageToSandbox(fileName, path);
      await getDelayTimeListCallbackAbnormalTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_DELAY_TIME_LIST_014
     * @tc.name      : imageSource_getDelayTimeList_abnormal_callback_006
     * @tc.desc      : imageSource_getDelayTimeList
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getDelayTimeList_abnormal_callback_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getDelayTimeList_abnormal_callback_006';
      const fileName = 'test_aisr.dng';
      const path = new Date().getTime() + 'test_aisr.dng';
      await copyImageToSandbox(fileName, path);
      await getDelayTimeListCallbackAbnormalTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_DELAY_TIME_LIST_015
     * @tc.name      : imageSource_getDelayTimeList_abnormal_callback_007
     * @tc.desc      : imageSource_getDelayTimeList
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getDelayTimeList_abnormal_callback_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getDelayTimeList_abnormal_callback_007';
      const fileName = 'test_aisr.ico';
      const path = new Date().getTime() + 'test_aisr.ico';
      await copyImageToSandbox(fileName, path);
      await getDelayTimeListCallbackAbnormalTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_DELAY_TIME_LIST_016
     * @tc.name      : imageSource_getDelayTimeList_abnormal_callback_008
     * @tc.desc      : imageSource_getDelayTimeList
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getDelayTimeList_abnormal_callback_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getDelayTimeList_abnormal_callback_008';
      const fileName = 'test6.gif';
      const path = new Date().getTime() + 'test6.gif';
      await copyImageToSandbox(fileName, path);
      await getDelayTimeListCallbackAbnormalTest(done, testName, path);
    })
  })
}