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
import { sendableImage } from '@kit.ImageKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG } from '../../common';

const TAG = LOG_TAG + 'getComponent';

async function getComponentPromiseTest(done: Function, testName: string, size: image.Size) {
  try {
    let receiver: sendableImage.ImageReceiver = sendableImage.createImageReceiver(size, image.ImageFormat.JPEG, 8);
    let img = await receiver.readNextImage();
    img.getComponent(4).then((component: image.Component) => {
      console.info('getComponent succeeded.');
      receiver.release();
      done();
    }).catch((error: BusinessError) => {
      console.error(TAG, `getComponent failed code ${error.code}, message is ${error.message}`);
      expect().assertFail();
      done();
    })
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function sendableGetComponentTest() {
  describe('sendableGetComponentTest', () => {

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
     * @tc.number    : IMAGE_GET_COMPONENT_001
     * @tc.name      : getComponent_sendable_promise_001
     * @tc.desc      : getComponent
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('getComponent_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getComponent_sendable_promise_001';
      let size: image.Size = {
        height: 8192,
        width: 8
      };
      await getComponentPromiseTest(done, testName, size);
    })*/
  })
}