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

export default function effectKitCTest() {
  describe('effectKitCTest', () => {
    console.log('describe effectKitCTest start!!!');
    
    /**
     * @tc.name   testEffectKitC_0100
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICEFFECTKIT_API_0100
     * @tc.desc   Adds the blur effect to the effect list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEffectKitC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let imageSource = image.createImageSource(testPng.buffer);
      imageSource.createPixelMap().then(pixelMap => {
        let headFilter = effectKit.createEffect(pixelMap);

        let filter1 = headFilter.blur(null);
        console.info('www data filter 111 ', JSON.stringify(filter1));
        expect(filter1 != undefined).assertTrue();

        let filter2 = headFilter.blur(undefined);
        console.info('www data filter 222 ', JSON.stringify(filter2));
        expect(filter2 != undefined).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.info('www data failed to pixelMap', JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })
    
    /**
     * @tc.name   testEffectKitC_0200
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICEFFECTKIT_API_0200
     * @tc.desc   Adds the blur effect to the effect list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEffectKitC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let imageSource = image.createImageSource(testPng.buffer);
      imageSource.createPixelMap().then(pixelMap => {
        let headFilter = effectKit.createEffect(pixelMap);

        let filter1 = headFilter.blur(30, effectKit.TileMode.CLAMP);
        console.info('www data filter 111 ', JSON.stringify(filter1));
        expect(filter1 != undefined).assertTrue();

        let filter2 = headFilter.blur(30, effectKit.TileMode.REPEAT);
        console.info('www data filter 222 ', JSON.stringify(filter2));
        expect(filter2 != undefined).assertTrue();

        let filter3 = headFilter.blur(30, effectKit.TileMode.MIRROR);
        console.info('www data filter 333 ', JSON.stringify(filter3));
        expect(filter3 != undefined).assertTrue();

        let filter4 = headFilter.blur(30, effectKit.TileMode.DECAL);
        console.info('www data filter 444 ', JSON.stringify(filter4));
        expect(filter4 != undefined).assertTrue();

        let filter5 = headFilter.blur(null, effectKit.TileMode.DECAL);
        console.info('www data filter 555 ', JSON.stringify(filter5));
        expect(filter5 != undefined).assertTrue();

        let filter6 = headFilter.blur(undefined, effectKit.TileMode.DECAL);
        console.info('www data filter 666 ', JSON.stringify(filter6));
        expect(filter6 != undefined).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.info('www data failed to pixelMap', JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })
    
    /**
     * @tc.name   testEffectKitC_0300
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICEFFECTKIT_API_0300
     * @tc.desc   Adds the blur effect to the effect list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEffectKitC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let imageSource = image.createImageSource(testPng.buffer);
      imageSource.createPixelMap().then(pixelMap => {
        let headFilter = effectKit.createEffect(pixelMap);

        let brightness1 = headFilter.brightness(null);
        console.info('www data brightness 111 ', JSON.stringify(brightness1));
        expect(brightness1 != undefined).assertTrue();

        let brightness2 = headFilter.brightness(undefined);
        console.info('www data brightness 222 ', JSON.stringify(brightness2));
        expect(brightness2 != undefined).assertTrue();

        let brightness3 = headFilter.brightness(-1);
        console.info('www data brightness 333 ', JSON.stringify(brightness3));
        expect(brightness3 != undefined).assertTrue();

        let brightness4 = headFilter.brightness(0);
        console.info('www data brightness 444 ', JSON.stringify(brightness4));
        expect(brightness4 != undefined).assertTrue();

        let brightness5 = headFilter.brightness(0.5);
        console.info('www data brightness 555 ', JSON.stringify(brightness5));
        expect(brightness5 != undefined).assertTrue();

        let brightness6 = headFilter.brightness(1);
        console.info('www data brightness 666 ', JSON.stringify(brightness6));
        expect(brightness6 != undefined).assertTrue();

        let brightness7 = headFilter.brightness(2);
        console.info('www data brightness 777 ', JSON.stringify(brightness7));
        expect(brightness7 != undefined).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.info('www data failed to pixelMap', JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })
    
    /**
     * @tc.name   testEffectKitC_0400
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICEFFECTKIT_API_0400
     * @tc.desc   Adds the blur effect to the effect list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEffectKitC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let imageSource = image.createImageSource(testPng.buffer);
      imageSource.createPixelMap().then(pixelMap => {
        let colorMatrix:Array<number> = [
          0.2126,0.7152,0.0722,0,0,
          0.2126,0.7152,0.0722,0,0,
          0.2126,0.7152,0.0722,0,0,
          0,0,0,1,0
        ];
        let headFilter = effectKit.createEffect(pixelMap);

        let setColorMatrix1 = headFilter.setColorMatrix(null);
        console.info('www data setColorMatrix 111 ', JSON.stringify(setColorMatrix1));
        expect(setColorMatrix1 == undefined).assertTrue();

        let setColorMatrix2 = headFilter.setColorMatrix(undefined);
        console.info('www data setColorMatrix 222 ', JSON.stringify(setColorMatrix2));
        expect(setColorMatrix2 == undefined).assertTrue();

        let setColorMatrix3 = headFilter.setColorMatrix(colorMatrix);
        console.info('www data setColorMatrix 333 ', JSON.stringify(setColorMatrix3));
        expect(setColorMatrix3 != undefined).assertTrue();

        let setColorMatrix4 = headFilter.setColorMatrix([]);
        console.info('www data setColorMatrix 444 ', JSON.stringify(setColorMatrix4));
        expect(setColorMatrix4 == undefined).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.info('www data failed to pixelMap', JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })
    
    /**
     * @tc.name   testEffectKitC_0500
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICEFFECTKIT_API_0500
     * @tc.desc   Adds the blur effect to the effect list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEffectKitC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let imageSource = image.createImageSource(testPng.buffer);
      imageSource.createPixelMap().then(pixelMap => {
        effectKit.createColorPicker(pixelMap).then(colorPicker => {
          let color1 = colorPicker.getTopProportionColors(null);
          console.info('www data testEffectKitC_0500 111 ' + JSON.stringify(color1));
          console.info('www data testEffectKitC_0500 111 ' + color1[0]);
          expect(color1[0] == undefined).assertTrue();
          let color2 = colorPicker.getTopProportionColors(undefined);
          console.info('www data testEffectKitC_0500 222 ' + JSON.stringify(color2));
          console.info('www data testEffectKitC_0500 222 ' + color2[0]);
          expect(color2[0] == undefined).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.info('www data testEffectKitC_0500 failed to createColorPicker', JSON.stringify(err));
          expect().assertFail();
          done();
        })
      }).catch((err: BusinessError) => {
        console.info('www data testEffectKitC_0500 failed to pixelMap', JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })
    
    /**
     * @tc.name   testEffectKitC_0600
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICEFFECTKIT_API_0600
     * @tc.desc   Adds the blur effect to the effect list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEffectKitC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let imageSource = image.createImageSource(testPng.buffer);
      imageSource.createPixelMap().then(pixelMap => {
        effectKit.createColorPicker(pixelMap).then(colorPicker => {
          let flag1 = colorPicker.isBlackOrWhiteOrGrayColor(0x0);
          console.info('www data testEffectKitC_0600 111 is black or white or gray color[bool](white) =', flag1);
          expect(flag1).assertTrue();
          let flag2 = colorPicker.isBlackOrWhiteOrGrayColor(0xFFFFFFFF);
          console.info('www data testEffectKitC_0600 222 is black or white or gray color[bool](white) =', flag2);
          expect(flag2).assertTrue();
          let flag3 = colorPicker.isBlackOrWhiteOrGrayColor(-1);
          console.info('www data testEffectKitC_0600 333 is black or white or gray color[bool](white) =', flag3);
          expect(flag3).assertTrue();
          let flag4 = colorPicker.isBlackOrWhiteOrGrayColor(10000);
          console.info('www data testEffectKitC_0600 444 is black or white or gray color[bool](white) =', flag4);
          expect(flag4).assertFalse();
          let flag5 = colorPicker.isBlackOrWhiteOrGrayColor(null);
          console.info('www data testEffectKitC_0600 444 is black or white or gray color[bool](white) =', flag5);
          expect(flag5).assertTrue();
          let flag6 = colorPicker.isBlackOrWhiteOrGrayColor(undefined);
          console.info('www data testEffectKitC_0600 444 is black or white or gray color[bool](white) =', flag6);
          expect(flag6).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.info('www data testEffectKitC_0600 failed to createColorPicker', JSON.stringify(err));
          expect().assertFail();
          done();
        })
      }).catch((err: BusinessError) => {
        console.info('www data testEffectKitC_0600 failed to pixelMap', JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })
    
    /**
     * @tc.name   testEffectKitC_0700
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICEFFECTKIT_API_0700
     * @tc.desc   Adds the blur effect to the effect list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEffectKitC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let imageSource = image.createImageSource(testPng.buffer);
      imageSource.createPixelMap().then(pixelMap => {
        let headFilter1 = effectKit.createEffect(null);
        console.info('www data createEffect 111 ', JSON.stringify(headFilter1));
        expect(headFilter1 == undefined).assertTrue();
        
        let headFilter2 = effectKit.createEffect(undefined);
        console.info('www data createEffect 111 ', JSON.stringify(headFilter2));
        expect(headFilter2 == undefined).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.info('www data testEffectKitC_0700 failed to pixelMap', JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })
    
    /**
     * @tc.name   testEffectKitC_0900
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICEFFECTKIT_API_0900
     * @tc.desc   Adds the blur effect to the effect list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEffectKitC_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let imageSource = image.createImageSource(testPng.buffer);
      imageSource.createPixelMap().then(async (pixelMap) => {
        let colorPicker1 = await effectKit.createColorPicker(pixelMap, [0, 0, 1, 1]);
        console.info('www data testEffectKitC_0900 111 success ', JSON.stringify(colorPicker1));
        try {
          let colorPicker4 = await effectKit.createColorPicker(pixelMap, null);
          console.info('www data testEffectKitC_0900 444 success ', JSON.stringify(colorPicker4));
          expect(colorPicker4).assertUndefined();
        } catch(err){
          console.info('www data testEffectKitC_0900 444 failed', JSON.stringify(err))
          expect().assertFail();
        }
        try {
          let colorPicker5 = await effectKit.createColorPicker(pixelMap, undefined);
          console.info('www data testEffectKitC_0900 555 success ', JSON.stringify(colorPicker5));
          expect(colorPicker5 != undefined).assertTrue();
        } catch(err){
          console.info('www data testEffectKitC_0900 555 failed', JSON.stringify(err))
          expect().assertFail();
        }
        try {
          let colorPicker6 = await effectKit.createColorPicker(pixelMap, []);
          console.info('www data testEffectKitC_0900 666 success ', JSON.stringify(colorPicker6));
          expect(colorPicker6).assertUndefined();
        } catch(err){
          console.info('www data testEffectKitC_0900 666 failed', JSON.stringify(err))
          expect().assertFail();
        }
        done();
      }).catch((err: BusinessError) => {
        console.info('www data testEffectKitC_0900 failed to pixelMap', JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })
    
    /**
     * @tc.name   testEffectKitC_1000
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICEFFECTKIT_API_1000
     * @tc.desc   Adds the blur effect to the effect list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEffectKitC_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let imageSource = image.createImageSource(testPng.buffer);
      imageSource.createPixelMap().then(pixelMap => {
        effectKit.createColorPicker(pixelMap, (error, colorPicker) => {
          if(error){
            console.info('www data testEffectKitC_1000 111 Failed to create color picker.');
            expect().assertFail();
          } else {
            console.info('www data testEffectKitC_1000 111 success ', JSON.stringify(colorPicker));
            expect(colorPicker != undefined).assertTrue();
          }
          done();
        });
      }).catch((err: BusinessError) => {
        console.info('www data testEffectKitC_1000 failed to pixelMap', JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })
    
    /**
     * @tc.name   testEffectKitC_1100
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICEFFECTKIT_API_1100
     * @tc.desc   Adds the blur effect to the effect list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEffectKitC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let imageSource = image.createImageSource(testPng.buffer);
      imageSource.createPixelMap().then(pixelMap => {
        effectKit.createColorPicker(null, (error, colorPicker) => {
          if(error){
            console.info('www data testEffectKitC_1100 111 Failed to create color picker.');
          } else {
            console.info('www data testEffectKitC_1100 111 success ', JSON.stringify(colorPicker));
            expect().assertFail();
          }
          done();
        });
      }).catch((err: BusinessError) => {
        console.info('www data testEffectKitC_1100 failed to pixelMap', JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })
    
    /**
     * @tc.name   testEffectKitC_1200
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICEFFECTKIT_API_1200
     * @tc.desc   Adds the blur effect to the effect list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEffectKitC_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let imageSource = image.createImageSource(testPng.buffer);
      imageSource.createPixelMap().then(pixelMap => {
        effectKit.createColorPicker(undefined, (error, colorPicker) => {
          if(error){
            console.info('www data testEffectKitC_1200 111 Failed to create color picker.');
          } else {
            console.info('www data testEffectKitC_1200 111 success ', JSON.stringify(colorPicker));
            expect().assertFail();
          }
          done();
        });
      }).catch((err: BusinessError) => {
        console.info('www data testEffectKitC_1200 failed to pixelMap', JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })
    
    /**
     * @tc.name   testEffectKitC_1300
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICEFFECTKIT_API_1300
     * @tc.desc   Adds the blur effect to the effect list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEffectKitC_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let imageSource = image.createImageSource(testPng.buffer);
      imageSource.createPixelMap().then(pixelMap => {
        effectKit.createColorPicker(pixelMap, undefined, (error, colorPicker) => {
          if(error){
            console.info('www data testEffectKitC_1300 111 Failed to create color picker.');
            expect().assertFail();
          } else {
            console.info('www data testEffectKitC_1300 111 success ', JSON.stringify(colorPicker));
            expect(colorPicker != undefined);
          }
          done();
        });
      }).catch((err: BusinessError) => {
        console.info('www data testEffectKitC_1300 failed to pixelMap', JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })
    
    /**
     * @tc.name   testEffectKitC_1600
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICEFFECTKIT_API_1600
     * @tc.desc   Adds the blur effect to the effect list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEffectKitC_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let imageSource = image.createImageSource(testPng.buffer);
      imageSource.createPixelMap().then(pixelMap => {
        effectKit.createColorPicker(null, [0, 0, 1, 1], (error, colorPicker) => {
          if(error){
            console.info('www data testEffectKitC_1600 111 Failed to create color picker.');
          } else {
            console.info('www data testEffectKitC_1600 111 success ', JSON.stringify(colorPicker));
            expect().assertFail();
          }
          done();
        });
      }).catch((err: BusinessError) => {
        console.info('www data testEffectKitC_1600 failed to pixelMap', JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })
    
    /**
     * @tc.name   testEffectKitC_1700
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICEFFECTKIT_API_1700
     * @tc.desc   Adds the blur effect to the effect list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEffectKitC_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let imageSource = image.createImageSource(testPng.buffer);
      imageSource.createPixelMap().then(pixelMap => {
        effectKit.createColorPicker(undefined, [0, 0, 1, 1], (error, colorPicker) => {
          if(error){
            console.info('www data testEffectKitC_1700 111 Failed to create color picker.');
          } else {
            console.info('www data testEffectKitC_1700 111 success ', JSON.stringify(colorPicker));
            expect().assertFail();
          }
          done();
        });
      }).catch((err: BusinessError) => {
        console.info('www data testEffectKitC_1700 failed to pixelMap', JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /**
     * @tc.name   getPixelMapEnum001
     * @tc.number EFFECT_KIT_GETPIXELMAP_JSAPI_004
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getPixelMapEnum001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'getPixelMap4';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      imageSource.createPixelMap().then(pixelMap => {
        console.info('www data getPixelMapEnum001 pixelMap isEditable ', pixelMap.isEditable);
        console.info('www data getPixelMapEnum001 pixelMap isEditable ', pixelMap.isStrideAlignment);
        expect(pixelMap.isEditable).assertFalse();
        expect(pixelMap.isStrideAlignment).assertFalse();
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log(msgStr + "createEffect failed");
          expect(true).assertFail();
          done();
          return;
        }
        let resultPixel = headFilter.blur(10).getPixelMap();
        expect(resultPixel != null).assertTrue();

        // 验证 isEditable 属性
        let isEditable = resultPixel.isEditable;
        console.info(msgStr + "isEditable = " + isEditable);
        expect(typeof isEditable === 'boolean').assertTrue();
        expect(isEditable).assertTrue();

        // 验证 isStrideAlignment 属性
        let isStrideAlignment = resultPixel.isStrideAlignment;
        console.info(msgStr + "isStrideAlignment = " + isStrideAlignment);
        expect(typeof isStrideAlignment === 'boolean').assertTrue();
        expect(isStrideAlignment).assertFalse();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
    })

    /**
     * @tc.name   getPixelMapEnum002
     * @tc.number EFFECT_KIT_GETPIXELMAP_JSAPI_005
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getPixelMapEnum002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const color = new ArrayBuffer(96);
        let opts : image.InitializationOptions = {
          editable: false,
          pixelFormat: 3,
          size: {
            height: 4,
            width: 6
          }
        };
        image.createPixelMap(color, opts).then((pixelMap) => {
          console.info('www data pixelMap getPixelMapEnum002 isEditable 111 ', pixelMap.isEditable)
          console.info('www data pixelMap getPixelMapEnum002 isEditable 222 ', pixelMap.isStrideAlignment)
          expect(pixelMap.isEditable).assertFalse();
          expect(pixelMap.isStrideAlignment).assertFalse();
          let pixel = effectKit.createEffect(pixelMap).getPixelMap();
          console.info('getPixelBytesNumber = ', pixel.getPixelBytesNumber());
          console.info('www data pixelMap isEditable ', pixel.isEditable)
          console.info('www data pixelMap isStrideAlignment ', pixel.isStrideAlignment)
          expect(pixel.isEditable).assertTrue();
          expect(pixel.isStrideAlignment).assertFalse();
          done();
        })
      })

    /**
     * @tc.name   getPixelMapEnum003
     * @tc.number EFFECT_KIT_GETPIXELMAP_JSAPI_006
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getPixelMapEnum003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4。
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
        console.info('www data alloc pixelMap isEditable ', pixelMap.isEditable)  // false
        console.info('www data alloc pixelMap isStrideAlignment ', pixelMap.isStrideAlignment)  // true
        expect(pixelMap.isEditable).assertFalse();
        expect(pixelMap.isStrideAlignment).assertTrue();
        let pixel2 = effectKit.createEffect(pixelMap).getPixelMap();
        console.info('getPixelBytesNumber = ', pixel2.getPixelBytesNumber());
        console.info('www data pixelMap isEditable ', pixel2.isEditable)
        console.info('www data pixelMap isStrideAlignment ', pixel2.isStrideAlignment)
        expect(pixel2.isEditable).assertTrue();
        expect(pixel2.isStrideAlignment).assertFalse();
        done();
      })

    /**
     * @tc.name   getEffectPixelMapEnum001
     * @tc.number EFFECT_KIT_GETEFFECTPIXELMAP_JSAPI_001
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getEffectPixelMapEnum001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4。
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap : image.PixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
        console.info('www data alloc pixelMap isEditable ', pixelMap.isEditable)  // false
        console.info('www data alloc pixelMap isStrideAlignment ', pixelMap.isStrideAlignment)  // true
        expect(pixelMap.isEditable).assertFalse();
        expect(pixelMap.isStrideAlignment).assertTrue();
        effectKit.createEffect(pixelMap).getEffectPixelMap().then((pixelMap)=>{
          console.info('getPixelBytesNumber = ', pixelMap.getPixelBytesNumber());
          console.info('www data pixelMap isEditable ', pixelMap.isEditable)
          console.info('www data pixelMap isStrideAlignment ', pixelMap.isStrideAlignment)
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          done();
        }).catch((err: BusinessError) => {
          console.info('www data error ', err);
          expect().assertFail();
          done();
        })
      })

    /**
     * @tc.name   getEffectPixelMapEnum002
     * @tc.number EFFECT_KIT_GETEFFECTPIXELMAP_JSAPI_002
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getEffectPixelMapEnum002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4。
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
        console.info('www data alloc pixelMap isEditable ', pixelMap.isEditable)  // false
        console.info('www data alloc pixelMap isStrideAlignment ', pixelMap.isStrideAlignment)  // true
        expect(pixelMap.isEditable).assertFalse();
        expect(pixelMap.isStrideAlignment).assertTrue();
        effectKit.createEffect(pixelMap).getEffectPixelMap(true).then((pixelMap)=>{
          console.info('getPixelBytesNumber = ', pixelMap.getPixelBytesNumber());
          console.info('www data pixelMap isEditable ', pixelMap.isEditable)
          console.info('www data pixelMap isStrideAlignment ', pixelMap.isStrideAlignment)
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          done();
        }).catch((err: BusinessError) => {
          console.info('www data error ', err);
          expect().assertFail();
          done();
        })
      })

    /**
     * @tc.name   getEffectPixelMapEnum003
     * @tc.number EFFECT_KIT_GETEFFECTPIXELMAP_JSAPI_003
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getEffectPixelMapEnum003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4。
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
        console.info('www data alloc pixelMap isEditable ', pixelMap.isEditable)  // false
        console.info('www data alloc pixelMap isStrideAlignment ', pixelMap.isStrideAlignment)  // true
        expect(pixelMap.isEditable).assertFalse();
        expect(pixelMap.isStrideAlignment).assertTrue();
        effectKit.createEffect(pixelMap).getEffectPixelMap(false).then((pixelMap)=>{
          console.info('getPixelBytesNumber = ', pixelMap.getPixelBytesNumber());
          console.info('www data pixelMap isEditable ', pixelMap.isEditable)
          console.info('www data pixelMap isStrideAlignment ', pixelMap.isStrideAlignment)
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          done();
        }).catch((err: BusinessError) => {
          console.info('www data error ', err);
          expect().assertFail();
          done();
        })
      })

    /**
     * @tc.name   getEffectPixelMapEnum004
     * @tc.number EFFECT_KIT_GETEFFECTPIXELMAP_JSAPI_004
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getEffectPixelMapEnum004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {

        const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4。
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
        console.info('www data alloc pixelMap isEditable ', pixelMap.isEditable)  // false
        console.info('www data alloc pixelMap isStrideAlignment ', pixelMap.isStrideAlignment)  // true
        expect(pixelMap.isEditable).assertTrue();
        expect(pixelMap.isStrideAlignment).assertTrue();
        effectKit.createEffect(pixelMap).getEffectPixelMap(true).then((pixelMap)=>{
          console.info('getPixelBytesNumber = ', pixelMap.getPixelBytesNumber());
          console.info('www data pixelMap isEditable ', pixelMap.isEditable)
          console.info('www data pixelMap isStrideAlignment ', pixelMap.isStrideAlignment)
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          done();
        }).catch((err: BusinessError) => {
          console.info('www data error ', err);
          expect().assertFail();
          done();
        })
      })

    /**
     * @tc.name   getEffectPixelMapEnum005
     * @tc.number EFFECT_KIT_GETEFFECTPIXELMAP_JSAPI_005
     * @tc.desc   Test getPixelMap and verify isEditable and isStrideAlignment properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getEffectPixelMapEnum005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
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
          console.info('www data pixelMap getPixelMapEnum002 isEditable 111 ', pixelMap.isEditable)
          console.info('www data pixelMap getPixelMapEnum002 isEditable 222 ', pixelMap.isStrideAlignment)
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          let pixel = effectKit.createEffect(pixelMap).getPixelMap();
          console.info('getPixelBytesNumber = ', pixel.getPixelBytesNumber());
          console.info('www data pixelMap isEditable ', pixel.isEditable)
          console.info('www data pixelMap isStrideAlignment ', pixel.isStrideAlignment)
          expect(pixel.isEditable).assertTrue();
          expect(pixel.isStrideAlignment).assertFalse();
          done();
        })
      })

    /**
     * @tc.name   createColorPicker_null_001
     * @tc.number ACTS_ABILITY_CREATECOLORPICKER_001
     * @tc.desc   Test createColorPicker with null pixelMap parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createColorPicker_null_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let caseName = 'createColorPicker_null_001';
      let msgStr = 'www data ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        let colorPicker = effectKit.createColorPicker(null);
        console.info(msgStr + JSON.stringify(colorPicker));
        done();
      } catch(err){
        console.info(msgStr + "expected error caught: " + err);
        done();
      }
    })

    /**
     * @tc.name   createColorPicker_undefined_001
     * @tc.number ACTS_ABILITY_CREATECOLORPICKER_002
     * @tc.desc   Test createColorPicker with undefined pixelMap parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createColorPicker_undefined_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let caseName = 'createColorPicker_undefined_001';
      let msgStr = 'www data ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        let colorPicker = effectKit.createColorPicker(undefined);
        console.info(msgStr + JSON.stringify(colorPicker));
        done();
      } catch(err){
        console.info(msgStr + "expected error caught: " + err);
        done();
      }
    })

    /**
     * @tc.name   createColorPicker_undefined_002
     * @tc.number ACTS_ABILITY_CREATECOLORPICKER_003
     * @tc.desc   Test createColorPicker with null pixelMap parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createColorPicker_undefined_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let caseName = 'createColorPicker_undefined_002';
      let msgStr = 'www data ' + caseName + ' ';
      console.log(msgStr + 'begin');
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
        effectKit.createColorPicker(pixelMap, undefined, (error, colorPicker) => {
          if (error) {
            console.error(msgStr + 'Failed to create color picker.');
            done();
          } else {
            console.info(msgStr + 'Succeeded in creating color picker.');
            done();
          }
        })
      })
    })

    /**
     * @tc.name   colorPicker_promise_one_0100
     * @tc.number ACTS_CREATECOLORPICKER_PROMISE_ONE_001
     * @tc.desc   Test createColorPicker with null pixelMap parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorPicker_promise_one_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = 'colorPicker_promise_one_0100';
        let msgStr = 'www data ' + caseName + ' ';
        const color = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        };
        image.createPixelMap(color, opts).then((pixelMap) => {
          console.info(msgStr + ' isEditable ', pixelMap.isEditable)
          console.info(msgStr+ ' isStrideAlignment ', pixelMap.isStrideAlignment)
          expect(pixelMap.isEditable).assertTrue(); // true
          expect(pixelMap.isStrideAlignment).assertFalse(); // false
          // Test createColorPicker with editable PixelMap
          effectKit.createColorPicker(pixelMap).then(colorPicker => {
            expect(colorPicker != null).assertTrue();
            expect(typeof colorPicker === 'object').assertTrue();
            console.info(msgStr + 'createColorPicker with editable PixelMap success');
            done();
          }).catch((ex:BusinessError) => {
            console.error(msgStr + 'createColorPicker error' + ex.toString());
            expect(true).assertFail();
            done();
          });
        }).catch((err:Error) => {
          console.info(msgStr + 'createPixelMap err', err);
          expect().assertFail();
          done();
        })
      })

    /**
     * @tc.name   colorPicker_promise_one_0200
     * @tc.number ACTS_CREATECOLORPICKER_PROMISE_ONE_002
     * @tc.desc   Test createColorPicker with null pixelMap parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorPicker_promise_one_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = 'colorPicker_promise_one_0200';
        let msgStr = 'www data ' + caseName + ' ';
        const color = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        };
        image.createPixelMap(color, opts).then((pixelMap) => {
          console.info(msgStr + ' isEditable ', pixelMap.isEditable)
          console.info(msgStr+ ' isStrideAlignment ', pixelMap.isStrideAlignment)
          expect(pixelMap.isEditable).assertFalse(); // false
          expect(pixelMap.isStrideAlignment).assertFalse(); // false
          // Test createColorPicker with editable PixelMap
          effectKit.createColorPicker(pixelMap).then(colorPicker => {
            expect(colorPicker != null).assertTrue();
            expect(typeof colorPicker === 'object').assertTrue();
            console.info(msgStr + 'createColorPicker with editable PixelMap success');
            done();
          }).catch((ex:BusinessError) => {
            console.error(msgStr + 'createColorPicker error' + ex.toString());
            expect(true).assertFail();
            done();
          });
        }).catch((err:Error) => {
          console.info(msgStr + 'createPixelMap err', err);
          expect().assertFail();
          done();
        })
      })

    /**
     * @tc.name   colorPicker_promise_one_0300
     * @tc.number ACTS_CREATECOLORPICKER_PROMISE_ONE_003
     * @tc.desc   Test createColorPicker with null pixelMap parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorPicker_promise_one_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = 'colorPicker_promise_one_0300';
        let msgStr = 'www data ' + caseName + ' ';
        const color = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        };
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
          console.log(msgStr + 'isEditable=' + pixelMap.isEditable + ' isStrideAlignment=' + pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue(); // true
          expect(pixelMap.isStrideAlignment).assertTrue(); // true
          effectKit.createColorPicker(pixelMap).then(colorPicker => {
            expect(colorPicker != null).assertTrue();
            expect(typeof colorPicker === 'object').assertTrue();
            console.info(msgStr + 'createColorPicker with editable PixelMap success');
            done();
          }).catch((ex:BusinessError) => {
            console.error(msgStr + 'createColorPicker error' + ex.toString());
            expect(true).assertFail();
            done();
          });
        } catch(err){
          console.info(msgStr + 'createPixelMap err', err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   colorPicker_promise_one_0400
     * @tc.number ACTS_CREATECOLORPICKER_PROMISE_ONE_004
     * @tc.desc   Test createColorPicker with null pixelMap parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorPicker_promise_one_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = 'colorPicker_promise_one_0400';
        let msgStr = 'www data ' + caseName + ' ';
        const color = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        };
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
          console.log(msgStr + 'isEditable=' + pixelMap.isEditable + ' isStrideAlignment=' + pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertFalse(); // false
          expect(pixelMap.isStrideAlignment).assertTrue(); // true
          effectKit.createColorPicker(pixelMap).then(colorPicker => {
            expect(colorPicker != null).assertTrue();
            expect(typeof colorPicker === 'object').assertTrue();
            console.info(msgStr + 'createColorPicker with editable PixelMap success');
            done();
          }).catch((ex:BusinessError) => {
            console.error(msgStr + 'createColorPicker error' + ex.toString());
            expect(true).assertFail();
            done();
          });
        } catch(err){
          console.info(msgStr + 'createPixelMap err', err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   colorPicker_promise_two_0100
     * @tc.number ACTS_CREATECOLORPICKER_PROMISE_TWO_001
     * @tc.desc   Test createColorPicker with null pixelMap parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorPicker_promise_two_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = 'colorPicker_promise_two_0100';
        let msgStr = 'www data ' + caseName + ' ';
        const color = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        };
        image.createPixelMap(color, opts).then((pixelMap) => {
          console.info(msgStr + ' isEditable ', pixelMap.isEditable)
          console.info(msgStr+ ' isStrideAlignment ', pixelMap.isStrideAlignment)
          expect(pixelMap.isEditable).assertTrue(); // true
          expect(pixelMap.isStrideAlignment).assertFalse(); // false
          // Test createColorPicker with editable PixelMap
          effectKit.createColorPicker(pixelMap, [0, 0, 1, 1]).then(colorPicker => {
            expect(colorPicker != null).assertTrue();
            expect(typeof colorPicker === 'object').assertTrue();
            console.info(msgStr + 'createColorPicker with editable PixelMap success');
            done();
          }).catch((ex:BusinessError) => {
            console.error(msgStr + 'createColorPicker error' + ex.toString());
            expect(true).assertFail();
            done();
          });
        }).catch((err:Error) => {
          console.info(msgStr + 'createPixelMap err', err);
          expect().assertFail();
          done();
        })
      })

    /**
     * @tc.name   colorPicker_promise_two_0200
     * @tc.number ACTS_CREATECOLORPICKER_PROMISE_TWO_002
     * @tc.desc   Test createColorPicker with null pixelMap parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorPicker_promise_two_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = 'colorPicker_promise_two_0200';
        let msgStr = 'www data ' + caseName + ' ';
        const color = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        };
        image.createPixelMap(color, opts).then((pixelMap) => {
          console.info(msgStr + ' isEditable ', pixelMap.isEditable)
          console.info(msgStr+ ' isStrideAlignment ', pixelMap.isStrideAlignment)
          expect(pixelMap.isEditable).assertFalse(); // false
          expect(pixelMap.isStrideAlignment).assertFalse(); // false
          // Test createColorPicker with editable PixelMap
          effectKit.createColorPicker(pixelMap, [0, 0, 1, 1]).then(colorPicker => {
            expect(colorPicker != null).assertTrue();
            expect(typeof colorPicker === 'object').assertTrue();
            console.info(msgStr + 'createColorPicker with editable PixelMap success');
            done();
          }).catch((ex:BusinessError) => {
            console.error(msgStr + 'createColorPicker error' + ex.toString());
            expect(true).assertFail();
            done();
          });
        }).catch((err:Error) => {
          console.info(msgStr + 'createPixelMap err', err);
          expect().assertFail();
          done();
        })
      })

    /**
     * @tc.name   colorPicker_promise_two_0300
     * @tc.number ACTS_CREATECOLORPICKER_PROMISE_TWO_003
     * @tc.desc   Test createColorPicker with null pixelMap parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorPicker_promise_two_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = 'colorPicker_promise_two_0300';
        let msgStr = 'www data ' + caseName + ' ';
        const color = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        };
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
          console.log(msgStr + 'isEditable=' + pixelMap.isEditable + ' isStrideAlignment=' + pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue(); // true
          expect(pixelMap.isStrideAlignment).assertTrue(); // true
          effectKit.createColorPicker(pixelMap, [0, 0, 1, 1]).then(colorPicker => {
            expect(colorPicker != null).assertTrue();
            expect(typeof colorPicker === 'object').assertTrue();
            console.info(msgStr + 'createColorPicker with editable PixelMap success');
            done();
          }).catch((ex:BusinessError) => {
            console.error(msgStr + 'createColorPicker error' + ex.toString());
            expect(true).assertFail();
            done();
          });
        } catch(err){
          console.info(msgStr + 'createPixelMap err', err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   colorPicker_promise_two_0400
     * @tc.number ACTS_CREATECOLORPICKER_PROMISE_TWO_004
     * @tc.desc   Test createColorPicker with null pixelMap parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorPicker_promise_two_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = 'colorPicker_promise_two_0400';
        let msgStr = 'www data ' + caseName + ' ';
        const color = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        };
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
          console.log(msgStr + 'isEditable=' + pixelMap.isEditable + ' isStrideAlignment=' + pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertFalse(); // false
          expect(pixelMap.isStrideAlignment).assertTrue(); // true
          effectKit.createColorPicker(pixelMap, [0, 0, 1, 1]).then(colorPicker => {
            expect(colorPicker != null).assertTrue();
            expect(typeof colorPicker === 'object').assertTrue();
            console.info(msgStr + 'createColorPicker with editable PixelMap success');
            done();
          }).catch((ex:BusinessError) => {
            console.error(msgStr + 'createColorPicker error' + ex.toString());
            expect(true).assertFail();
            done();
          });
        } catch(err){
          console.info(msgStr + 'createPixelMap err', err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   colorPicker_callback_one_0100
     * @tc.number ACTS_CREATECOLORPICKER_CALLBACK_ONE_001
     * @tc.desc   Test createColorPicker with null pixelMap parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorPicker_callback_one_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = 'colorPicker_callback_one_0100';
        let msgStr = 'www data ' + caseName + ' ';
        const color = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        };
        image.createPixelMap(color, opts).then((pixelMap) => {
          console.info(msgStr + ' isEditable ', pixelMap.isEditable)
          console.info(msgStr+ ' isStrideAlignment ', pixelMap.isStrideAlignment)
          expect(pixelMap.isEditable).assertTrue(); // true
          expect(pixelMap.isStrideAlignment).assertFalse(); // false
          // Test createColorPicker with editable Callback
          effectKit.createColorPicker(pixelMap, (error, colorPicker) => {
            if (error) {
              console.error(msgStr + 'Failed to create color picker.');
              expect().assertFail();
              done();
            } else {
              console.info(msgStr + 'Succeeded in creating color picker.');
              expect(colorPicker !== null).assertTrue();
              done();
            }
          })
        }).catch((err:Error) => {
          console.info(msgStr + 'createPixelMap err', err);
          expect().assertFail();
          done();
        })
      })

    /**
     * @tc.name   colorPicker_callback_one_0200
     * @tc.number ACTS_CREATECOLORPICKER_CALLBACK_ONE_002
     * @tc.desc   Test createColorPicker with null pixelMap parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorPicker_callback_one_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = 'colorPicker_callback_one_0200';
        let msgStr = 'www data ' + caseName + ' ';
        const color = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        };
        image.createPixelMap(color, opts).then((pixelMap) => {
          console.info(msgStr + ' isEditable ', pixelMap.isEditable)
          console.info(msgStr+ ' isStrideAlignment ', pixelMap.isStrideAlignment)
          expect(pixelMap.isEditable).assertFalse(); // false
          expect(pixelMap.isStrideAlignment).assertFalse(); // false
          // Test createColorPicker with editable Callback
          effectKit.createColorPicker(pixelMap, (error, colorPicker) => {
            if (error) {
              console.error(msgStr + 'Failed to create color picker.');
              expect().assertFail();
              done();
            } else {
              console.info(msgStr + 'Succeeded in creating color picker.');
              expect(colorPicker !== null).assertTrue();
              done();
            }
          })
        }).catch((err:Error) => {
          console.info(msgStr + 'createPixelMap err', err);
          expect().assertFail();
          done();
        })
      })

    /**
     * @tc.name   colorPicker_callback_one_0300
     * @tc.number ACTS_CREATECOLORPICKER_CALLBACK_ONE_003
     * @tc.desc   Test createColorPicker with null pixelMap parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorPicker_callback_one_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = 'colorPicker_callback_one_0300';
        let msgStr = 'www data ' + caseName + ' ';
        const color = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        };
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
          console.log(msgStr + 'isEditable=' + pixelMap.isEditable + ' isStrideAlignment=' + pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue(); // true
          expect(pixelMap.isStrideAlignment).assertTrue(); // true
          // Test createColorPicker with editable Callback
          effectKit.createColorPicker(pixelMap, (error, colorPicker) => {
            if (error) {
              console.error(msgStr + 'Failed to create color picker.');
              expect().assertFail();
              done();
            } else {
              console.info(msgStr + 'Succeeded in creating color picker.');
              expect(colorPicker !== null).assertTrue();
              done();
            }
          })
        } catch(err){
          console.info(msgStr + 'createPixelMap err', err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   colorPicker_callback_one_0400
     * @tc.number ACTS_CREATECOLORPICKER_CALLBACK_ONE_004
     * @tc.desc   Test createColorPicker with null pixelMap parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorPicker_callback_one_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = 'colorPicker_callback_one_0400';
        let msgStr = 'www data ' + caseName + ' ';
        const color = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        };
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
          console.log(msgStr + 'isEditable=' + pixelMap.isEditable + ' isStrideAlignment=' + pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertFalse(); // false
          expect(pixelMap.isStrideAlignment).assertTrue(); // true
          // Test createColorPicker with editable Callback
          effectKit.createColorPicker(pixelMap, (error, colorPicker) => {
            if (error) {
              console.error(msgStr + 'Failed to create color picker.');
              expect().assertFail();
              done();
            } else {
              console.info(msgStr + 'Succeeded in creating color picker.');
              expect(colorPicker !== null).assertTrue();
              done();
            }
          })
        } catch(err){
          console.info(msgStr + 'createPixelMap err', err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   colorPicker_callback_two_0100
     * @tc.number ACTS_CREATECOLORPICKER_CALLBACK_TWO_001
     * @tc.desc   Test createColorPicker with null pixelMap parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorPicker_callback_two_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = 'colorPicker_callback_two_0100';
        let msgStr = 'www data ' + caseName + ' ';
        const color = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        };
        image.createPixelMap(color, opts).then((pixelMap) => {
          console.info(msgStr + ' isEditable ', pixelMap.isEditable)
          console.info(msgStr+ ' isStrideAlignment ', pixelMap.isStrideAlignment)
          expect(pixelMap.isEditable).assertTrue(); // true
          expect(pixelMap.isStrideAlignment).assertFalse(); // false
          // Test createColorPicker with editable Callback
          effectKit.createColorPicker(pixelMap, [0, 0, 1, 1], (error, colorPicker) => {
            if (error) {
              console.error(msgStr + 'Failed to create color picker.');
              expect().assertFail();
              done();
            } else {
              console.info(msgStr + 'Succeeded in creating color picker.');
              expect(colorPicker !== null).assertTrue();
              done();
            }
          })
        }).catch((err:Error) => {
          console.info(msgStr + 'createPixelMap err', err);
          expect().assertFail();
          done();
        })
      })

    /**
     * @tc.name   colorPicker_callback_two_0200
     * @tc.number ACTS_CREATECOLORPICKER_CALLBACK_TWO_002
     * @tc.desc   Test createColorPicker with null pixelMap parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorPicker_callback_two_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = 'colorPicker_callback_two_0200';
        let msgStr = 'www data ' + caseName + ' ';
        const color = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        };
        image.createPixelMap(color, opts).then((pixelMap) => {
          console.info(msgStr + ' isEditable ', pixelMap.isEditable)
          console.info(msgStr+ ' isStrideAlignment ', pixelMap.isStrideAlignment)
          expect(pixelMap.isEditable).assertFalse(); // false
          expect(pixelMap.isStrideAlignment).assertFalse(); // false
          // Test createColorPicker with editable Callback
          effectKit.createColorPicker(pixelMap, [0, 0, 1, 1], (error, colorPicker) => {
            if (error) {
              console.error(msgStr + 'Failed to create color picker.');
              expect().assertFail();
              done();
            } else {
              console.info(msgStr + 'Succeeded in creating color picker.');
              expect(colorPicker !== null).assertTrue();
              done();
            }
          })
        }).catch((err:Error) => {
          console.info(msgStr + 'createPixelMap err', err);
          expect().assertFail();
          done();
        })
      })

    /**
     * @tc.name   colorPicker_callback_two_0300
     * @tc.number ACTS_CREATECOLORPICKER_CALLBACK_TWO_003
     * @tc.desc   Test createColorPicker with null pixelMap parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorPicker_callback_two_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = 'colorPicker_callback_two_0300';
        let msgStr = 'www data ' + caseName + ' ';
        const color = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        };
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
          console.log(msgStr + 'isEditable=' + pixelMap.isEditable + ' isStrideAlignment=' + pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertTrue(); // true
          expect(pixelMap.isStrideAlignment).assertTrue(); // true
          // Test createColorPicker with editable Callback
          effectKit.createColorPicker(pixelMap, [0, 0, 1, 1], (error, colorPicker) => {
            if (error) {
              console.error(msgStr + 'Failed to create color picker.');
              expect().assertFail();
              done();
            } else {
              console.info(msgStr + 'Succeeded in creating color picker.');
              expect(colorPicker !== null).assertTrue();
              done();
            }
          })
        } catch(err){
          console.info(msgStr + 'createPixelMap err', err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   colorPicker_callback_two_0400
     * @tc.number ACTS_CREATECOLORPICKER_CALLBACK_TWO_004
     * @tc.desc   Test createColorPicker with null pixelMap parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorPicker_callback_two_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = 'colorPicker_callback_two_0400';
        let msgStr = 'www data ' + caseName + ' ';
        const color = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          size: { height: 4, width: 6 }
        };
        try {
          let pixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.DMA);
          console.log(msgStr + 'isEditable=' + pixelMap.isEditable + ' isStrideAlignment=' + pixelMap.isStrideAlignment);
          expect(pixelMap.isEditable).assertFalse(); // false
          expect(pixelMap.isStrideAlignment).assertTrue(); // true
          // Test createColorPicker with editable Callback
          effectKit.createColorPicker(pixelMap, [0, 0, 1, 1], (error, colorPicker) => {
            if (error) {
              console.error(msgStr + 'Failed to create color picker.');
              expect().assertFail();
              done();
            } else {
              console.info(msgStr + 'Succeeded in creating color picker.');
              expect(colorPicker !== null).assertTrue();
              done();
            }
          })
        } catch(err){
          console.info(msgStr + 'createPixelMap err', err);
          expect().assertFail();
          done();
        }
      })

  })
}