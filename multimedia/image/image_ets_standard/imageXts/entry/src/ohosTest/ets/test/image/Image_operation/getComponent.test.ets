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
import fs from '@ohos.file.fs';
import { BusinessError } from '@kit.BasicServicesKit';
import { ErrorCode } from '../../CommonErrorCode';

const TAG = LOG_TAG + 'getComponent';

async function getComponentPromiseTest(done: Function, testName: string) {
  try {
    let size: image.Size = {
      height: 8192,
      width: 8
    }
    const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
    creator.dequeueImage((err: BusinessError, img: image.Image) => {
      if (err) {
        console.error(TAG, `Failed to dequeue the Image.code ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      } else {
        img.getComponent(image.ComponentType.JPEG).then(() => {
          console.info(TAG, 'Succeeded in dequeuing the Image.');
          done();
        }).catch((error: BusinessError) => {
          console.error(TAG, `Failed to get the component.code ${error.code},message is ${error.message}`);
          expect().assertFail();
          done();
        })
      }
    })
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function getComponentAbnormalPromiseTest(done: Function, testName: string, ComponentType: image.ComponentType) {
  try {
    let size: image.Size = {
      height: 8192,
      width: 8
    }
    const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
    creator.dequeueImage((err: BusinessError, img: image.Image) => {
      if (err) {
        console.error(TAG, `Failed to dequeue the Image.code ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      } else {
        img.getComponent(ComponentType).then(() => {
          console.info(TAG, 'Succeeded in dequeuing the Image.');
          done();
        }).catch((error: BusinessError) => {
          console.error(TAG, `Failed to get the component.code ${error.code},message is ${error.message}`);
          expect().assertFail();
          done();
        })
      }
    })
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function getComponentCallbackTest(done: Function, testName: string) {
  try {
    let size: image.Size = {
      height: 8192,
      width: 8
    }
    const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
    creator.dequeueImage((err: BusinessError, img: image.Image) => {
      if (err) {
        console.error(TAG, `Failed to dequeue the Image.code ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      } else {
        console.info('Succeeded in dequeuing the Image.');
        img.getComponent(image.ComponentType.JPEG, (error: BusinessError, component: image.Component) => {
          if (err) {
            console.error(TAG, `Failed to get the component.code ${error.code},message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG, 'Succeeded in getting component.');
            done();
          }
        })
      }
    })
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function getComponentAbnormalCallbackTest(done: Function, testName: string, componentType: image.ComponentType) {
  try {
    let size: image.Size = {
      height: 8192,
      width: 8
    }
    const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
    creator.dequeueImage((err: BusinessError, img: image.Image) => {
      if (err) {
        console.error(TAG, `Failed to dequeue the Image.code ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      } else {
        console.info('Succeeded in dequeuing the Image.');
        img.getComponent(componentType, (error: BusinessError, component: image.Component) => {
          if (err) {
            console.error(TAG, `Failed to get the component.code ${error.code},message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG, 'Succeeded in getting component.');
            done();
          }
        })
      }
    })
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function ImageGetComponentTest() {
  describe('ImageGetComponentTest', () => {

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
     * @tc.name      : Image_getComponent_promise_001
     * @tc.desc      : Image_getComponent
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Image_getComponent_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'Image_getComponent_promise_001';
      await getComponentPromiseTest(done, testName);
    })

    /**
     * @tc.number    : IMAGE_GET_COMPONENT_002  //TODO 中断
     * @tc.name      : Image_getComponent_abnormal_promise_001
     * @tc.desc      : Image_getComponent
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('Image_getComponent_abnormal_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'Image_getComponent_abnormal_promise_001';
      const componentType = image.ComponentType.YUV_Y;
      await getComponentAbnormalPromiseTest(done, testName, componentType);
    })*/

    /**
     * @tc.number    : IMAGE_GET_COMPONENT_003  //TODO 中断
     * @tc.name      : Image_getComponent_abnormal_promise_002
     * @tc.desc      : Image_getComponent
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('Image_getComponent_abnormal_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'Image_getComponent_abnormal_promise_002';
      const componentType = image.ComponentType.YUV_U;
      await getComponentAbnormalPromiseTest(done, testName, componentType);
    })*/

    /**
     * @tc.number    : IMAGE_GET_COMPONENT_004  //TODO 中断
     * @tc.name      : Image_getComponent_abnormal_promise_003
     * @tc.desc      : Image_getComponent
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('Image_getComponent_abnormal_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'Image_getComponent_abnormal_promise_003';
      const componentType = image.ComponentType.YUV_V;
      await getComponentAbnormalPromiseTest(done, testName, componentType);
    })*/

    /**
     * @tc.number    : IMAGE_GET_COMPONENT_005
     * @tc.name      : Image_getComponent_callback_001
     * @tc.desc      : Image_getComponent
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Image_getComponent_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'Image_getComponent_callback_001';
      await getComponentCallbackTest(done, testName);
    });

    /**
     * @tc.number    : IMAGE_GET_COMPONENT_006  //TODO 中断
     * @tc.name      : Image_getComponent_abnormal_callback_001
     * @tc.desc      : Image_getComponent
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('Image_getComponent_abnormal_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'Image_getComponent_abnormal_callback_001';
      const componentType = image.ComponentType.YUV_Y;
      await getComponentAbnormalPromiseTest(done, testName, componentType);
    })*/

    /**
     * @tc.number    : IMAGE_GET_COMPONENT_007  //TODO 中断
     * @tc.name      : Image_getComponent_abnormal_callback_002
     * @tc.desc      : Image_getComponent
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('Image_getComponent_abnormal_callback_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'Image_getComponent_abnormal_callback_002';
      const componentType = image.ComponentType.YUV_U;
      await getComponentAbnormalPromiseTest(done, testName, componentType);
    })*/

    /**
     * @tc.number    : IMAGE_GET_COMPONENT_008  //TODO 中断
     * @tc.name      : Image_getComponent_abnormal_callback_003
     * @tc.desc      : Image_getComponent
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('Image_getComponent_abnormal_callback_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'Image_getComponent_abnormal_callback_003';
      const componentType = image.ComponentType.YUV_V;
      await getComponentAbnormalPromiseTest(done, testName, componentType);
    })*/
  })
}