/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "@ohos/hypium"
import image from '@ohos.multimedia.image';
import effectKit from '@ohos.effectKit';
import { testPng, testJpg } from '../model/testImg';
import { BusinessError } from '@ohos.base';

export default function effectKitBTest() {
  describe('effectKitBTest', () => {
    console.log('describe effectKitBTest start!!!');

    /**
     * @tc.name   testGetTopProportionColors
     * @tc.number SUB_GRAPHIC_effectKitTest_Method_0100
     * @tc.desc   Read the first color value of the image. The number is specified by colorCount. The result is written into the Color array and returned in synchronization mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetTopProportionColors', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let msgStr = 'www data testGetTopProportionColors'
      console.log(msgStr + ' begin');
      const color = new ArrayBuffer(96);
      let opts : image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {
          height: 4,
          width: 6
        }
      }
      image.createPixelMap(color, opts).then((pixelMap) => {
        console.info(msgStr + ' Succeed in createPixelMap. ');
        try{
          effectKit.createColorPicker(pixelMap, (error, colorPicker: effectKit.ColorPicker) => {
            if (error) {
              console.error(msgStr + ' Failed to create color picker. ' + JSON.stringify(error));
            } else {
              console.info(msgStr + ' Succeed in creating color picker.');
              try{
                  let colors = colorPicker.getTopProportionColors(2);
                  console.info(msgStr + ' Succeed in getTopProportionColors.');
                  done()
              }catch(err){
                  console.info(msgStr + ' Succeed in getTopProportionColors. ' + JSON.stringify(err));
                  expect().assertFail()
                  done()
              }
            }
          })

        }catch(err){
          console.info(msgStr + ' Failed in creating color picker. ' + JSON.stringify(err));
          expect().assertFail()
          done()
        }
      }).catch((err:BusinessError) => {
        console.info(msgStr + ' Failed in createPixelMap. ' + JSON.stringify(err));
        expect().assertFail()
        done()
      })
    })

    /**
     * @tc.name   testInvert
     * @tc.number SUB_GRAPHIC_effectKitTest_Method_0200
     * @tc.desc   Read the first color value of the image. The number is specified by colorCount. The result is written into the Color array and returned in synchronization mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInvert', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let msgStr = 'www data testInvert'
      console.log(msgStr + ' begin');
      const color = new ArrayBuffer(96);
      let opts : image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {
          height: 4,
          width: 6
        }
      };
      image.createPixelMap(color, opts).then((pixelMap) => {
        console.info(msgStr + ' Succeed in createPixelMap. ');
        try{
          let headFilter = effectKit.createEffect(pixelMap);
          console.info(msgStr + ' Succeed in createEffect. ');
          if (headFilter != null) {
            try{
              headFilter.invert();
              console.info(msgStr + ' Succeed in invert. ');
              done()
            }catch(err){
              console.info(msgStr + ' Failed in invert. ' + JSON.stringify(err));
              expect().assertFail()
              done()
            }
          }else{
            console.log(msgStr + ' headFilter = null. ')
            expect().assertFail()
            done()
          }
        }catch(err){
          console.info(msgStr + ' Failed in createEffect. ' + JSON.stringify(err));
          expect().assertFail()
          done()
        }
      }).catch((err:BusinessError) => {
        console.info(msgStr + ' Failed in createPixelMap. ' + JSON.stringify(err));
        expect().assertFail()
        done()
      })
    })

    /**
     * @tc.name   testSetColorMatrix
     * @tc.number SUB_GRAPHIC_effectKitTest_Method_0300
     * @tc.desc   Read the first color value of the image. The number is specified by colorCount. The result is written into the Color array and returned in synchronization mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetColorMatrix', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let msgStr = 'www data testSetColorMatrix'
      console.log(msgStr + ' begin');
      const color = new ArrayBuffer(96);
      let opts : image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {
          height: 4,
          width: 6
        }
      };
      image.createPixelMap(color, opts).then((pixelMap) => {
        console.info(msgStr + ' Succeed in createPixelMap. ');
        try{
          let colorMatrix:Array<number> = [
            0.2126,0.7152,0.0722,0,0,
            0.2126,0.7152,0.0722,0,0,
            0.2126,0.7152,0.0722,0,0,
            0,0,0,1,0
          ];
          let headFilter = effectKit.createEffect(pixelMap);
          console.info(msgStr + ' Succeed in createEffect. ');
          if (headFilter != null) {
            try{
              headFilter.setColorMatrix(colorMatrix);
              console.info(msgStr + ' Succeed in setColorMatrix. ');
              done()
            }catch(err){
              console.info(msgStr + ' Failed in setColorMatrix. ' + JSON.stringify(err));
              expect().assertFail()
              done()
            }
          }else{
            console.log(msgStr + ' headFilter = null. ')
            expect().assertFail()
            done()
          }
        }catch(err){
          console.info(msgStr + ' Failed in createEffect. ' + JSON.stringify(err));
          expect().assertFail()
          done()
        }
      }).catch((err:BusinessError) => {
        console.info(msgStr + ' Failed in createPixelMap. ' + JSON.stringify(err));
        expect().assertFail()
        done()
      })
    })

    /**
     * @tc.name   testTileMode
     * @tc.number SUB_GRAPHIC_effectKitTest_Method_0400
     * @tc.desc   Enumeration of the shader effect tile mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTileMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let msg = 'www data testTileMode'
      console.log(msg + ' begin')
      expect(effectKit.TileMode.CLAMP).assertEqual(0)
      expect(effectKit.TileMode.REPEAT).assertEqual(1)
      expect(effectKit.TileMode.MIRROR).assertEqual(2)
      expect(effectKit.TileMode.DECAL).assertEqual(3)
      done()
    })
    
    /**
     * @tc.name   testBlurTileMode
     * @tc.number SUB_GRAPHIC_effectKitTest_Method_0500
     * @tc.desc   Adds the blur effect to the effect list. The result is returned to the first node of the effect list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBlurTileMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let msgStr = 'www data testBlurTileMode'
      console.log(msgStr + ' begin');
      const color = new ArrayBuffer(96);
      let opts : image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {
          height: 4,
          width: 6
        }
      };
      image.createPixelMap(color, opts).then((pixelMap) => {
        console.info(msgStr + ' Succeed in createPixelMap. ');
        let radius = 30;
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter != null) {
          headFilter.blur(radius, effectKit.TileMode.DECAL);
          console.info(msgStr + ' Succeed in headFilter.blur. ');
          done()
        }
      }).catch((err:BusinessError) => {
        console.info(msgStr + ' Failed in createPixelMap. ' + JSON.stringify(err));
        expect().assertFail()
        done()
      })
    })
    
    /**
     * @tc.name   testGetEffectPixelMap_useCpuRender1
     * @tc.number SUB_GRAPHIC_effectKitTest_Method_0600
     * @tc.desc   test getEffectPixelMap useCpuRender
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetEffectPixelMap_useCpuRender1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const color = new ArrayBuffer(96);
      let opts : image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {
          height: 4,
          width: 6
        }
      };
      image.createPixelMap(color, opts).then((pixelMap) => {
        effectKit.createEffect(pixelMap).grayscale().getEffectPixelMap(false).then(data => {
          console.info('www data  getPixelBytesNumber = ', data.getPixelBytesNumber());
          done();
        }).catch((err: BusinessError) => {
          expect().assertFail();
          done();
        })
      })
    })
    
    /**
     * @tc.name   testGetEffectPixelMap_useCpuRender2
     * @tc.number SUB_GRAPHIC_effectKitTest_Method_0700
     * @tc.desc   test getEffectPixelMap useCpuRender
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetEffectPixelMap_useCpuRender2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const color = new ArrayBuffer(96);
      let opts : image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {
          height: 4,
          width: 6
        }
      };
      image.createPixelMap(color, opts).then((pixelMap) => {
        effectKit.createEffect(pixelMap).grayscale().getEffectPixelMap(true).then(data => {
          console.info('www data getPixelBytesNumber = ', data.getPixelBytesNumber());
          done();
        }).catch((err: BusinessError) => {
          expect().assertFail();
          done();
        })
      })
    })
    
    /**
     * @tc.name   testGetTopProportionColors_2
     * @tc.number SUB_GRAPHIC_effectKitTest_Method_0800
     * @tc.desc   test getTopProportionColors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetTopProportionColors_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let msgStr = 'www data testGetTopProportionColors_2'
      let imageSource = image.createImageSource(testPng.buffer);
      console.info(msgStr + "promise create pixmap.start");
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create ColorPicker.start");
        effectKit.createColorPicker(pixelMap).then(colorPicker => {
          let color1 = colorPicker.getTopProportionColors(2);
          console.info(msgStr + JSON.stringify(color1));
          expect(color1.length > 0).assertTrue();
          let color2 = colorPicker.getTopProportionColors(-1);
          console.info(msgStr + JSON.stringify(color2));
          if(color2[0] == undefined){
            color2.pop();
            expect(color2.length == 0).assertTrue();
          } else {
            expect(color2.length > 0).assertTrue();
          }
          done();
        }).catch((error: BusinessError) => {
          console.error(msgStr + "Napi colorPicker.error=" + error);
          expect().assertFail();
          done();
        })
      })
    })
    
    /**
     * @tc.name   isBlackOrWhiteOrGrayColor_2
     * @tc.number SUB_GRAPHIC_effectKitTest_Method_0900
     * @tc.desc   test isBlackOrWhiteOrGrayColor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isBlackOrWhiteOrGrayColor_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let msgStr = 'www data isBlackOrWhiteOrGrayColor_2'
      let imageSource = image.createImageSource(testPng.buffer);
      console.info(msgStr + "promise create pixmap.start");
      imageSource.createPixelMap().then(pixelMap => {
        effectKit.createColorPicker(pixelMap).then((colorPicker) => {
          let color_white = colorPicker.isBlackOrWhiteOrGrayColor(0xFFFFFFFF);
          expect(color_white == true).assertTrue();
          let color_blue = colorPicker.isBlackOrWhiteOrGrayColor(0xFF0000FF);
          expect(color_blue == false).assertTrue();
          console.info(msgStr + '  ' + color_white + ' ' + color_blue);
          done();
        }).catch((error: BusinessError) => {
          console.error(msgStr + "Napi colorPicker.error=" + error);
          expect().assertFail();
          done();
        })
      })
    })
    
    /**
     * @tc.name   createColorPicker_callback_0100
     * @tc.number SUB_GRAPHIC_effectKitTest_Method_1000
     * @tc.desc   test createColorPicker callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createColorPicker_callback_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const color = new ArrayBuffer(96);
      let opts : image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {
          height: 4,
          width: 6
        }
      }
      image.createPixelMap(color, opts).then((pixelMap) => {
        effectKit.createColorPicker(pixelMap, [0, 0, 1, 1], (error, colorPicker) => {
          if (error) {
            console.error('www data Failed to create color picker.');
            expect().assertFail();
            done();
          } else {
            console.info('www data Succeeded in creating color picker.');
            let color = colorPicker.getLargestProportionColor();
            console.info('www data get largest proportion color = ' + color);
            expect(color == undefined).assertTrue();
            done();
          }
        })
      })
    })
    
    /**
     * @tc.name   createColorPicker_callback_0200
     * @tc.number SUB_GRAPHIC_effectKitTest_Method_1100
     * @tc.desc   test createColorPicker callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createColorPicker_callback_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'www data createColorPicker_callback_0200';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      imageSource.createPixelMap().then(pixelMap => {
        console.info('www data createPixelMap succeed');
        effectKit.createColorPicker(pixelMap).then(colorPicker => {
          let color = colorPicker.getLargestProportionColor();
          console.info('www data get largest proportion color succeed ', JSON.stringify(colorPicker));
          expect(color !== undefined).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error('www data get largest proportion color error');
          expect().assertFail();
        })
      }).catch((err: BusinessError) => {
        console.error('www data createPixelMap error');
        expect().assertFail();
        done();
      })
    })
    
    /**
     * @tc.name   effectKitBTestCreateEffectEnum001
     * @tc.number SUB_GRAPHIC_effectKitTest_Method_1200
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('effectKitBTestCreateEffectEnum001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msgStr = 'www data effectKitBTestCreateEffectEnum001 ';
        console.log("effectKitTest" + msgStr + 'begin');
        const color = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        };
        image.createPixelMap(color, opts).then((pixelMap) => {
          console.info(msgStr + 'isEditable 111 ', pixelMap.isEditable)
          console.info(msgStr + 'isEditable 222 ', pixelMap.isStrideAlignment)
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertFalse();
          let pixel = effectKit.createEffect(pixelMap);
          expect(pixel !== undefined).assertTrue();
          console.log("effectKitTest" + msgStr + 'end');
          done();
        })
      })

    /**
     * @tc.name   effectKitBTestCreateEffectEnum002
     * @tc.number SUB_GRAPHIC_effectKitTest_Method_1300
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('effectKitBTestCreateEffectEnum002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msgStr = 'www data effectKitBTestCreateEffectEnum002 ';
        console.log("effectKitTest" + msgStr + 'begin');
        const color = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        };
        image.createPixelMap(color, opts).then((pixelMap) => {
          console.info(msgStr + 'isEditable 111 ', pixelMap.isEditable)
          console.info(msgStr + 'isEditable 222 ', pixelMap.isStrideAlignment)
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          let pixel = effectKit.createEffect(pixelMap);
          expect(pixel !== undefined).assertTrue();
          console.log("effectKitTest" + msgStr + 'end');
          done();
        })
      })

    /**
     * @tc.name   effectKitBTestCreateEffectEnum003
     * @tc.number SUB_GRAPHIC_effectKitTest_Method_1400
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('effectKitBTestCreateEffectEnum003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msgStr = 'www data effectKitBTestCreateEffectEnum003 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap : image.PixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
        console.info(msgStr + 'alloc pixelMap isEditable ', pixelMap.isEditable)  // false
        console.info(msgStr + 'alloc pixelMap isStrideAlignment ', pixelMap.isStrideAlignment)  // true
        expect(pixelMap.isEditable).assertFalse();
        expect(pixelMap.isStrideAlignment).assertTrue();
        let pixel = effectKit.createEffect(pixelMap);
        expect(pixel !== undefined).assertTrue();
        console.log("effectKitTest" + msgStr + 'end');
        done();
      })

    /**
     * @tc.name   effectKitBTestCreateEffectEnum004
     * @tc.number SUB_GRAPHIC_effectKitTest_Method_1500
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('effectKitBTestCreateEffectEnum004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msgStr = 'www data effectKitBTestCreateEffectEnum004 ';
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap : image.PixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
        console.info(msgStr + 'alloc pixelMap isEditable ', pixelMap.isEditable)  // true
        console.info(msgStr + 'alloc pixelMap isStrideAlignment ', pixelMap.isStrideAlignment)  // true
        expect(pixelMap.isEditable).assertTrue();
        expect(pixelMap.isStrideAlignment).assertTrue();
        let pixel = effectKit.createEffect(pixelMap);
        expect(pixel !== undefined).assertTrue();
        console.log("effectKitTest" + msgStr + 'end');
        done();
      })

    /**
     * @tc.name   effectKitBTest_Promise_one_static_001
     * @tc.number SUB_GRAPHIC_effectKitTest_Method_1600
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('effectKitBTest_Promise_one_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msgStr = 'www data effectKitBTest_Promise_one_static_001 ';
        console.log("effectKitTest" + msgStr + 'begin');
        const color = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        };
        image.createPixelMap(color, opts).then(async (pixelMap) => {
          console.info(msgStr + 'isEditable 111 ', pixelMap.isEditable)
          console.info(msgStr + 'isEditable 222 ', pixelMap.isStrideAlignment)
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          let colorPicker = await effectKit.createColorPicker(pixelMap);
          expect(colorPicker !== undefined).assertTrue();
          console.log("effectKitTest" + msgStr + 'end');
          done();
        })
      })

    /**
     * @tc.name   effectKitBTest_Promise_one_static_002
     * @tc.number SUB_GRAPHIC_effectKitTest_Method_1700
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('effectKitBTest_Promise_one_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msgStr = 'www data effectKitBTest_Promise_one_static_002 ';
        console.log("effectKitTest" + msgStr + 'begin');
        const color = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        };
        image.createPixelMap(color, opts).then(async (pixelMap) => {
          console.info(msgStr + 'isEditable 111 ', pixelMap.isEditable)
          console.info(msgStr + 'isEditable 222 ', pixelMap.isStrideAlignment)
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertFalse();
          let colorPicker = await effectKit.createColorPicker(pixelMap);
          expect(colorPicker !== undefined).assertTrue();
          console.log("effectKitTest" + msgStr + 'end');
          done();
        })
      })

    /**
     * @tc.name   effectKitBTest_Promise_one_static_003
     * @tc.number SUB_GRAPHIC_effectKitTest_Method_1800
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('effectKitBTest_Promise_one_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msgStr = 'www data effectKitBTest_Promise_one_static_003 ';
        console.log("effectKitTest" + msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap : image.PixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
        console.info(msgStr + 'isEditable 111 ', pixelMap.isEditable)
        console.info(msgStr + 'isEditable 222 ', pixelMap.isStrideAlignment)
        expect(pixelMap.isEditable).assertTrue();
        expect(pixelMap.isStrideAlignment).assertTrue();
        let colorPicker = await effectKit.createColorPicker(pixelMap);
        expect(colorPicker !== undefined).assertTrue();
        console.log("effectKitTest" + msgStr + 'end');
        done();
      })

    /**
     * @tc.name   effectKitBTest_Promise_one_static_004
     * @tc.number SUB_GRAPHIC_effectKitTest_Method_1900
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('effectKitBTest_Promise_one_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msgStr = 'www data effectKitBTest_Promise_one_static_004 ';
        console.log("effectKitTest" + msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap : image.PixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
        console.info(msgStr + 'isEditable 111 ', pixelMap.isEditable)
        console.info(msgStr + 'isEditable 222 ', pixelMap.isStrideAlignment)
        expect(pixelMap.isEditable).assertFalse();
        expect(pixelMap.isStrideAlignment).assertTrue();
        let colorPicker = await effectKit.createColorPicker(pixelMap);
        expect(colorPicker !== undefined).assertTrue();
        console.log("effectKitTest" + msgStr + 'end');
        done();
      })

    /**
     * @tc.name   effectKitBTest_Promise_two_static_001
     * @tc.number SUB_GRAPHIC_effectKitTest_Method_2000
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('effectKitBTest_Promise_two_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msgStr = 'www data effectKitBTest_Promise_two_static_001 ';
        console.log("effectKitTest" + msgStr + 'begin');
        const color = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        };
        image.createPixelMap(color, opts).then(async (pixelMap) => {
          console.info(msgStr + 'isEditable 111 ', pixelMap.isEditable)
          console.info(msgStr + 'isEditable 222 ', pixelMap.isStrideAlignment)
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          let colorPicker = await effectKit.createColorPicker(pixelMap, [0, 0, 1, 1]);
          expect(colorPicker !== undefined).assertTrue();
          console.log("effectKitTest" + msgStr + 'end');
          done();
        })
      })

    /**
     * @tc.name   effectKitBTest_Promise_two_static_002
     * @tc.number SUB_GRAPHIC_effectKitTest_Method_2100
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('effectKitBTest_Promise_two_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msgStr = 'www data effectKitBTest_Promise_two_static_002 ';
        console.log("effectKitTest" + msgStr + 'begin');
        const color = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        };
        image.createPixelMap(color, opts).then(async (pixelMap) => {
          console.info(msgStr + 'isEditable 111 ', pixelMap.isEditable)
          console.info(msgStr + 'isEditable 222 ', pixelMap.isStrideAlignment)
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertFalse();
          let colorPicker = await effectKit.createColorPicker(pixelMap, [0, 0, 1, 1]);
          expect(colorPicker !== undefined).assertTrue();
          console.log("effectKitTest" + msgStr + 'end');
          done();
        })
      })

    /**
     * @tc.name   effectKitBTest_Promise_two_static_003
     * @tc.number SUB_GRAPHIC_effectKitTest_Method_2200
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('effectKitBTest_Promise_two_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msgStr = 'www data effectKitBTest_Promise_two_static_003 ';
        console.log("effectKitTest" + msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap : image.PixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
        console.info(msgStr + 'isEditable 111 ', pixelMap.isEditable)
        console.info(msgStr + 'isEditable 222 ', pixelMap.isStrideAlignment)
        expect(pixelMap.isEditable).assertTrue();
        expect(pixelMap.isStrideAlignment).assertTrue();
        let colorPicker = await effectKit.createColorPicker(pixelMap, [0, 0, 1, 1]);
        expect(colorPicker !== undefined).assertTrue();
        console.log("effectKitTest" + msgStr + 'end');
        done();
      })

    /**
     * @tc.name   effectKitBTest_Promise_two_static_004
     * @tc.number SUB_GRAPHIC_effectKitTest_Method_2300
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('effectKitBTest_Promise_two_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msgStr = 'www data effectKitBTest_Promise_two_static_004 ';
        console.log("effectKitTest" + msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap : image.PixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
        console.info(msgStr + 'isEditable 111 ', pixelMap.isEditable)
        console.info(msgStr + 'isEditable 222 ', pixelMap.isStrideAlignment)
        expect(pixelMap.isEditable).assertFalse();
        expect(pixelMap.isStrideAlignment).assertTrue();
        let colorPicker = await effectKit.createColorPicker(pixelMap, [0, 0, 1, 1]);
        expect(colorPicker !== undefined).assertTrue();
        console.log("effectKitTest" + msgStr + 'end');
        done();
      })

    /**
     * @tc.name   effectKitBTest_Callback_one_static_001
     * @tc.number SUB_GRAPHIC_effectKitTest_Method_2400
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('effectKitBTest_Callback_one_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msgStr = 'www data effectKitBTest_Callback_one_static_001 ';
        console.log("effectKitTest" + msgStr + 'begin');
        const color = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        };
        image.createPixelMap(color, opts).then(pixelMap => {
          console.info(msgStr + 'isEditable 111 ', pixelMap.isEditable)
          console.info(msgStr + 'isEditable 222 ', pixelMap.isStrideAlignment)
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          effectKit.createColorPicker(pixelMap, (error, colorPicker) => {
            if (error) {
              console.error(msgStr + 'Failed to create color picker.');
              expect(false).assertTrue();
              done();
            } else {
              console.info(msgStr + 'Succeeded in creating color picker.');
              expect(colorPicker !== undefined).assertTrue();
              done();
            }
          })
        })
      })

    /**
     * @tc.name   effectKitBTest_Callback_one_static_002
     * @tc.number SUB_GRAPHIC_effectKitTest_Method_2500
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('effectKitBTest_Callback_one_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msgStr = 'www data effectKitBTest_Callback_one_static_002 ';
        console.log("effectKitTest" + msgStr + 'begin');
        const color = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        };
        image.createPixelMap(color, opts).then(pixelMap => {
          console.info(msgStr + 'isEditable 111 ', pixelMap.isEditable)
          console.info(msgStr + 'isEditable 222 ', pixelMap.isStrideAlignment)
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertFalse();
          effectKit.createColorPicker(pixelMap, (error, colorPicker) => {
            if (error) {
              console.error(msgStr + 'Failed to create color picker.');
              expect(false).assertTrue();
              done();
            } else {
              console.info(msgStr + 'Succeeded in creating color picker.');
              expect(colorPicker !== undefined).assertTrue();
              done();
            }
          })
        })
      })

    /**
     * @tc.name   effectKitBTest_Callback_one_static_003
     * @tc.number SUB_GRAPHIC_effectKitTest_Method_2600
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('effectKitBTest_Callback_one_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msgStr = 'www data effectKitBTest_Callback_one_static_003 ';
        console.log("effectKitTest" + msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap : image.PixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
        console.info(msgStr + 'isEditable 111 ', pixelMap.isEditable)
        console.info(msgStr + 'isEditable 222 ', pixelMap.isStrideAlignment)
        expect(pixelMap.isEditable).assertFalse();
        expect(pixelMap.isStrideAlignment).assertTrue();
        effectKit.createColorPicker(pixelMap, (error, colorPicker) => {
          if (error) {
            console.error(msgStr + 'Failed to create color picker.');
            expect(false).assertTrue();
            done();
          } else {
            console.info(msgStr + 'Succeeded in creating color picker.');
            expect(colorPicker !== undefined).assertTrue();
            done();
          }
        })
      })

    /**
     * @tc.name   effectKitBTest_Callback_one_static_004
     * @tc.number SUB_GRAPHIC_effectKitTest_Method_2700
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('effectKitBTest_Callback_one_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msgStr = 'www data effectKitBTest_Callback_one_static_004 ';
        console.log("effectKitTest" + msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap : image.PixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
        console.info(msgStr + 'isEditable 111 ', pixelMap.isEditable)
        console.info(msgStr + 'isEditable 222 ', pixelMap.isStrideAlignment)
        expect(pixelMap.isEditable).assertTrue();
        expect(pixelMap.isStrideAlignment).assertTrue();
        effectKit.createColorPicker(pixelMap, (error, colorPicker) => {
          if (error) {
            console.error(msgStr + 'Failed to create color picker.');
            expect(false).assertTrue();
            done();
          } else {
            console.info(msgStr + 'Succeeded in creating color picker.');
            expect(colorPicker !== undefined).assertTrue();
            done();
          }
        })
      })

    /**
     * @tc.name   effectKitBTest_Callback_two_static_001
     * @tc.number SUB_GRAPHIC_effectKitTest_Method_2800
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('effectKitBTest_Callback_two_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msgStr = 'www data effectKitBTest_Callback_two_static_001 ';
        console.log("effectKitTest" + msgStr + 'begin');
        const color = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        };
        image.createPixelMap(color, opts).then(pixelMap => {
          console.info(msgStr + 'isEditable 111 ', pixelMap.isEditable)
          console.info(msgStr + 'isEditable 222 ', pixelMap.isStrideAlignment)
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          effectKit.createColorPicker(pixelMap, [0, 0, 1, 1], (error, colorPicker) => {
            if (error) {
              console.error(msgStr + 'Failed to create color picker.');
              expect(false).assertTrue();
              done();
            } else {
              console.info(msgStr + 'Succeeded in creating color picker.');
              expect(colorPicker !== undefined).assertTrue();
              done();
            }
          })
        })
      })

    /**
     * @tc.name   effectKitBTest_Callback_two_static_002
     * @tc.number SUB_GRAPHIC_effectKitTest_Method_2900
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('effectKitBTest_Callback_two_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msgStr = 'www data effectKitBTest_Callback_two_static_002 ';
        console.log("effectKitTest" + msgStr + 'begin');
        const color = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        };
        image.createPixelMap(color, opts).then(pixelMap => {
          console.info(msgStr + 'isEditable 111 ', pixelMap.isEditable)
          console.info(msgStr + 'isEditable 222 ', pixelMap.isStrideAlignment)
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertFalse();
          effectKit.createColorPicker(pixelMap, [0, 0, 1, 1], (error, colorPicker) => {
            if (error) {
              console.error(msgStr + 'Failed to create color picker.');
              expect(false).assertTrue();
              done();
            } else {
              console.info(msgStr + 'Succeeded in creating color picker.');
              expect(colorPicker !== undefined).assertTrue();
              done();
            }
          })
        })
      })

    /**
     * @tc.name   effectKitBTest_Callback_two_static_003
     * @tc.number SUB_GRAPHIC_effectKitTest_Method_3000
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('effectKitBTest_Callback_two_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msgStr = 'www data effectKitBTest_Callback_two_static_003 ';
        console.log("effectKitTest" + msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap : image.PixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
        console.info(msgStr + 'isEditable 111 ', pixelMap.isEditable)
        console.info(msgStr + 'isEditable 222 ', pixelMap.isStrideAlignment)
        expect(pixelMap.isEditable).assertFalse();
        expect(pixelMap.isStrideAlignment).assertTrue();
        effectKit.createColorPicker(pixelMap, [0, 0, 1, 1], (error, colorPicker) => {
          if (error) {
            console.error(msgStr + 'Failed to create color picker.');
            expect(false).assertTrue();
            done();
          } else {
            console.info(msgStr + 'Succeeded in creating color picker.');
            expect(colorPicker !== undefined).assertTrue();
            done();
          }
        })
      })

    /**
     * @tc.name   effectKitBTest_Callback_two_static_004
     * @tc.number SUB_GRAPHIC_effectKitTest_Method_3100
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('effectKitBTest_Callback_two_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msgStr = 'www data effectKitBTest_Callback_two_static_004 ';
        console.log("effectKitTest" + msgStr + 'begin');
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap : image.PixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
        console.info(msgStr + 'isEditable 111 ', pixelMap.isEditable)
        console.info(msgStr + 'isEditable 222 ', pixelMap.isStrideAlignment)
        expect(pixelMap.isEditable).assertTrue();
        expect(pixelMap.isStrideAlignment).assertTrue();
        effectKit.createColorPicker(pixelMap, [0, 0, 1, 1], (error, colorPicker) => {
          if (error) {
            console.error(msgStr + 'Failed to create color picker.');
            expect(false).assertTrue();
            done();
          } else {
            console.info(msgStr + 'Succeeded in creating color picker.');
            expect(colorPicker !== undefined).assertTrue();
            done();
          }
        })
      })

  })
}