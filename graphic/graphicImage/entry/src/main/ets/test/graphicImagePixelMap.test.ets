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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import { BusinessError } from '@ohos.base';
import buffer from '@ohos.buffer';
import image from '@ohos.multimedia.image'

import image from '@ohos.multimedia.image';

export default function graphicImagePixelMapTest(context, windowStage, abilityStorage) {
  describe('graphicImagePixelMapTest', function () {
    console.log('describe graphicImagePixelMapTest start!!!')

    const WIDTH = 8192;
    const HEIGHT = 8;
    const CAPACITY = 8;
    const DEVICE_CODE = 801;
    const { JPEG: FORMATJPEG } = image.ImageFormat;

    async function sleep(time) {
      let timeoutId = null;
      let promise = new Promise(resolve => {
        timeoutId = setTimeout(() => {
          resolve('sleep finished');
        }, time);
      })
      let result = await promise;
      clearTimeout(timeoutId)
    }

    let pixel;
    beforeAll(async function () {
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_029
     * @tc.name      : testCreatePixelMapFromSurfaceSync_receiver
     * @tc.desc      :  1.create ImageReceiver
                        2.createPixelMapFromSurfaceSync
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testCreatePixelMapFromSurfaceSync_receiver", 0, async function (done) {
      let msg = '=====testCreatePixelMapFromSurfaceSync_receiver====='
      let size: image.Size = {
        height: 8192,
        width: 8
      }
      let receiver: image.ImageReceiver = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      receiver.getReceivingSurfaceId().then((id) => {
          console.log(msg + ' receiver.getReceivingSurfaceId GO')
          let region = { size: { height: 3, width: 3 }, x: 1, y: 1 };
          try{
              image.createPixelMapFromSurfaceSync(id, region)
              console.log(msg + ' receiver surfaceId Successed in createPixelMapFromSurfaceSync')
              expect().assertFail();
              done();
          }catch (error){
              console.log(msg + ' receiver surfaceId Failed in createPixelMapFromSurfaceSync')
              console.log(msg + ' Example end !')
              expect(true).assertTrue();
              done();
          }
      })
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_030
     * @tc.name      : testSetTransferDetached_1
     * @tc.desc      :  1.create PixelMap
                        2.use SetTransferDetached
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testSetTransferDetached_1", 0, async function (done) {
      let msg = '=====testSetTransferDetached_1====='
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
      let horizontal: boolean = true;
      let vertical: boolean = false;
      let pixelMap: image.PixelMap | undefined = undefined;

      await image.createPixelMap(color, opts).then((pixelMapOK: image.PixelMap) => {
        console.info( msg + ' Succeeded in creating pixelMapOK.');
        pixelMap = pixelMapOK
      }).catch((error: BusinessError) => {
        console.error( msg + ` Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
      try{
        pixelMap.rotate(60)
        console.info( msg + ' Succeeded in rotate pixelMap.');
        try{
          pixelMap.setTransferDetached(true)
          console.info( msg + ' Succeeded in setTransferDetached pixelMap.');
          pixelMap.rotate(180)
          console.info( msg + ' Succeeded in rotate pixelMap.');
          console.log(msg + ' The main process can still invoke pixelmap attributes. Example end !')
          expect(true).assertTrue();
          done();
        }catch(error: BusinessError){
          console.error( msg + ` Failed to setTransferDetached pixelMap. code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        }
      }catch(error: BusinessError){
        console.error( msg + ` Failed to rotate pixelMap. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_031
     * @tc.name      : testSetTransferDetached_2
     * @tc.desc      :  1.create PixelMap
                        2.use SetTransferDetached
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testSetTransferDetached_2", 0, async function (done) {
      let msg = '=====testSetTransferDetached_2====='
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
      let horizontal: boolean = true;
      let vertical: boolean = false;
      let pixelMap: image.PixelMap | undefined = undefined;

      await image.createPixelMap(color, opts).then((pixelMapOK: image.PixelMap) => {
        console.info( msg + ' Succeeded in creating pixelMapOK.');
        pixelMap = pixelMapOK
      }).catch((error: BusinessError) => {
        console.error( msg + ` Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
      try{
        pixelMap.rotate(60)
        console.info( msg + ' Succeeded in rotate pixelMap.');
        try{
          pixelMap.setTransferDetached(false)
          console.info( msg + ' Succeeded in setTransferDetached pixelMap.');
          pixelMap.rotate(180)
          console.info( msg + ' Succeeded in rotate pixelMap.');
          console.log(msg + ' The main process can still invoke pixelmap attributes. Example end !')
          expect(true).assertTrue();
          done();
        }catch(error: BusinessError){
          console.error( msg + ` Failed to setTransferDetached pixelMap. code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        }
      }catch(error: BusinessError){
        console.error( msg + ` Failed to rotate pixelMap. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_032
     * @tc.name      : testHdrMetadataKey_enum
     * @tc.desc      : test Detection Enumeration Values
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testHdrMetadataKey_enum", 0, async function (done) {
      let msg = '=====testHdrMetadataKey_enum====='
      console.log(msg + " Example begin! ")
      try{
        console.log(msg + " image.HdrMetadataKey.HDR_METADATA_TYPE " + image.HdrMetadataKey.HDR_METADATA_TYPE)
        console.log(msg + " image.HdrMetadataKey.HDR_STATIC_METADATA " + image.HdrMetadataKey.HDR_STATIC_METADATA)
        console.log(msg + " image.HdrMetadataKey.HDR_DYNAMIC_METADATA " + image.HdrMetadataKey.HDR_DYNAMIC_METADATA)
        console.log(msg + " image.HdrMetadataKey.HDR_GAINMAP_METADATA " + image.HdrMetadataKey.HDR_GAINMAP_METADATA)
        expect(image.HdrMetadataKey.HDR_METADATA_TYPE).assertEqual(0)
        expect(image.HdrMetadataKey.HDR_STATIC_METADATA).assertEqual(1)
        expect(image.HdrMetadataKey.HDR_DYNAMIC_METADATA).assertEqual(2)
        expect(image.HdrMetadataKey.HDR_GAINMAP_METADATA).assertEqual(3)
        console.log(msg + " Example end! ")
        done();
      }catch(error: BusinessError){
        console.log( msg + ' Faild to HdrMetadataKey enum ' + error)
        console.log( msg + ' Faild to HdrMetadataKey enum ' + JSON.stringify(error))
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_033
     * @tc.name      : testHdrMetadataType_enum
     * @tc.desc      : test Detection Enumeration Values
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testHdrMetadataType_enum", 0, async function (done) {
      let msg = '=====testHdrMetadataType_enum====='
      console.log(msg + " Example begin! ")
      try{
        console.log(msg + " image.HdrMetadataType.NONE " + image.HdrMetadataType.NONE)
        console.log(msg + " image.HdrMetadataType.BASE " + image.HdrMetadataType.BASE)
        console.log(msg + " image.HdrMetadataType.GAINMAP " + image.HdrMetadataType.GAINMAP)
        console.log(msg + " image.HdrMetadataType.ALTERNATE " + image.HdrMetadataType.ALTERNATE)
        expect(image.HdrMetadataType.NONE).assertEqual(0)
        expect(image.HdrMetadataType.BASE).assertEqual(1)
        expect(image.HdrMetadataType.GAINMAP).assertEqual(2)
        expect(image.HdrMetadataType.ALTERNATE).assertEqual(3)
        console.log(msg + " Example end! ")
        done();
      }catch(error: BusinessError){
        console.log( msg + ' Faild to HdrMetadataType enum ' + error)
        console.log( msg + ' Faild to HdrMetadataType enum ' + JSON.stringify(error))
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_034
     * @tc.name      : testSetMetadata_1
     * @tc.desc      :  1.create PixelMap
                        2.use SetMetadata
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testSetMetadata_1", 0, async function (done) {
      let msg = '=====testSetMetadata_1====='
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
      let staticMe: image.HdrStaticMetadata = {
        displayPrimariesX: [1.1, 2.1, 3.1],
        displayPrimariesY: [4.1, 5.1, 6.1],
        whitePointX: 1.1,
        whitePointY: 1.2,
        maxLuminance: 2.1,
        minLuminance: 2.2,
        maxContentLightLevel: 3.1,
        maxFrameAverageLightLevel: 3.2
      }
      
      console.log(msg + " Example begin! ")

      image.createPixelMap(color, opts).then(async (pixelMap: image.PixelMap) => {
        console.info( msg + ' Succeeded in creating pixelMap.');
        try{
          let context1 = getContext()
          console.info( msg + ' 0 ');
          const resourceMgr = context1.resourceManager
          console.info( msg + ' 1 ');
          console.info( msg + ' 1 resourceMgr: ' + resourceMgr);
          console.info( msg + ' 1 resourceMgr: ' + JSON.stringify(resourceMgr));
          // const fileData = await resourceMgr.getRawFileContent('icon.png')
          const fileData = await resourceMgr.getMediaContent($r('app.media.icon'))
          console.info( msg + ' 2 ');
          const buffer = fileData.buffer
          console.info( msg + ' 3 ');
          const imageSource = image.createImageSource(buffer)
          console.info( msg + ' 4 ');
          let decodingOptions: image.DecodingOptions = {
            desiredSize: { width: 512, height:512 },
            desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
            desiredDynamicRange: image.DecodingDynamicRange.HDR
          }
          console.info( msg + ' 5 ');
          pixelMap = imageSource.createPixelMapSync(decodingOptions)
          console.info( msg + ' 6 ');
          await pixelMap.setMetadata(1, staticMe)
          console.info( msg + ' Succeeded in pixelMap.setMetadata.');
          console.log(msg + ' Example end !')
          expect(true).assertTrue();
          done();
        }catch(error){
          if(error == 62980173){
            console.info( msg + ' The DMA memory does not exist. ');
            console.log(msg + ' Example end !')
            expect(true).assertTrue();
            done();
          }else{
            console.info( msg + ' Faild in pixelMap.setMetadata.' + error);
            console.info( msg + ' Faild in pixelMap.setMetadata.' + JSON.stringify(error));
            expect().assertFail();
            done();
          }
        }
      }).catch((error: BusinessError) => {
        console.error( msg + ` Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_035
     * @tc.name      : testSetMetadata_2
     * @tc.desc      :  1.create PixelMap
                        2.use SetMetadata
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testSetMetadata_2", 0, async function (done) {
      let msg = '=====testSetMetadata_2====='
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
      let channels1: image.GainmapChannel = {
        gainmapMax: 7.1,
        gainmapMin: 7.2,
        gamma: 7.3,
        baseOffset: 7.4, 
        alternateOffset: 7.5 
      }
      let channels2: image.GainmapChannel = {
        gainmapMax: 8.1,
        gainmapMin: 8.2,
        gamma: 8.3,
        baseOffset: 8.4, 
        alternateOffset: 8.5 
      }
      let gain: image.HdrGainmapMetadata = {
        writerVersion: 10,
        miniVersion: 11,
        gainmapChannelCount: 12,
        useBaseColorFlag: true,
        baseHeadroom: 5.1,
        alternateHeadroom: 5.2,
        channels: [ channels1, channels2 ]
      }

      console.log(msg + " Example begin! ")

      image.createPixelMap(color, opts).then(async (pixelMap: image.PixelMap) => {
        console.info( msg + ' Succeeded in creating pixelMap.');
        try{
          let context1 = getContext()
          console.info( msg + ' 0 ');
          const resourceMgr = context1.resourceManager
          console.info( msg + ' 1 ');
          console.info( msg + ' 1 resourceMgr: ' + resourceMgr);
          console.info( msg + ' 1 resourceMgr: ' + JSON.stringify(resourceMgr));
          // const fileData = await resourceMgr.getRawFileContent('icon.png')
          const fileData = await resourceMgr.getMediaContent($r('app.media.icon'))
          console.info( msg + ' 2 ');
          const buffer = fileData.buffer
          console.info( msg + ' 3 ');
          const imageSource = image.createImageSource(buffer)
          console.info( msg + ' 4 ');
          let decodingOptions: image.DecodingOptions = {
            desiredSize: { width: 512, height:512 },
            desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
            desiredDynamicRange: image.DecodingDynamicRange.HDR
          }
          console.info( msg + ' 5 ');
          pixelMap = imageSource.createPixelMapSync(decodingOptions)
          console.info( msg + ' 6 ');
          await pixelMap.setMetadata(3, gain)
          console.info( msg + ' Succeeded in pixelMap.setMetadata.');
          console.log(msg + ' Example end !')
          expect(true).assertTrue();
          done();
        }catch(error){
          if(error == 62980173){
            console.info( msg + ' The DMA memory does not exist. ');
            console.log(msg + ' Example end !')
            expect(true).assertTrue();
            done();
          }else{
            console.info( msg + ' Faild in pixelMap.setMetadata.' + error);
            console.info( msg + ' Faild in pixelMap.setMetadata.' + JSON.stringify(error));
            expect().assertFail();
            done();
          }
        }
      }).catch((error: BusinessError) => {
        console.error( msg + ` Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_036
     * @tc.name      : testAntiAliasingLevel_enum
     * @tc.desc      :  1.create PixelMap
                        2.scale the pixelMap by three parameter, key is AntiAliasingLevel
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testAntiAliasingLevel_enum", 0, async function (done) {
      let msg = '=====testAntiAliasingLevel_enum====='
      console.log(msg + " Example begin! ")
      try{
        console.log(msg + " image.AntiAliasingLevel.NONE " + image.AntiAliasingLevel.NONE)
        console.log(msg + " image.AntiAliasingLevel.LOW " + image.AntiAliasingLevel.LOW)
        console.log(msg + " image.AntiAliasingLevel.MEDIUM " + image.AntiAliasingLevel.MEDIUM)
        console.log(msg + " image.AntiAliasingLevel.HIGH " + image.AntiAliasingLevel.HIGH)
        expect(image.AntiAliasingLevel.NONE).assertEqual(0)
        expect(image.AntiAliasingLevel.LOW).assertEqual(1)
        expect(image.AntiAliasingLevel.MEDIUM).assertEqual(2)
        expect(image.AntiAliasingLevel.HIGH).assertEqual(3)
        console.log(msg + ' Example end !')
        done();
      }catch(error: BusinessError){
        console.error( msg + ` Failed to AntiAliasingLevel enum. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_037
     * @tc.name      : testAntiAliasingLevel
     * @tc.desc      :  1.create PixelMap
                        2.scale the pixelMap by three parameter, key is AntiAliasingLevel
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testAntiAliasingLevel", 0, async function (done) {
      let msg = '=====testAntiAliasingLevel====='
      console.log(msg + " Example begin! ")
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
      await image.createPixelMap(color, opts).then((pixelMap: image.PixelMap) => {
        console.info( msg + ' Succeeded in creating pixelMap.');
        try{
          pixelMap.scale( 1, 2, image.AntiAliasingLevel.MEDIUM)
          console.info( msg + ' Succeeded in scale pixelMap.');
          console.log(msg + ' Example end !')
          expect(true).assertTrue();
          done();
        }catch(error: BusinessError){
          console.error( msg + ` Failed to scale pixelMap. code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        }
      }).catch((error: BusinessError) => {
        console.error( msg + ` Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_038
     * @tc.name      : testGetMetadata
     * @tc.desc      :  1.create PixelMap
                        2.use SetMetadata
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testGetMetadata", 0, function (done) {
      let msg = '=====testGetMetadata====='
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
      let channels1: image.GainmapChannel = {
        gainmapMax: 7.1,
        gainmapMin: 7.2,
        gamma: 7.3,
        baseOffset: 7.4, 
        alternateOffset: 7.5 
      }
      let channels2: image.GainmapChannel = {
        gainmapMax: 8.1,
        gainmapMin: 8.2,
        gamma: 8.3,
        baseOffset: 8.4, 
        alternateOffset: 8.5 
      }
      let gain: image.HdrGainmapMetadata = {
        writerVersion: 10,
        miniVersion: 11,
        gainmapChannelCount: 12,
        useBaseColorFlag: true,
        baseHeadroom: 5.1,
        alternateHeadroom: 5.2,
        channels: [ channels1, channels2 ]
      }
      console.log(msg + " Example begin! ")

      image.createPixelMap(color, opts).then(async(pixelMap: image.PixelMap) => {
        console.info( msg + ' Succeeded in creating pixelMap.');
        try{
          let context1 = getContext()
          console.info( msg + ' 0 ');
          const resourceMgr = context1.resourceManager
          console.info( msg + ' 1 ');
          console.info( msg + ' 1 resourceMgr: ' + resourceMgr);
          console.info( msg + ' 1 resourceMgr: ' + JSON.stringify(resourceMgr));
          // const fileData = await resourceMgr.getRawFileContent('icon.png')
          const fileData = await resourceMgr.getMediaContent($r('app.media.icon'))
          console.info( msg + ' 2 ');
          const buffer = fileData.buffer
          console.info( msg + ' 3 ');
          const imageSource = image.createImageSource(buffer)
          console.info( msg + ' 4 ');
          let decodingOptions: image.DecodingOptions = {
            desiredSize: { width: 512, height:512 },
            desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
            desiredDynamicRange: image.DecodingDynamicRange.HDR
          }
          console.info( msg + ' 5 ');
          pixelMap = imageSource.createPixelMapSync(decodingOptions)
          console.info( msg + ' 6 ');
          await pixelMap.setMetadata(3,gain)
          console.info( msg + ' 7 ');
          let bufferValue:image.HdrMetadataValue = pixelMap.getMetadata(3)
          let bufferArr = new Uint8Array(bufferValue as ArrayBuffer)
          console.info( msg + ' 8 ');
          console.log(msg + ' Example end !')
          expect(true).assertTrue();
          done();
        }catch(error){
          if(error == 62980173){
            console.info( msg + ' The DMA memory does not exist. ');
            console.log(msg + ' Example end !')
            expect(true).assertTrue();
            done();
          }else{
            console.info( msg + ' Faild in .' + error);
            console.info( msg + ' Faild in .' + JSON.stringify(error));
            expect().assertFail();
            done();
          }
        }
      }).catch((error: BusinessError) => {
          if(error.code == 62980173){
            console.info( msg + ' RK The DMA memory does not exist. ');
            console.log(msg + ' Example end !')
            expect(true).assertTrue();
            done();
          }else{
            console.info( msg + ' Faild in .' + error);
            console.info( msg + ' Faild in .' + JSON.stringify(error));
            expect().assertFail();
            done();
          }
      })
    });

  })
}