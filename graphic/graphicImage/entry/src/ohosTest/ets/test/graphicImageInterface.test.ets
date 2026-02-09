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
import { BusinessError } from '@ohos.base';
import image from '@ohos.multimedia.image';

export default function graphicImageInterfaceTest() {
  describe('graphicImageInterfaceTest', (done:Function)=> {
    console.log('describe graphicImageInterfaceTest start!!!')

    beforeAll(async ()=> {
    })
    /**
     * @tc.name   testCreatePremultipliedPixelMap_callback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_016
     * @tc.desc   The transparent channel non-premultiplied mode of PixelMap is changed to premultiplied mode. The converted data is stored in the target PixelMap and the result is returned through the callback function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreatePremultipliedPixelMap_callback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:Function)=> {
      let msg = " =testCreatePremultipliedPixelMap_callback= "
      console.log(" www data 1" + msg + " begin ")
      const color: ArrayBuffer = new ArrayBuffer(16); // 16为需要创建的像素buffer大小，取值为：height * width *4
      let bufferArr = new Uint8Array(color);
      for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
      }
      let opts2: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 2, width: 2 } , alphaType: 2}
      let opts3: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 2, width: 2 } , alphaType: 3}
      console.log(" www data 1.1" + msg)
      try {
        console.log(msg + " succeed in try createPixelMapSync ")
        let srcPixelmap = image.createPixelMapSync(color, opts2);
        let dstPixelMap = image.createPixelMapSync(opts3);
        console.log(" www data 1.2" + msg)
        image.createPremultipliedPixelMap(dstPixelMap, srcPixelmap, (error: BusinessError) => {
          if(error) {
              console.error(msg + ` Failed to convert pixelmap. code is ${error.code}, message is ${error.message} `);
              expect().assertFail()
              done()
          } else {
              console.log(" www data 1.3" + msg)
              console.info(msg + ' Succeeded in converting pixelmap.');
              done()
          }
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testCreatePremultipliedPixelMap_promise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_017
     * @tc.desc   Convert PixelMap data into a pre-multiply format based on transparency, save the converted data to another PixelMap, and return the result through Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreatePremultipliedPixelMap_promise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:Function)=> {
      let msg = " =testCreatePremultipliedPixelMap_promise= "
      console.log(" www data 2" + msg + " begin ")
      const color: ArrayBuffer = new ArrayBuffer(16); // 16为需要创建的像素buffer大小，取值为：height * width *4
      let bufferArr = new Uint8Array(color);
      for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
      }
      let opts2: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 2, width: 2 } , alphaType: 2}
      let opts3: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 2, width: 2 } , alphaType: 3}
      console.log(" www data 2.1" + msg)
      try {
        console.log(msg + " succeed in try createPixelMapSync ")
        let srcPixelmap = image.createPixelMapSync(color, opts2);
        let dstPixelMap = image.createPixelMapSync(opts3);
        console.log(" www data 2.2" + msg)
        image.createPremultipliedPixelMap(dstPixelMap, srcPixelmap).then(() => {
            console.log(" www data 2.3" + msg)
            console.info(msg + ' Succeeded in converting pixelmap.');
            done()
        }).catch((error: BusinessError) => {
            console.error(msg + ` Failed to convert pixelmap. code is ${error.code}, message is ${error.message}`);
            expect().assertFail()
            done()
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testCreateUnpremultipliedPixelMap_callback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_018
     * @tc.desc   The transparent channel premultiplied mode of PixelMap is changed to non-premultiplied mode. The converted data is stored in the target PixelMap and the result is returned through the callback function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateUnpremultipliedPixelMap_callback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:Function)=> {
      let msg = " =testCreateUnpremultipliedPixelMap_callback= "
      console.log(" www data 3" + msg + " begin ")
      const color: ArrayBuffer = new ArrayBuffer(16); // 16为需要创建的像素buffer大小，取值为：height * width *4
      let bufferArr = new Uint8Array(color);
      for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
      }
      let opts2: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 2, width: 2 } , alphaType: 2}
      let opts3: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 2, width: 2 } , alphaType: 3}
      console.log(" www data 3.1" + msg)
      try {
        console.log(msg + " succeed in try createPixelMapSync ")
        let srcPixelmap = image.createPixelMapSync(color, opts2);
        let dstPixelMap = image.createPixelMapSync(opts3);
        console.log(" www data 3.2" + msg)
        image.createUnpremultipliedPixelMap(srcPixelmap, dstPixelMap, (error: BusinessError) => {
          if(error) {
              console.error(msg + ` Failed to convert pixelmap. code is ${error.code}, message is ${error.message} `);
              expect().assertFail()
              done()
          } else {
              console.log(" www data 3.3" + msg)
              console.info(msg + ' Succeeded in converting pixelmap.');
              done()
          }
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testCreateUnpremultipliedPixelMap_promise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_019
     * @tc.desc   The transparent channel premultiplied mode of PixelMap is changed to non-premultiplied mode. The converted data is stored in the target PixelMap and the result is returned through Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateUnpremultipliedPixelMap_promise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:Function)=> {
      let msg = " =testCreateUnpremultipliedPixelMap_promise= "
      console.log(" www data 4" + msg + " begin ")
      const color: ArrayBuffer = new ArrayBuffer(16); // 16为需要创建的像素buffer大小，取值为：height * width *4
      let bufferArr = new Uint8Array(color);
      for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
      }
      let opts2: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 2, width: 2 } , alphaType: 2}
      let opts3: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 2, width: 2 } , alphaType: 3}
      console.log(" www data 4.1" + msg)
      try {
        console.log(msg + " succeed in try createPixelMapSync ")
        let srcPixelmap = image.createPixelMapSync(color, opts2);
        let dstPixelMap = image.createPixelMapSync(opts3);
        console.log(" www data 4.2" + msg)
        image.createUnpremultipliedPixelMap(srcPixelmap, dstPixelMap).then(() => {
            console.log(" www data 4.3" + msg)
            console.info(msg + ' Succeeded in converting pixelmap.');
            done()
        }).catch((error: BusinessError) => {
            console.error(msg + ` Failed to convert pixelmap. code is ${error.code}, message is ${error.message}`);
            expect().assertFail()
            done()
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testWriteBufferToPixelsSync
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_020
     * @tc.desc   The transparent channel premultiplied mode of PixelMap is changed to non-premultiplied mode. The converted data is stored in the target PixelMap and the result is returned through Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWriteBufferToPixelsSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = " =testWriteBufferToPixelsSync= "

      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
      image.createPixelMap(color, opts).then((pixelMap: image.PixelMap) => {
        try {
          console.info(msg + ' Succeeded in createPixelMap.');
          if (pixelMap != undefined) {
              pixelMap.writeBufferToPixelsSync(color);
              console.info(msg + ' Succeeded in writeBufferToPixelsSync.');
              done()
          }else{
              console.info(msg + ' pixelMap == undefined');
              expect().assertFail()
              done()
          }
        } catch (err) {
          console.log(msg + " Faild in writeBufferToPixelsSync " + JSON.stringify(err))
          console.log(msg + " Faild in writeBufferToPixelsSync " + err)
          expect().assertFail()
          done()
        }
      }).catch((error: BusinessError) => {
          console.error(msg + ` Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
          expect().assertFail()
          done()
      })
    })

    /**
     * @tc.name   testReadPixelsSync_image
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_021
     * @tc.desc   Reads the image data in the area and returns the result synchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testReadPixelsSync_image', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = " =testReadPixelsSync_image= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        image.createPixelMap(color, opts).then((pixelMap: image.PixelMap) => {
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
          done()
        }).catch((error: BusinessError) => {
          console.error(msg + `Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
          expect().assertFail()
          done()
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testOpacitySync_image
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_022
     * @tc.desc   Sets the transparency ratio of PixelMap, initializes PixelMap, and returns the result synchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpacitySync_image', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = " =testOpacitySync_image= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        image.createPixelMap(color, opts).then((pixelMap: image.PixelMap) => {
          let rate : number = 0.5;
          pixelMap.opacitySync(rate);
          done()
        }).catch((error: BusinessError) => {
          console.error(msg + `Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
          expect().assertFail()
          done()
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testCreateAlphaPixelmapSync_image
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_023
     * @tc.desc   Generate a PixelMap containing only the alpha channel information according to the alpha channel information. It can be used for shadow effect and the result of PixelMap type is returned synchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateAlphaPixelmapSync_image', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:Function)=> {
      let msg = " =testCreateAlphaPixelmapSync_image= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        image.createPixelMap(color, opts).then((pixelMap: image.PixelMap) => {
          let pixelmap : image.PixelMap = pixelMap.createAlphaPixelmapSync();
          done()
        }).catch((error: BusinessError) => {
          console.error(msg + `Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
          expect().assertFail()
          done()
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testTranslateSync_image
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_024
     * @tc.desc   The image is transformed according to the input coordinates and the result is returned synchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTranslateSync_image', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = " =testTranslateSync_image= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        image.createPixelMap(color, opts).then((pixelMap: image.PixelMap) => {
          let translateX : number = 50.0;
          let translateY : number = 10.0;
          pixelMap.translateSync(translateX, translateY);
          done()
        }).catch((error: BusinessError) => {
          console.error(msg + `Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
          expect().assertFail()
          done()
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testRotateSync_image
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_025
     * @tc.desc   Rotates the picture according to the angle entered and returns the result synchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRotateSync_image', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = " =testRotateSync_image= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        image.createPixelMap(color, opts).then((pixelMap: image.PixelMap) => {
          let angle : number = 90.0;
          pixelMap.rotateSync(angle);
          done()
        }).catch((error: BusinessError) => {
          console.error(msg + `Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
          expect().assertFail()
          done()
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testFlipSync_image
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_026
     * @tc.desc   Flips the image based on the conditions entered and returns the result synchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlipSync_image', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = " =testFlipSync_image= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        image.createPixelMap(color, opts).then((pixelMap: image.PixelMap) => {
          let horizontal : boolean = true;
          let vertical : boolean = false;
          pixelMap.flipSync(horizontal, vertical);
          done()
        }).catch((error: BusinessError) => {
          console.error(msg + `Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
          expect().assertFail()
          done()
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testCropSync_image
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_027
     * @tc.desc   Crops the picture to the size you enter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCropSync_image', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = " =testCropSync_image= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        image.createPixelMap(color, opts).then((pixelMap: image.PixelMap) => {
          let region : image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
          pixelMap.cropSync(region);
          done()
        }).catch((error: BusinessError) => {
          console.error(msg + `Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
          expect().assertFail()
          done()
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testSrcPixelFormat
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_028
     * @tc.desc   Crops the picture to the size you enter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSrcPixelFormat', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = " =testSrcPixelFormat= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {
          height: 4, width: 6
        },
        srcPixelFormat: 2
      }
      image.createPixelMap(color, opts).then((pixelMap: image.PixelMap) => {
        console.log(msg + " Succeed in createPixelMap ")
        done()
      }).catch((error: BusinessError) => {
        console.error(msg + `Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        expect().assertFail()
        done()
      })
    })

  })
}