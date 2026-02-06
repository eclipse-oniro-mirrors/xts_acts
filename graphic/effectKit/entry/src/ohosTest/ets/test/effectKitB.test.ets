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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICEFFECTKIT_JS_API_0010
     * @tc.name      : testGetTopProportionColors
     * @tc.desc      : Read the first color value of the image. The number is specified by colorCount. The result is written into the Color array and returned in synchronization mode.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetTopProportionColors', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let msgStr = 'testGetTopProportionColors'
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICEFFECTKIT_JS_API_0020
     * @tc.name      : testInvert
     * @tc.desc      : Read the first color value of the image. The number is specified by colorCount. The result is written into the Color array and returned in synchronization mode.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testInvert', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let msgStr = 'testInvert'
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICEFFECTKIT_JS_API_0030
     * @tc.name      : testSetColorMatrix
     * @tc.desc      : Read the first color value of the image. The number is specified by colorCount. The result is written into the Color array and returned in synchronization mode.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetColorMatrix', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let msgStr = 'testSetColorMatrix'
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICEFFECTKIT_JS_API_0040
     * @tc.name      : testTileMode
     * @tc.desc      : Enumeration of the shader effect tile mode.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testTileMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let msg = 'testTileMode'
      console.log(msg + ' begin')
      expect(effectKit.TileMode.CLAMP).assertEqual(0)
      expect(effectKit.TileMode.REPEAT).assertEqual(1)
      expect(effectKit.TileMode.MIRROR).assertEqual(2)
      expect(effectKit.TileMode.DECAL).assertEqual(3)
      done()
    })
    
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICEFFECTKIT_JS_API_0050
     * @tc.name      : testBlurTileMode
     * @tc.desc      : Adds the blur effect to the effect list. The result is returned to the first node of the effect list
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testBlurTileMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let msgStr = 'testBlurTileMode'
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
     * @tc.number    : testGetEffectPixelMap_useCpuRender1
     * @tc.name      : testGetEffectPixelMap_useCpuRender1
     * @tc.desc      : test getEffectPixelMap useCpuRender
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('testGetEffectPixelMap_useCpuRender1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
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
          console.info('getPixelBytesNumber = ', data.getPixelBytesNumber());
          done();
        }).catch((err: BusinessError) => {
          expect().assertFail();
          done();
        })
      })
    })
    
    /**
     * @tc.number    : testGetEffectPixelMap_useCpuRender2
     * @tc.name      : testGetEffectPixelMap_useCpuRender2
     * @tc.desc      : test getEffectPixelMap useCpuRender
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('testGetEffectPixelMap_useCpuRender2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
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
          console.info('getPixelBytesNumber = ', data.getPixelBytesNumber());
          done();
        }).catch((err: BusinessError) => {
          expect().assertFail();
          done();
        })
      })
    })
    
    /**
     * @tc.number     testGetTopProportionColors_2
     * @tc.name       testGetTopProportionColors_2
     * @tc.desc       test getTopProportionColors
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level1
     */
    it('testGetTopProportionColors_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let msgStr = 'testGetTopProportionColors_2'
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
     * @tc.number     isBlackOrWhiteOrGrayColor_2
     * @tc.name       isBlackOrWhiteOrGrayColor_2
     * @tc.desc       test isBlackOrWhiteOrGrayColor
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level1
     */
    it('isBlackOrWhiteOrGrayColor_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let msgStr = 'isBlackOrWhiteOrGrayColor_2'
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
  })
}