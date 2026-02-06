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
import { sendableImage } from '@kit.ImageKit';

const TAG = LOG_TAG + 'flip';

async function flipTest(done: Function, testName: string,
  horizontal: boolean, vertical: boolean,callback:(isTrue:boolean)=>void) {
  try {
    let opts: image.InitializationOptions =
      { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
    const color: ArrayBuffer = new ArrayBuffer(96);
    let pixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
    console.info(TAG, `pixelMap; success: `, JSON.stringify(pixelMap.getImageInfoSync()));
    if (pixelMap != undefined) {
      await pixelMap.flip(horizontal, vertical);
      callback(true)
      done();
    }else {
      console.info(TAG, `pixelMap=undefined`, testName);
      expect().assertFail();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function sendableImageFlipAbnormal(done: Function, testName: string,
  horizontal: boolean, vertical: boolean,callback:(isTrue:boolean)=>void) {
  try {
    let opts: image.InitializationOptions =
      { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
    const color: ArrayBuffer = new ArrayBuffer(96);
    let pixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
    console.info(TAG, testName, 'pixelMap; success:', JSON.stringify(pixelMap.getImageInfoSync()));
    if (pixelMap != undefined) {
      await pixelMap.flip(horizontal, vertical);
      expect().assertFail();
      done();
    }else {
      console.info(TAG, testName, `pixelMap  is  undefined`);
      expect().assertFail();
    }
  } catch (error) {
    console.info(TAG, testName, 'failed; error:', error,'errorCode:',error.code);
    callback(false)
    done();
  }
}

export default function SendableImageFlipTest() {
  describe('SendableImageFlipTest', () => {

    beforeAll(async () => {
      AppStorage.setOrCreate('keyMap',[1,2,3])
      AppStorage.setOrCreate('keyString','abc')
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
     * @tc.name   SENDABLE_IMAGE_FLIP_TEST_0001
     * @tc.number SUB_MEDIA_SENDABLE_IMAGE_FLIP_TEST_0001
     * @tc.desc   Test flip with Value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_FLIP_TEST_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_FLIP_TEST_0001';
      let horizontal: boolean = true;
      let vertical: boolean = true;
      await flipTest(done, testName, horizontal, vertical,(isTrue)=>{
        expect(isTrue).assertTrue();
      });
    })

    /**
     * @tc.name   SENDABLE_IMAGE_FLIP_TEST_0002
     * @tc.number SUB_MEDIA_SENDABLE_IMAGE_FLIP_TEST_0002
     * @tc.desc   Test flip with Value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_FLIP_TEST_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_FLIP_TEST_0002';
      let horizontal: boolean = false;
      let vertical: boolean = true;
      await flipTest(done, testName, horizontal, vertical,(isTrue)=>{
        expect(isTrue).assertTrue();
      });
    })

    /**
     * @tc.name   SENDABLE_IMAGE_FLIP_TEST_0003
     * @tc.number SUB_MEDIA_SENDABLE_IMAGE_FLIP_TEST_0003
     * @tc.desc   Test flip with Value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_FLIP_TEST_0003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_FLIP_TEST_0003';
      let horizontal: boolean = true;
      let vertical: boolean = false;
      await flipTest(done, testName, horizontal, vertical,(isTrue)=>{
        expect(isTrue).assertTrue();
      });
    })

    /**
     * @tc.name   SENDABLE_IMAGE_FLIP_TEST_0004
     * @tc.number SUB_MEDIA_SENDABLE_IMAGE_FLIP_TEST_0004
     * @tc.desc   Test flip with Value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_FLIP_TEST_0004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_FLIP_TEST_0004';
      let horizontal: boolean = false;
      let vertical: boolean = false;
      await flipTest(done, testName, horizontal, vertical,(isTrue)=>{
        expect(isTrue).assertTrue();
      });
    })

    /**
     * @tc.name   SENDABLE_IMAGE_FLIP_TEST_0005
     * @tc.number SUB_MEDIA_SENDABLE_IMAGE_FLIP_TEST_ERROR_0005
     * @tc.desc   Test flip with Value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_FLIP_TEST_0005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_FLIP_TEST_0005';
      let horizontal: boolean = null as ESObject;
      let vertical: boolean = false;
      await sendableImageFlipAbnormal(done, testName, horizontal, vertical,(isTrue)=>{
        expect(isTrue).assertFalse();
      });
    })

    /**
     * @tc.name   SENDABLE_IMAGE_FLIP_TEST_0006
     * @tc.number SUB_MEDIA_SENDABLE_IMAGE_FLIP_TEST_ERROR_0006
     * @tc.desc   Test flip with Value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_FLIP_TEST_0006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_FLIP_TEST_0006';
      let horizontal: boolean = undefined as ESObject;
      let vertical: boolean = false;
      await sendableImageFlipAbnormal(done, testName, horizontal, vertical,(isTrue)=>{
        expect(isTrue).assertFalse();
      });
    })

    /**
     * @tc.name   SENDABLE_IMAGE_FLIP_TEST_0007
     * @tc.number SUB_MEDIA_SENDABLE_IMAGE_FLIP_TEST_ERROR_0007
     * @tc.desc   Test flip with Value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_FLIP_TEST_0007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_FLIP_TEST_0007';
      let horizontal: boolean = AppStorage.get('keyMap') as ESObject;
      let vertical: boolean = false;
      await sendableImageFlipAbnormal(done, testName, horizontal, vertical,(isTrue)=>{
        expect(isTrue).assertFalse();
      });
    })

    /**
     * @tc.name   SENDABLE_IMAGE_FLIP_TEST_0008
     * @tc.number SUB_MEDIA_SENDABLE_IMAGE_FLIP_TEST_ERROR_0008
     * @tc.desc   Test flip with Value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_FLIP_TEST_0008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_FLIP_TEST_0008';
      let horizontal: boolean = AppStorage.get('keyString') as ESObject;
      let vertical: boolean = false;
      await sendableImageFlipAbnormal(done, testName, horizontal, vertical,(isTrue)=>{
        expect(isTrue).assertFalse();
      });
    })

    /**
     * @tc.name   SENDABLE_IMAGE_FLIP_TEST_0009
     * @tc.number SUB_MEDIA_SENDABLE_IMAGE_FLIP_TEST_ERROR_0009
     * @tc.desc   Test flip with Value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_FLIP_TEST_0009', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_FLIP_TEST_0009';
      let horizontal: boolean = false;
      let vertical: boolean = null as ESObject;
      await sendableImageFlipAbnormal(done, testName, horizontal, vertical,(isTrue)=>{
        expect(isTrue).assertFalse();
      });
    })

    /**
     * @tc.name   SENDABLE_IMAGE_FLIP_TEST_0010
     * @tc.number SUB_MEDIA_SENDABLE_IMAGE_FLIP_TEST_ERROR_0010
     * @tc.desc   Test flip with Value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_FLIP_TEST_0010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_FLIP_TEST_0010';
      let horizontal: boolean = false;
      let vertical: boolean = undefined as ESObject;
      await sendableImageFlipAbnormal(done, testName, horizontal, vertical,(isTrue)=>{
        expect(isTrue).assertFalse();
      });
    })

    /**
     * @tc.name   SENDABLE_IMAGE_FLIP_TEST_0011
     * @tc.number SUB_MEDIA_SENDABLE_IMAGE_FLIP_TEST_ERROR_0011
     * @tc.desc   Test flip with Value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_FLIP_TEST_0011', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_FLIP_TEST_0011';
      let horizontal: boolean = false;
      let vertical: boolean = AppStorage.get('keyMap') as ESObject;
      await sendableImageFlipAbnormal(done, testName, horizontal, vertical,(isTrue)=>{
        expect(isTrue).assertFalse();
      });
    })

    /**
     * @tc.name   SENDABLE_IMAGE_FLIP_TEST_0012
     * @tc.number SUB_MEDIA_SENDABLE_IMAGE_FLIP_TEST_ERROR_0012
     * @tc.desc   Test flip with Value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_FLIP_TEST_0012', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_FLIP_TEST_0012';
      let horizontal: boolean = false;
      let vertical: boolean = AppStorage.get('keyString') as ESObject;
      await sendableImageFlipAbnormal(done, testName, horizontal, vertical,(isTrue)=>{
        expect(isTrue).assertFalse();
      });
    })
  })
}