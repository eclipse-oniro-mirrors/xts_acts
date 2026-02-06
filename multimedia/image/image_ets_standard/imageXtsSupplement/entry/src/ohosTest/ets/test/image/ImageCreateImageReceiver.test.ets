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
import { LOG_TAG } from '../common';

const TAG = LOG_TAG + 'createImageReceiver';

async function createImageReceiverTest(done: Function, testName: string, size: image.Size,
  ImageFormat: image.ImageFormat, capacity: number, callback: (receiver: image.ImageReceiver) => void) {
  try {
    let receiver: image.ImageReceiver = image.createImageReceiver(size, ImageFormat, capacity);
    callback(receiver)
    done();
  } catch (error) {
    console.error(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function createImageReceiverAbnormalTest(done: Function, testName: string, size: image.Size,
  ImageFormat: image.ImageFormat, capacity: number, callback: (errorCode: string) => void) {
  try {
    let receiver: image.ImageReceiver = image.createImageReceiver(size, ImageFormat, capacity);
    expect().assertFail();
    done();
  } catch (error) {
    console.error(TAG, `failed; error: ${error},${error.code}`, testName);
    callback(error.code)
    done();
  }
}

export default function ImageCreateImageReceiverPackerTest() {
  describe('ImageCreateImageReceiverPackerTest', () => {

    beforeAll(async () => {
      AppStorage.setOrCreate('keyMap', [])
      AppStorage.setOrCreate('keyString', 'abc')
      console.info(TAG, 'beforeAll case.');
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      AppStorage.delete('keyMap')
      AppStorage.delete('keyString')
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_0001
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_0001
     * @tc.desc   Test createImageReceiver with size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_RECEIVER_TEST_0001';
      let size: image.Size = { height: 8192, width: 8 };
      const ImageFormat = image.ImageFormat.JPEG;
      const capacity = 1
      await createImageReceiverTest(done, testName, size, ImageFormat, capacity, (receiver) => {
        expect(receiver.capacity).assertEqual(capacity);
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_0002
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_0002
     * @tc.desc   Test createImageReceiver with size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_RECEIVER_TEST_0002';
      let size: image.Size = { height: 8192, width: 8 };
      const ImageFormat = image.ImageFormat.JPEG;
      const capacity = 10000000;
      await createImageReceiverTest(done, testName, size, ImageFormat, capacity, (receiver) => {
        expect(receiver.capacity).assertEqual(capacity);
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0003
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0003
     * @tc.desc   Test createImageReceiver with size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0003';
      let size: image.Size = { height: null as ESObject, width: 8 };
      const ImageFormat: image.ImageFormat = image.ImageFormat.JPEG;
      const capacity: number = 100;
      await createImageReceiverAbnormalTest(done, testName, size, ImageFormat, capacity, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0004
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0004
     * @tc.desc   Test createImageReceiver with size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0004';
      let size: image.Size = { height: undefined as ESObject, width: 8 };
      const ImageFormat: image.ImageFormat = image.ImageFormat.JPEG;
      const capacity: number = 100;
      await createImageReceiverAbnormalTest(done, testName, size, ImageFormat, capacity, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0005
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0005
     * @tc.desc   Test createImageReceiver with size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0005';
      let size: image.Size = { height: AppStorage.get('keyMap') as ESObject, width: 8 };
      const ImageFormat: image.ImageFormat = image.ImageFormat.JPEG;
      const capacity: number = 100;
      await createImageReceiverAbnormalTest(done, testName, size, ImageFormat, capacity, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0006
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0006
     * @tc.desc   Test createImageReceiver with size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0006';
      let size: image.Size = { height: AppStorage.get('keyString') as ESObject, width: 8 };
      const ImageFormat: image.ImageFormat = image.ImageFormat.JPEG;
      const capacity: number = 100;
      await createImageReceiverAbnormalTest(done, testName, size, ImageFormat, capacity, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0007
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0007
     * @tc.desc   Test createImageReceiver with size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0007';
      let size: image.Size = { height: 8, width: null as ESObject };
      const ImageFormat: image.ImageFormat = image.ImageFormat.JPEG;
      const capacity: number = 100;
      await createImageReceiverAbnormalTest(done, testName, size, ImageFormat, capacity, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0008
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0008
     * @tc.desc   Test createImageReceiver with size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0008';
      let size: image.Size = { height: 8, width: undefined as ESObject };
      const ImageFormat: image.ImageFormat = image.ImageFormat.JPEG;
      const capacity: number = 100;
      await createImageReceiverAbnormalTest(done, testName, size, ImageFormat, capacity, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0009
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0009
     * @tc.desc   Test createImageReceiver with size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0009', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0009';
      let size: image.Size = { height: 8, width: AppStorage.get('keyMap') as ESObject };
      const ImageFormat: image.ImageFormat = image.ImageFormat.JPEG;
      const capacity: number = 100;
      await createImageReceiverAbnormalTest(done, testName, size, ImageFormat, capacity, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0010
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0010
     * @tc.desc   Test createImageReceiver with size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0010';
      let size: image.Size = { height: 8, width: AppStorage.get('keyString') as ESObject };
      const ImageFormat: image.ImageFormat = image.ImageFormat.JPEG;
      const capacity: number = 100;
      await createImageReceiverAbnormalTest(done, testName, size, ImageFormat, capacity, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0011
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0011
     * @tc.desc   Test createImageReceiver with format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0011', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0011';
      let size: image.Size = { height: 8, width: 8 };
      const ImageFormat: image.ImageFormat = null as ESObject;
      const capacity: number = 100;
      await createImageReceiverAbnormalTest(done, testName, size, ImageFormat, capacity, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0012
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0012
     * @tc.desc   Test createImageReceiver with format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0012', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0012';
      let size: image.Size = { height: 8, width: 8 };
      const ImageFormat: image.ImageFormat = undefined as ESObject;
      const capacity: number = 100;
      await createImageReceiverAbnormalTest(done, testName, size, ImageFormat, capacity, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0013
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0013
     * @tc.desc   Test createImageReceiver with format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0013', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0013';
      let size: image.Size = { height: 8, width: 8 };
      const ImageFormat: image.ImageFormat = AppStorage.get('keyMap') as ESObject;
      const capacity: number = 100;
      await createImageReceiverAbnormalTest(done, testName, size, ImageFormat, capacity, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0014
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0014
     * @tc.desc   Test createImageReceiver with format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0014', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0014';
      let size: image.Size = { height: 8, width: 8 };
      const ImageFormat: image.ImageFormat = AppStorage.get('keyString') as ESObject;
      const capacity: number = 100;
      await createImageReceiverAbnormalTest(done, testName, size, ImageFormat, capacity, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0015
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0015
     * @tc.desc   Test createImageReceiver with format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0015', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0015';
      let size: image.Size = { height: 8, width: 8 };
      const ImageFormat: image.ImageFormat = -1 as ESObject;
      const capacity: number = 100;
      await createImageReceiverAbnormalTest(done, testName, size, ImageFormat, capacity, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0016
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0016
     * @tc.desc   Test createImageReceiver with format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0016', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0016';
      let size: image.Size = { height: 8, width: 8 };
      const ImageFormat: image.ImageFormat = 0 as ESObject;
      const capacity: number = 100;
      await createImageReceiverAbnormalTest(done, testName, size, ImageFormat, capacity, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0017
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0017
     * @tc.desc   Test createImageReceiver with capacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0017', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0017';
      let size: image.Size = { height: 8, width: 8 };
      const ImageFormat: image.ImageFormat = image.ImageFormat.JPEG;
      const capacity: number = null as ESObject;
      await createImageReceiverAbnormalTest(done, testName, size, ImageFormat, capacity, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0018
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0018
     * @tc.desc   Test createImageReceiver with capacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0018', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_00188';
      let size: image.Size = { height: 8, width: 8 };
      const ImageFormat: image.ImageFormat = image.ImageFormat.JPEG;
      const capacity: number = undefined as ESObject;
      await createImageReceiverAbnormalTest(done, testName, size, ImageFormat, capacity, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0019
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0019
     * @tc.desc   Test createImageReceiver with capacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0019', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0019';
      let size: image.Size = { height: 8, width: 8 };
      const ImageFormat: image.ImageFormat = image.ImageFormat.JPEG;
      const capacity: number = AppStorage.get('keyMap') as ESObject;
      await createImageReceiverAbnormalTest(done, testName, size, ImageFormat, capacity, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0020
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0020
     * @tc.desc   Test createImageReceiver with capacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0020', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0020';
      let size: image.Size = { height: 8, width: 8 };
      const ImageFormat: image.ImageFormat = image.ImageFormat.JPEG;
      const capacity: number = AppStorage.get('keyString') as ESObject;
      await createImageReceiverAbnormalTest(done, testName, size, ImageFormat, capacity, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0021
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0021
     * @tc.desc   Test createImageReceiver with size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0021', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0021';
      let size: image.Size = null as ESObject
      const ImageFormat: image.ImageFormat = image.ImageFormat.JPEG;
      const capacity: number = 100;
      await createImageReceiverAbnormalTest(done, testName, size, ImageFormat, capacity, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0022
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0022
     * @tc.desc   Test createImageReceiver with size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0022', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0022';
      let size: image.Size = undefined as ESObject
      const ImageFormat: image.ImageFormat = image.ImageFormat.JPEG;
      const capacity: number = 100;
      await createImageReceiverAbnormalTest(done, testName, size, ImageFormat, capacity, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0023
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0023
     * @tc.desc   Test createImageReceiver with size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0023', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0023';
      let size: image.Size = AppStorage.get('keyMap') as ESObject;
      const ImageFormat: image.ImageFormat = image.ImageFormat.JPEG;
      const capacity: number = 100;
      await createImageReceiverAbnormalTest(done, testName, size, ImageFormat, capacity, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0024
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0024
     * @tc.desc   Test createImageReceiver with size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0024', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_RECEIVER_TEST_ERROR_0024';
      let size: image.Size = AppStorage.get('keyString') as ESObject;
      const ImageFormat: image.ImageFormat = image.ImageFormat.JPEG;
      const capacity: number = 100;
      await createImageReceiverAbnormalTest(done, testName, size, ImageFormat, capacity, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })

  })
}