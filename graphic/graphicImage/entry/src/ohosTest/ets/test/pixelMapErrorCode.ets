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
import { Driver, ON } from '@ohos.UiTest';
import { BusinessError } from '@ohos.base';
import { image } from '@kit.ImageKit';
import { taskpoolTest } from '../MainAbility/utils/taskpool'
import resourceManager from '@ohos.resourceManager'
import { rpc } from '@kit.IPCKit';
import { colorSpaceManager } from '@kit.ArkGraphics2D'

class MySequence implements rpc.Parcelable {
  pixel_map: image.PixelMap;
  constructor(conPixelmap: image.PixelMap) {
    this.pixel_map = conPixelmap;
  }
  marshalling(messageSequence: rpc.MessageSequence) {
    this.pixel_map.marshalling(messageSequence);
    return true;
  }
  unmarshalling(messageSequence: rpc.MessageSequence) {
    try {
      let parcel:rpc.MessageSequence = new rpc.MessageSequence();
      this.pixel_map = image.createPixelMapFromParcel(parcel);
      expect().assertFail();
    } catch(e) {
      let error = e as BusinessError;
      console.error(`www data createPixelMapFromParcel error. code is ${error.code}, message is ${error.message}`);
      expect(Number(error.code) == 62980178).assertTrue();
      return false;
    }
    return true;
  }
}

