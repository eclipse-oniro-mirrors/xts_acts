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
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG } from '../../common';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = LOG_TAG + 'ImageCreator_on';

async function onCallbackTest(done: Function, testName: string, size: image.Size) {
  try {
    const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
    creator.on('imageRelease', (err: BusinessError) => {
      if (err) {
        console.error(TAG, `Failed to get the imageRelease callback.code ${err.code},message is ${err.message}`);
        expect().assertFail();
      } else {
        console.info(TAG, 'Succeeded in getting imageRelease callback.');
      }

      let callbackFunc = () => {
        // do something.
      }
      creator.on('imageRelease', callbackFunc)
      creator.off('imageRelease', callbackFunc)
      done();
    })
    await creator.dequeueImage().then(async (img: image.Image) => {
      //绘制图片。
      await img.getComponent(image.ComponentType.JPEG).then((component: image.Component) => {
        let bufferArr: Uint8Array = new Uint8Array(component.byteBuffer);
        for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 0; //B
          bufferArr[i + 1] = 0; //G
          bufferArr[i + 2] = 255; //R
          bufferArr[i + 3] = 255; //A
        }
      })
      await creator.queueImage(img);
      creator.release();
    })
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function ImageCreatorOnTest() {
  describe('ImageCreatorOnTest', () => {

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
     * @tc.name   ImageCreator_on_callback_001
     * @tc.number IMAGE_CREATOR_ON_001
     * @tc.desc   ImageCreator_on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageCreator_on_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'ImageCreator_on_callback_001';
      const size: image.Size = {
        height: 8192,
        width: 8
      };
      await onCallbackTest(done, testName, size);
    })

    /**
     * @tc.name   ImageCreator_on_callback_002
     * @tc.number IMAGE_CREATOR_ON_002
     * @tc.desc   ImageCreator_on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageCreator_on_callback_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'ImageCreator_on_callback_002';
      const size: image.Size = {
        height: 8,
        width: 8192
      };
      await onCallbackTest(done, testName, size);
    })
  })
}