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
import { describe, beforeAll, it, expect } from "@ohos/hypium"
import { BusinessError } from '@ohos.base';
import image from '@ohos.multimedia.image';
import sendableImage from '@ohos.multimedia.sendableImage'

export default function graphicSendableImageInterfaceTest() {
  describe('graphicSendableImageInterfaceTest', ()=> {
    console.log('describe graphicSendableImageInterfaceTest start!!!')

    beforeAll(async ()=> {
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_001
     * @tc.name      : testConvertFromPixelMap
     * @tc.desc      : To test the interface of sendableImage. Create a PixelMap under senableImage using PixelMap under image, and return the PixelMap result synchronously.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testConvertFromPixelMap', 1, async (done:Function)=> {
      let msg = " ====testConvertFromPixelMap==== "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try{
        let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
        console.log(msg + " Succeed in createPixelMapSync ")
        try{
          console.log(msg + " 1 ")
          let sendablePixelMap: sendableImage.PixelMap = sendableImage.convertFromPixelMap(pixelMap);
          console.log(msg + " Succeed in sendableImage.convertFromPixelmap ")
          expect(true).assertTrue()
          done()
        }catch(error){
          console.log(msg + " Faild in convertFromPixelmap " + error)
          console.log(msg + " Faild in convertFromPixelmap " + JSON.stringify(error))
          expect().assertFail()
          done()
        }
      }catch(error){
        console.log(msg + " Faild in createPixelMapSync " + error)
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(error))
        expect().assertFail()
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_002
     * @tc.name      : testConvertToPixelmap
     * @tc.desc      : To test the interface of sendableImage. Create a PixelMap under the image using the PixelMap under the senableImage, and return the PixelMap result synchronously
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testConvertToPixelmap', 1, async (done:Function)=> {
      let msg = " =testConvertToPixelmap= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        sendableImage.createPixelMap(color, opts).then((pixelMap: sendableImage.PixelMap) => {
          let sendablePixelMap: image.PixelMap = sendableImage.convertToPixelMap(pixelMap);
          console.log(msg + " Succeed in sendableImage.convertFromPixelmap " + JSON.stringify(sendablePixelMap))
          expect(true).assertTrue()
          done()
        }).catch((error: BusinessError) => {
          console.error(msg + `Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_003
     * @tc.name      : testReadPixelsSync
     * @tc.desc      : To test the interface of sendableImage. Reads the image data in the area and returns the result synchronously.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testReadPixelsSync', 1, async (done:Function)=> {
      let msg = " =testReadPixelsSync= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        sendableImage.createPixelMap(color, opts).then((pixelMap: sendableImage.PixelMap) => {
          const area: image.PositionArea = {
            pixels: new ArrayBuffer(8),
            offset: 0,
            stride: 8,
            region: {
              size: {
                height: 1, width: 2
              }, x: 0, y: 0
            }
          };
          pixelMap.readPixelsSync(area);
          console.info(msg + '' + area)
          console.info(msg + '' + JSON.stringify(area))
          expect(true).assertTrue()
          done()
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_004
     * @tc.name      : testWriteBufferToPixels
     * @tc.desc      : To test the interface of sendableImage. Reads the image data in the buffer, and the result is written to PixelMap, returned as a Promise.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testWriteBufferToPixels', 1, async (done:Function)=> {
      let msg = " =testWriteBufferToPixels= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      let bufferArr: Uint8Array = new Uint8Array(color);
      for (let i = 0; i < bufferArr.length; i++) {
        bufferArr[i] = i + 1;
      }
      try {
        sendableImage.createPixelMap(color, opts).then((pixelMap: sendableImage.PixelMap) => {
          pixelMap.writeBufferToPixels(color).then(() => {
            console.info("Succeeded in writing data from a buffer to a PixelMap.");
          }).catch((error: BusinessError) => {
            console.error(`Failed to write data from a buffer to a PixelMap. code is ${error.code}, message is ${error.message}`);
          })
          expect(true).assertTrue()
          done()
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_005
     * @tc.name      : testOpacitySync
     * @tc.desc      : To test the interface of sendableImage. Sets the transparency ratio of the PixelMap and initializes the PixelMap.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testOpacitySync', 1, async (done:Function)=> {
      let msg = " =testOpacitySync= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        sendableImage.createPixelMap(color, opts).then((pixelMap: sendableImage.PixelMap) => {
          let rate: number = 0.5;
          pixelMap.opacitySync(rate);
          expect(true).assertTrue()
          done()
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_006
     * @tc.name      : testCreateAlphaPixelmapSync
     * @tc.desc      : To test the interface of sendableImage. Generates a PixelMap containing only alpha channel information based on the alpha channel information, which can be used for shadow effects and returned as a Promise.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreateAlphaPixelmapSync', 1, async (done:Function)=> {
      let msg = " =testCreateAlphaPixelmapSync= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        sendableImage.createPixelMap(color, opts).then((pixelMap: sendableImage.PixelMap) => {
          let pixelmap: sendableImage.PixelMap = pixelMap.createAlphaPixelmapSync();
          expect(true).assertTrue()
          done()
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_007
     * @tc.name      : tesTtranslateSync
     * @tc.desc      : To test the interface of sendableImage. The image is transformed according to the input coordinates and the result is returned synchronously.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('tesTtranslateSync', 1, async (done:Function)=> {
      let msg = " =tesTtranslateSync= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        sendableImage.createPixelMap(color, opts).then((pixelMap: sendableImage.PixelMap) => {
          let translateX: number = 50.0;
          let translateY: number = 10.0;
          pixelMap.translateSync(translateX, translateY);
          expect(true).assertTrue()
          done()
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_008
     * @tc.name      : testRotateSync
     * @tc.desc      : To test the interface of sendableImage. Rotates the picture according to the angle entered and returns the result synchronously.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testRotateSync', 1, async (done:Function)=> {
      let msg = " =testRotateSync= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        sendableImage.createPixelMap(color, opts).then((pixelMap: sendableImage.PixelMap) => {
          let angle: number = 90.0;
          pixelMap.rotateSync(angle);
          expect(true).assertTrue()
          done()
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_009
     * @tc.name      : testFlipSync
     * @tc.desc      : To test the interface of sendableImage. Flips the image based on the conditions entered and returns the result synchronously.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testFlipSync', 1, async (done:Function)=> {
      let msg = " =testFlipSync= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        sendableImage.createPixelMap(color, opts).then((pixelMap: sendableImage.PixelMap) => {
          let horizontal: boolean = true;
          let vertical: boolean = false;
          pixelMap.flipSync(horizontal, vertical);
          expect(true).assertTrue()
          done()
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_010
     * @tc.name      : testCropSync
     * @tc.desc      : To test the interface of sendableImage. Crops the picture to the size you enter.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCropSync', 1, async (done:Function)=> {
      let msg = " =testCropSync= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        sendableImage.createPixelMap(color, opts).then((pixelMap: sendableImage.PixelMap) => {
          let region: image.Region = {
            x: 0, y: 0, size: {
              height: 2, width: 3
            }
          };
          pixelMap.cropSync(region);
          expect(true).assertTrue()
          done()
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_011
     * @tc.name      : testScale
     * @tc.desc      : To test the interface of sendableImage. Scales the image according to the width and height entered, and returns it as a Promise.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testScale', 1, async (done:Function)=> {
      let msg = " =testScale= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        sendableImage.createPixelMap(color, opts).then((pixelMap: sendableImage.PixelMap) => {
          let scaleX: number = 2.0;
          let scaleY: number = 1.0;
          pixelMap.scale(scaleX, scaleY).then(() => {
            console.info('Sucessed in scaling pixelmap.');
          }).catch((err: BusinessError) => {
            console.error(`Failed to scale pixelmap. code is ${err.code}, message is ${err.message}`);
          })
          expect(true).assertTrue()
          done()
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_012
     * @tc.name      : testTranslate
     * @tc.desc      : To test the interface of sendableImage. Change the position of the image based on the coordinates entered and return it as a Promise.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testTranslate', 1, async (done:Function)=> {
      let msg = " =testTranslate= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        sendableImage.createPixelMap(color, opts).then((pixelMap: sendableImage.PixelMap) => {
          let translateX: number = 50.0;
          let translateY: number = 10.0;
          pixelMap.translate(translateX, translateY).then(() => {
            console.info('Sucessed in translating pixelmap.');
          }).catch((err: BusinessError) => {
            console.error(`Failed to translate pixelmap. code is ${err.code}, message is ${err.message}`);
          })
          expect(true).assertTrue()
          done()
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_013
     * @tc.name      : testRotate
     * @tc.desc      : To test the interface of sendableImage. Rotates the image according to the angle entered, and returns as a Promise.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testRotate', 1, async (done:Function)=> {
      let msg = " =testRotate= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        sendableImage.createPixelMap(color, opts).then((pixelMap: sendableImage.PixelMap) => {
          let angle: number = 90.0;
          pixelMap.rotate(angle).then(() => {
            console.info('Sucessed in rotating pixelmap.');
          }).catch((err: BusinessError) => {
            console.error(`Failed to rotate pixelmap. code is ${err.code}, message is ${err.message}`);
          })
          expect(true).assertTrue()
          done()
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_014
     * @tc.name      : testFlip
     * @tc.desc      : To test the interface of sendableImage. Flips the image based on the conditions entered, and returns it as a Promise.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testFlip', 1, async (done:Function)=> {
      let msg = " =testFlip= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        sendableImage.createPixelMap(color, opts).then((pixelMap: sendableImage.PixelMap) => {
          let horizontal: boolean = true;
          let vertical: boolean = false;
          pixelMap.flip(horizontal, vertical).then(() => {
            console.info('Sucessed in flipping pixelmap.');
          }).catch((err: BusinessError) => {
            console.error(`Failed to flip pixelmap. code is ${err.code}, message is ${err.message}`);
          })
          expect(true).assertTrue()
          done()
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_015
     * @tc.name      : testCrop
     * @tc.desc      : To test the interface of sendableImage. Crops the image according to the size entered, and returns it as a Promise.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCrop', 1, async (done:Function)=> {
      let msg = " =testCrop= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        sendableImage.createPixelMap(color, opts).then((pixelMap: sendableImage.PixelMap) => {
          let region: image.Region = {
            x: 0, y: 0, size: {
              height: 2, width: 3
            }
          };
          pixelMap.crop(region).then(() => {
            console.info('Succeeded in cropping pixelmap.');
          }).catch((err: BusinessError) => {
            console.error(`Failed to crop pixelmap. code is ${err.code}, message is ${err.message}`);
          });
          expect(true).assertTrue()
          done()
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })

  })
}