export default function imagePixelMapErrorCodeTest() {
  describe('imagePixelMapErrorCodeTest', ()=> {
    beforeAll(async (done:Function)=> {
      console.info("imagePixelMapTest error code beforeEach start");
      done();
    });

    /**
     * @tc.name   ImagePixelMapErrorCode_0100
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
      image.createPixelMapFromSurface('11111111', region).then(() => {
        console.info('www data Succeeded in creating pixelmap from SurfaceData');
        expect().assertFail();
        done();
      }).catch((error: BusinessError) => {
        console.error(`www data Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        expect(Number(error) == 62980178).assertTrue();
        done();
      });
    });

    /**
     * @tc.name   ImagePixelMapErrorCode_0200
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
      image.createPixelMapFromSurface('11111111', null).then(() => {
        console.info('www data Succeeded in creating pixelmap from SurfaceData');
        expect().assertFail();
        done();
      }).catch((error: BusinessError) => {
        console.error(`www data Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        expect(error.code == 62980105).assertTrue();
        done();
      });
    });

    /**
     * @tc.name   ImagePixelMapErrorCode_0300
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      image.createPixelMapFromSurface('11111111').then(() => {
        console.info('Succeeded in creating pixelmap from SurfaceData');
        expect().assertFail();
        done();
      }).catch((error: BusinessError) => {
        console.error(`www data Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        expect(Number(error) == 62980178).assertTrue();
        done();
      });
    });

    /**
     * @tc.name   ImagePixelMapErrorCode_0400
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let context = getContext();
      let resourceMgr = context.resourceManager;
      const fileData = await resourceMgr.getRawFileContent("512.jpg");
      let bufferData: ArrayBuffer = fileData.buffer.slice(0);
      let imageSource = image.createImageSource(bufferData);
      let pixelMap: PixelMap = imageSource.createPixelMapSync();
      taskpoolTest(pixelMap);
      try {
        let staticMetaData = pixelMap.setTransferDetached(null);
        console.info('Succeeded to setTransferDetached');
        expect().assertFail();
        done();
      } catch(error){
        console.error(`www data Failed to setTransferDetached. code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code) == 501).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   ImagePixelMapErrorCode_0500
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let context = getContext();
      let resourceMgr = context.resourceManager;
      const fileData = await resourceMgr.getRawFileContent("512.jpg");
      let bufferData: ArrayBuffer = fileData.buffer.slice(0);
      let imageSource = image.createImageSource(bufferData);
      let pixelMap: PixelMap = imageSource.createPixelMapSync();
      console.info('www data is true ' + pixelMap.isStrideAlignment);
      taskpoolTest(pixelMap);
      try {
        let staticMetaData = pixelMap.getMetadata(image.HdrMetadataKey.HDR_STATIC_METADATA);
        console.info('Succeeded to getMetaData');
        expect().assertFail();
        done();
      } catch(error){
        console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code) == 501 || Number(error.code) == 62980173).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   ImagePixelMapErrorCode_0600
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let context = getContext();
      let resourceMgr = context.resourceManager;
      const fileData = await resourceMgr.getRawFileContent("512.jpg");
      let bufferData: ArrayBuffer = fileData.buffer.slice(0);
      let imageSource = image.createImageSource(bufferData);
      let pixelMap: PixelMap = imageSource.createPixelMapSync();
      taskpoolTest(pixelMap);
      try {
        let staticMetaData = pixelMap.getMetadata(image.HdrMetadataKey.HDR_STATIC_METADATA);
        console.info('Succeeded to getMetaData');
        expect().assertFail();
        done();
      } catch(error){
        console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code) == 501 || Number(error.code) == 62980173).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   ImagePixelMapErrorCode_0700
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const opts: image.InitializationOptions = { 
        editable: true, pixelFormat: 3, size: { height: 100, width: 100 } 
      }
      let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
      if (pixelMap != undefined) {
        console.info('www data Succeeded in creating pixelMap object.');
        try {
          let staticMetadata = pixelMap.getMetadata(image.HdrMetadataKey.HDR_STATIC_METADATA);
          console.info('www data getMetadata 111');
          expect().assertFail();
        } catch(error) {
          console.info('pixelMap create failed' + error);
          expect(Number(error.code) == 62980173).assertTrue();
          done();
        }
      } else {
        console.info('www data Failed to create pixelMap.');
        done();
      }
    });

    /**
     * @tc.name   ImagePixelMapErrorCode_0800
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let context = getContext();
      let resourceMgr = context.resourceManager;
      const fileData = await resourceMgr.getRawFileContent('512.jpg');
      let bufferData: ArrayBuffer = fileData.buffer.slice(0);
      let imageSource = image.createImageSource(bufferData);
      let pixelMap: PixelMap = imageSource.createPixelMapSync();
      try {
        let staticMetaData = pixelMap.getMetadata(image.HdrMetadataKey.HDR_STATIC_METADATA);
        console.info('Succeeded to getMetaData');
        expect().assertFail();
        done();
      } catch(error){
        console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code) == 62980302 || Number(error.code) == 62980173).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   ImagePixelMapErrorCode_0900
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } 
      }
      let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
      try {
        pixelMap.setMemoryNameSync(null);
        console.info('www data Succeeded to setMemoryNameSync');
        expect().assertFail();
        done();
      } catch(error){
        console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code) == 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   ImagePixelMapErrorCode_1000
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.NV12, size: { height: 4, width: 6 } 
      }
      let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
      try {
        pixelMap.cloneSync();
        console.info('www data Succeeded to cloneSync');
        expect().assertFail();
        done();
      } catch(error){
        console.error(`www data Failed to cloneSync. code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code) == 62980103).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   ImagePixelMapErrorCode_1100
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let context = getContext();
      let resourceMgr = context.resourceManager;
      const fileData = await resourceMgr.getRawFileContent("512.jpg");
      let bufferData: ArrayBuffer = fileData.buffer.slice(0);
      let imageSource = image.createImageSource(bufferData);
      let pixelMap: PixelMap = imageSource.createPixelMapSync();
      taskpoolTest(pixelMap);
      try {
        let staticMetaData = pixelMap.cloneSync();
        console.info('Succeeded to cloneSync');
        expect().assertFail();
        done();
      } catch(error){
        console.error(`www data Failed to cloneSync. code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code) == 501).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   ImagePixelMapErrorCode_1200
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.NV12, size: { height: 4, width: 6 } 
      }
      let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
      try {
        await pixelMap.clone();
        console.info('www data Succeeded to cloneSync');
        expect().assertFail();
        done();
      } catch(error){
        console.error(`www data Failed to cloneSync. code is ${error.code}, message is ${error.message}`);
        expect(Number(error) == 62980104 || Number(error) == 62980103).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   ImagePixelMapErrorCode_1300
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let context = getContext();
      let resourceMgr = context.resourceManager;
      const fileData = await resourceMgr.getRawFileContent("512.jpg");
      let bufferData: ArrayBuffer = fileData.buffer.slice(0);
      let imageSource = image.createImageSource(bufferData);
      let pixelMap: PixelMap = imageSource.createPixelMapSync();
      taskpoolTest(pixelMap);
      try {
        let staticMetaData = await pixelMap.clone();
        console.info('Succeeded to clone');
        expect().assertFail();
        done();
      } catch(error){
        console.error(`www data Failed to clone. code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code) == 501).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   ImagePixelMapErrorCode_1400
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
      try {
        image.createPixelMapFromSurfaceSync('11111111', region);
        console.info('www data Succeeded in creating createPixelMapFromSurfaceSync');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`www data Failed to create createPixelMapFromSurfaceSync. code is ${error.code}`);
        expect(Number(error.code) == 62980178).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   ImagePixelMapErrorCode_1500
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      try {
        image.createPixelMapFromSurfaceSync('11111111', null);
        console.info('www data Succeeded in creating createPixelMapFromSurfaceSync');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`www data Failed to create createPixelMapFromSurfaceSync. code is ${error.code}`);
        expect(Number(error.code) == 401).assertTrue();
        done();
      }
    });
    
    /**
     * @tc.name   ImagePixelMapErrorCode_1600
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      try {
        image.createPixelMapFromSurfaceSync('11111111');
        console.info('www data Succeeded in creating createPixelMapFromSurfaceSync');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`www data Failed to create createPixelMapFromSurfaceSync. code is ${error.code}`);
        expect(Number(error.code) == 62980178).assertTrue();
        done();
      }
    });
    
    /**
     * @tc.name   ImagePixelMapErrorCode_1700
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let img = getContext().resourceManager.getMediaContentSync($r('app.media.app_icon'));
      let imageSource = image.createImageSource(img.buffer.slice(0));
      let decodingOptions: image.DecodingOptions = {
        desiredDynamicRange: image.DecodingDynamicRange.AUTO
      };
      let pixelmap = imageSource.createPixelMapSync(decodingOptions);
      if (pixelmap != undefined) {
        console.info('www data Succeeded in creating pixelMap object.');
        pixelmap.toSdr().then(() => {
          let imageInfo = pixelmap.getImageInfoSync();
          console.info("www data after toSdr ,imageInfo isHdr:" + imageInfo.isHdr);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.error(`www data Failed to set sdr. code is ${error.code}, message is ${error.message}`);
          expect(Number(error.code) == 62980137).assertTrue();
          done();
        });
      } else {
        console.info('Failed to create pixelMap.');
        done();
      }
    });
    
    /**
     * @tc.name   ImagePixelMapErrorCode_1800
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.NV12, size: { height: 4, width: 6 } 
      }
      let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
      taskpoolTest(pixelMap);
      try {
        let imageInfo : image.ImageInfo = pixelMap.getImageInfoSync();
        console.info('Succeeded to imageInfo');
        expect().assertFail();
        done();
      } catch(error){
        console.error(`www data Failed to imageInfo. code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code) == 501).assertTrue();
        done();
      }
    });
    
    /**
     * @tc.name   ImagePixelMapErrorCode_1900
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      
      const color: ArrayBuffer = new ArrayBuffer(96);
      let bufferArr: Uint8Array = new Uint8Array(color);
      for (let i = 0; i < bufferArr.length; i++) {
        bufferArr[i] = 0x80;
      }
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.BGRA_8888,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNPREMUL
      }
      let pixelMap: image.PixelMap | undefined = undefined;
      image.createPixelMap(color, opts).then((srcPixelMap: image.PixelMap) => {
        console.error("www data 11111111");
        pixelMap = srcPixelMap;
        try {
          // 序列化。
          let parcelable: MySequence = new MySequence(pixelMap);
          let data: rpc.MessageSequence = rpc.MessageSequence.create();
          data.writeParcelable(parcelable);

          // 反序列化 rpc获取到data。
          let ret: MySequence = new MySequence(pixelMap);
          data.readParcelable(ret);
          
          // 获取到pixelmap。
          let unmarshPixelmap = ret.pixel_map;
          done();
        }catch(error){
          expect().assertFail();
          done();
        }
      })
    });
    
    /**
     * @tc.name   ImagePixelMapErrorCode_2000
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.RGB_565, size: { height: 4, width: 6 } 
      }
      let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
      let rate: number = 0.5;
      if (pixelMap != undefined) {
        pixelMap.opacity(rate, (err: BusinessError) => {
          if (err) {
            console.error(`www data Failed to set opacity. code is ${err.code}, message is ${err.message}`);
            expect(Number(err) == 62980103).assertTrue();
            done();
          } else {
            console.info("www data Succeeded in setting opacity.");
            expect().assertFail();
            done();
          }
        })
      }
    });
    
    /**
     * @tc.name   ImagePixelMapErrorCode_2100
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 } 
      }
      let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
      let rate: number = 0.5;
      if (pixelMap != undefined) {
        pixelMap.opacity(rate, (err: BusinessError) => {
          if (err) {
            console.error(`www data Failed to set opacity. code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info("www data Succeeded in setting opacity.");
            done();
          }
        })
      }
    });
    
    /**
     * @tc.name   ImagePixelMapErrorCode_2200
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 } 
      }
      let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
      let rate: number = 0.5;
      if (pixelMap != undefined) {
        pixelMap.opacity(rate).then(() => {
          console.info('www data Succeeded in setting opacity.');
          done();
        }).catch((err: BusinessError) => {
          console.error(`www data Failed to set opacity. code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        })
      }
    });
    
    /**
     * @tc.name   ImagePixelMapErrorCode_2300
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 } 
      }
      let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let csm: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
      if (pixelMap != undefined) {
        try {
          pixelMap.setColorSpace(csm);
          console.error('www data succeed in setColorSpace.');
          done();
        } catch(err){
          console.error(`www data Failed to. code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        }
      }
    });
    
    /**
     * @tc.name   ImagePixelMapErrorCode_2400
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 } 
      }
      let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
      if (pixelMap != undefined) {
        try {
          pixelMap.setColorSpace(null);
          expect().assertFail();
          done();
        } catch(err){
          console.error(`www data Failed to. code is ${err.code}, message is ${err.message}`);
          expect(Number(err.code) == 62980115).assertTrue();
          done();
        }
      }
    });
    
    /**
     * @tc.name   ImagePixelMapErrorCode_2500
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 } 
      }
      let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
      let staticMetadata: image.HdrStaticMetadata = {
        displayPrimariesX: [1.1, 1.1, 1.1],
        displayPrimariesY: [1.2, 1.2, 1.2],
        whitePointX: 1.1,
        whitePointY: 1.2,
        maxLuminance: 2.1,
        minLuminance: 1.0,
        maxContentLightLevel: 2.1,
        maxFrameAverageLightLevel: 2.1,
      };
      taskpoolTest(pixelMap);
      if (pixelMap != undefined) {
        pixelMap.setMetadata(image.HdrMetadataKey.HDR_STATIC_METADATA, staticMetadata).then(() => {
          console.info('Succeeded in setting pixelMap metadata.');
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.error(`Failed to set the metadata.code ${error.code},message is ${error.message}`);
          expect(Number(error) == 501).assertTrue();
          done();
        })
      }
    });
    
    /**
     * @tc.name   ImagePixelMapErrorCode_2600
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 } 
      }
      let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let targetColorSpace: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
      if (pixelMap != undefined) {
        pixelMap.applyColorSpace(targetColorSpace, (error: BusinessError) => {
          if (error) {
            console.error(`Failed to apply color space for pixelmap object, error code is ${error}`);
            expect().assertFail();
            done();
          } else {
            console.info('Succeeded in applying color space for pixelmap object.');
            done();
          }
        })
      }
    });
    
    /**
     * @tc.name   ImagePixelMapErrorCode_2700
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 } 
      }
      let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let targetColorSpace: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
      if (pixelMap != undefined) {
        pixelMap.applyColorSpace(targetColorSpace).then(() => {
          console.info('Succeeded in applying color space for pixelmap object.');
          done();
        }).catch((error: BusinessError) => {
          console.error(`Failed to apply color space for pixelmap object, error code is ${error}`);
          expect().assertFail();
          done();
        })
      }
    });
    
    /**
     * @tc.name   ImagePixelMapErrorCode_2800
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 } 
      }
      let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
      if (pixelMap != undefined) {
        pixelMap.applyColorSpace(null, (error: BusinessError) => {
          if (error) {
            console.error(`Failed to apply color space for pixelmap object, error code is ${error}`);
            expect(Number(error) == 62980115).assertTrue();
            done();
          } else {
            console.info('Succeeded in applying color space for pixelmap object.');
            expect().assertFail();
            done();
          }
        })
      }
    });
    
    /**
     * @tc.name   ImagePixelMapErrorCode_2900
     * @tc.number ImagePixelMapTest
     * @tc.desc   image pixelMap error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ImagePixelMapErrorCode_2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 } 
      }
      let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
      if (pixelMap != undefined) {
        pixelMap.applyColorSpace(null).then(() => {
          console.info('Succeeded in applying color space for pixelmap object.');
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.error(`Failed to apply color space for pixelmap object, error code is ${error}`);
          expect(Number(error) == 62980115).assertTrue();
          done();
        })
      }
    });
  })
}