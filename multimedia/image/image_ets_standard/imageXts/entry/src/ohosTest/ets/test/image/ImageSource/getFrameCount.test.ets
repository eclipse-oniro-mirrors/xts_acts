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

const TAG = LOG_TAG + 'getFrameCount';

async function getFrameCountPromiseTest(done: Function, testName: string, pathUri: string) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path = 'file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource = await image.createImageSource(path);
    let frameCount: number = await imageSourceApi.getFrameCount();
    imageSourceApi.release();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function getFrameCountCallbackTest(done: Function, testName: string, pathUri: string) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path = 'file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource = await image.createImageSource(path);
    imageSourceApi.getFrameCount((err: BusinessError, frameCount: number) => {
      imageSourceApi.release();
      if (err) {
        console.error(TAG, `Failed to get frame count.code is ${err.code},message is ${err.message}`);
        expect().assertFail();
      } else {
        console.info(TAG, 'Succeeded in getting frame count.');
      }
    })
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function imageSourceGetFrameCountTest() {
  describe('imageSourceGetFrameCountTest', () => {

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
     * @tc.number    : IMAGE_SOURCE_GET_FRAME_COUNT_001
     * @tc.name      : imageSource_getFrameCount_promise_001
     * @tc.desc      : imageSource_getFrameCount
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getFrameCount_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getFrameCount_promise_001';
      const fileName = 'test6.gif';
      const path = new Date().getTime() +'test6.gif';
      await copyImageToSandbox(fileName, path);
      await getFrameCountPromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_FRAME_COUNT_002
     * @tc.name      : imageSource_getFrameCount_promise_002
     * @tc.desc      : imageSource_getFrameCount
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getFrameCount_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getFrameCount_promise_002';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      await copyImageToSandbox(fileName, path);
      await getFrameCountPromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_FRAME_COUNT_003
     * @tc.name      : imageSource_getFrameCount_promise_003
     * @tc.desc      : imageSource_getFrameCount
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getFrameCount_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getFrameCount_promise_003';
      const fileName = 'test.svg';
      const path = new Date().getTime() + 'test.svg';
      await copyImageToSandbox(fileName, path);
      await getFrameCountPromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_FRAME_COUNT_004
     * @tc.name      : imageSource_getFrameCount_callback_001
     * @tc.desc      : imageSource_getFrameCount
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getFrameCount_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getFrameCount_callback_001';
      const fileName = 'test6.gif';
      const path = new Date().getTime() + 'test6.gif';
      await copyImageToSandbox(fileName, path);
      await getFrameCountCallbackTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_FRAME_COUNT_005
     * @tc.name      : imageSource_getFrameCount_callback_002
     * @tc.desc      : imageSource_getFrameCount
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getFrameCount_callback_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getFrameCount_callback_002';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      await copyImageToSandbox(fileName, path);
      await getFrameCountCallbackTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_GET_FRAME_COUNT_006
     * @tc.name      : imageSource_getFrameCount_callback_003
     * @tc.desc      : imageSource_getFrameCount
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_getFrameCount_callback_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_getFrameCount_promise_003';
      const fileName = 'test.svg';
      const path = new Date().getTime() + 'test.svg';
      await copyImageToSandbox(fileName, path);
      await getFrameCountCallbackTest(done, testName, path);
    })
  })
}