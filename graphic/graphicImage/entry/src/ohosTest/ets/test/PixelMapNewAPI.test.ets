/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, it, expect, TestType, Level, Size } from "@ohos/hypium"
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import { BusinessError } from '@ohos.base';
import { image } from '@kit.ImageKit';

export default function pixelMapNewAPI() {
  describe('pixelMapNewAPI', ()=> {
    beforeAll(async (done:Function)=> {
      console.info("imagePixelMapTest beforeEach start");
      done();
    });

    /**
     * @tc.number    pixelMapNewAPI_0100
     * @tc.name      pixelMapNewAPI_0100
     * @tc.desc      image pixelMap newAPI
     * @tc.level:    Level 1
     * @tc.size:     MediumTest
     * @tc.type:     Function
     */
    it("pixelMapNewAPI_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } 
      }
      try {
        image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO)
        done();
      } catch(error){
        console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    pixelMapNewAPI_0200
     * @tc.name      pixelMapNewAPI_0200
     * @tc.desc      image pixelMap newAPI
     * @tc.level:    Level 1
     * @tc.size:     MediumTest
     * @tc.type:     Function
     */
    it("pixelMapNewAPI_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } 
      }
      try {
        image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.DMA)
        done();
      } catch(error){
        console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    pixelMapNewAPI_0300
     * @tc.name      pixelMapNewAPI_0300
     * @tc.desc      image pixelMap newAPI
     * @tc.level:    Level 1
     * @tc.size:     MediumTest
     * @tc.type:     Function
     */
    it("pixelMapNewAPI_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } 
      }
      try {
        image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.SHARE_MEMORY)
        done();
      } catch(error){
        console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    pixelMapNewAPI_0400
     * @tc.name      pixelMapNewAPI_0400
     * @tc.desc      image pixelMap newAPI
     * @tc.level:    Level 1
     * @tc.size:     MediumTest
     * @tc.type:     Function
     */
    it("pixelMapNewAPI_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } 
      }
      try {
        image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.SHARE_MEMORY)
        done();
      } catch(error){
        console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    pixelMapNewAPI_0500
     * @tc.name      pixelMapNewAPI_0500
     * @tc.desc      image pixelMap newAPI
     * @tc.level:    Level 1
     * @tc.size:     MediumTest
     * @tc.type:     Function
     */
    it("pixelMapNewAPI_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } 
      }
      try {
        image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA)
        done();
      } catch(error){
        console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    pixelMapNewAPI_0600
     * @tc.name      pixelMapNewAPI_0600
     * @tc.desc      image pixelMap newAPI
     * @tc.level:    Level 1
     * @tc.size:     MediumTest
     * @tc.type:     Function
     */
    it("pixelMapNewAPI_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } 
      }
      try {
        image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO)
        done();
      } catch(error){
        console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    pixelMapNewAPI_0700
     * @tc.name      pixelMapNewAPI_0700
     * @tc.desc      image pixelMap newAPI
     * @tc.level:    Level 1
     * @tc.size:     MediumTest
     * @tc.type:     Function
     */
    it("pixelMapNewAPI_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } 
      }
      try {
        image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.SHARE_MEMORY)
        done();
      } catch(error){
        console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    pixelMapNewAPI_0800
     * @tc.name      pixelMapNewAPI_0800
     * @tc.desc      image pixelMap newAPI
     * @tc.level:    Level 1
     * @tc.size:     MediumTest
     * @tc.type:     Function
     */
    it("pixelMapNewAPI_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } 
      }
      try {
        image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.DMA)
        done();
      } catch(error){
        console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    pixelMapNewAPI_0900
     * @tc.name      pixelMapNewAPI_0900
     * @tc.desc      image pixelMap newAPI
     * @tc.level:    Level 1
     * @tc.size:     MediumTest
     * @tc.type:     Function
     */
    it("pixelMapNewAPI_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } 
      }
      try {
        image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO)
        done();
      } catch(error){
        console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    pixelMapNewAPI_1000
     * @tc.name      pixelMapNewAPI_1000
     * @tc.desc      image pixelMap newAPI
     * @tc.level:    Level 1
     * @tc.size:     MediumTest
     * @tc.type:     Function
     */
    it("pixelMapNewAPI_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      try {
        image.createPixelMapUsingAllocatorSync(null, image.AllocatorType.AUTO)
        expect().assertFail();
        done();
      } catch(error){
        console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect(error.code == 7600201).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    pixelMapNewAPI_1100
     * @tc.name      pixelMapNewAPI_1100
     * @tc.desc      image pixelMap newAPI
     * @tc.level:    Level 1
     * @tc.size:     MediumTest
     * @tc.type:     Function
     */
    it("pixelMapNewAPI_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } 
      }
      try {
        image.createPixelMapUsingAllocatorSync(null, opts, image.AllocatorType.AUTO)
        expect().assertFail();
        done();
      } catch(error){
        console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect(error.code == 7600201).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    pixelMapNewAPI_1200
     * @tc.name      pixelMapNewAPI_1200
     * @tc.desc      image pixelMap newAPI
     * @tc.level:    Level 1
     * @tc.size:     MediumTest
     * @tc.type:     Function
     */
    it("pixelMapNewAPI_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } 
      }
      try {
        image.createPixelMapUsingAllocator(null, opts, image.AllocatorType.AUTO)
        expect().assertFail();
        done();
      } catch(error){
        console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect(error.code == 7600201).assertTrue();
        done();
      }
    });
  })
}