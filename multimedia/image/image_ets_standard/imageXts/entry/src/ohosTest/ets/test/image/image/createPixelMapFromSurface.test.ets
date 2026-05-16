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
import { ErrorCode } from '../../CommonErrorCode';

const TAG = LOG_TAG + 'createPixelMapFromSurface';

async function createPixelMapFromSurfaceRegionAbnormalPromiseTest(done: Function, testName: string, surfaceId: string) {
  try {
    let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
    await image.createPixelMapFromSurface(surfaceId, region);
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    if (error && error.code) {
      expect(error.code == ErrorCode.Failed_To_Create_PixelMap).assertTrue();
    } else {
      expect(error == ErrorCode.Failed_To_Create_PixelMap).assertTrue();
    }
    done();
  }
}

async function createPixelMapFromSurfaceSyncRegionAbnormalPromiseTest(done: Function, testName: string,
  surfaceId: string) {
  try {
    let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
    image.createPixelMapFromSurfaceSync(surfaceId, region);
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    if (error && error.code) {
      expect(error.code == ErrorCode.Failed_To_Create_PixelMap).assertTrue();
    } else {
      expect(error == ErrorCode.Failed_To_Create_PixelMap).assertTrue();
    }
    done();
  }
}

async function createPixelMapFromSurfaceAbnormalPromiseTest(done: Function, testName: string, surfaceId: string) {
  try {
    await image.createPixelMapFromSurface(surfaceId);
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    if (error && error.code) {
      expect(error.code == ErrorCode.Failed_To_Create_PixelMap).assertTrue();
    } else {
      expect(error == ErrorCode.Failed_To_Create_PixelMap).assertTrue();
    }
    done();
  }
}

async function createPixelMapFromSurfaceSyncAbnormalPromiseTest(done: Function, testName: string, surfaceId: string) {
  try {
    await image.createPixelMapFromSurface(surfaceId);
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    if (error && error.code) {
      expect(error.code == ErrorCode.Failed_To_Create_PixelMap).assertTrue();
    } else {
      expect(error == ErrorCode.Failed_To_Create_PixelMap).assertTrue();
    }
    done();
  }
}


export default function createPixelMapFromSurfaceTest() {
  describe('createPixelMapFromSurfaceTest', () => {

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
     * @tc.name   createPixelMapFromSurface_abnormal_promise_001
     * @tc.number IMAGE_CREATE_PIXEL_MAP_FROM_SURFACE_001  //TODO 返回错误结果格式不对 error为错误码62980178 code为undefined
     * @tc.desc   createPixelMapFromSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapFromSurface_abnormal_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapFromSurface_abnormal_promise_001';
      const surfaceId = '';
      await createPixelMapFromSurfaceRegionAbnormalPromiseTest(done, testName, surfaceId);
    })

    /**
     * @tc.name   createPixelMapFromSurfaceSync_abnormal_promise_001
     * @tc.number IMAGE_CREATE_PIXEL_MAP_FROM_SURFACE_002
     * @tc.desc   createPixelMapFromSurfaceSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapFromSurfaceSync_abnormal_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapFromSurfaceSync_abnormal_promise_001';
      const surfaceId = '';
      await createPixelMapFromSurfaceSyncRegionAbnormalPromiseTest(done, testName, surfaceId);
    })

    /**
     * @tc.name   createPixelMapFromSurface_abnormal_promise_002
     * @tc.number IMAGE_CREATE_PIXEL_MAP_FROM_SURFACE_003  //TODO 返回错误结果格式不对 error为错误码62980178 code为undefined
     * @tc.desc   createPixelMapFromSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapFromSurface_abnormal_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapFromSurface_abnormal_promise_002';
      const surfaceId = '';
      await createPixelMapFromSurfaceAbnormalPromiseTest(done, testName, surfaceId);
    })

    /**
     * @tc.name   createPixelMapFromSurfaceSync_abnormal_promise_002
     * @tc.number IMAGE_CREATE_PIXEL_MAP_FROM_SURFACE_004 //TODO 返回错误结果格式不对 error为错误码62980178 code为undefined
     * @tc.desc   createPixelMapFromSurfaceSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapFromSurfaceSync_abnormal_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapFromSurfaceSync_abnormal_promise_002';
      const surfaceId = '';
      await createPixelMapFromSurfaceSyncAbnormalPromiseTest(done, testName, surfaceId);
    })
  })
}