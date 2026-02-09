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
import common from '@ohos.app.ability.common';
import ohosWindow from '@ohos.window';


export default function effectKitTest(context: common.UIAbilityContext, windowStage: ohosWindow.WindowStage, abilityStorage: LocalStorage) {
  describe('effectKitTest', () => {
    console.log('describe effectKitTest start!!!');

    /**
     * @tc.name   createEffect1
     * @tc.number EFFECT_KIT_CREATEEFFECT_JSAPI_001
     * @tc.desc   Create a FilterChain to add multiple effects to an image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createEffect1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'createEffect1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      imageSource.getImageInfo((err, value) => {
        console.error(msgStr + "Napi size=" + value.size.width + " X " + value.size.height);
      })
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let filter = effectKit.createEffect(pixelMap);
        expect(filter != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
      console.info(msgStr + "Napi create pixmap.end");
      done();
    })

    /**
     * @tc.name   createEffect2
     * @tc.number EFFECT_KIT_CREATEEFFECT_JSAPI_002
     * @tc.desc   Create a FilterChain to add multiple effects to an image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createEffect2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'createEffect2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let pixelmap = null;
      let filter = effectKit.createEffect(pixelmap);
      expect(filter == null).assertTrue();
      done();
    })

    /**
     * @tc.name   blur1
     * @tc.number EFFECT_KIT_BLUR_JSAPI_001
     * @tc.desc   A blur effect is added to the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('blur1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'blur1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      imageSource.getImageInfo((err, value) => {
        console.error(msgStr + "image size=" + value.size.width + " X " + value.size.height);
      })
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log("effectKitTest blur1 createEffect faild");
          expect(true).assertFail();
          done();
        }
        let blurFilter = headFilter.blur(10);
        expect(blurFilter != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
      console.info(msgStr + "Napi create pixmap.end");
      done();
    })

    /**
     * @tc.name   blur2
     * @tc.number EFFECT_KIT_BLUR_JSAPI_002
     * @tc.desc   A blur effect is added to the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('blur2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'blur2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      imageSource.getImageInfo((err, value) => {
        console.error(msgStr + "image size=" + value.size.width + " X " + value.size.height);
      })
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log("effectKitTest blur2 createEffect faild");
          expect(true).assertFail();
          done();
        }
        let blurFilter = headFilter.blur(-10);
        expect(blurFilter != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
      console.info(msgStr + "Napi create pixmap.end");
      done();
    })

    /**
     * @tc.name   blur3
     * @tc.number EFFECT_KIT_BLUR_JSAPI_003
     * @tc.desc   A blur effect is added to the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('blur3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'blur3';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      imageSource.getImageInfo((err, value) => {
        console.error(msgStr + "image size=" + value.size.width + " X " + value.size.height);
      })
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log("effectKitTest blur3 createEffect faild");
          expect(true).assertFail();
          done();
        }
        let blurFilter = headFilter.blur(0);
        expect(blurFilter != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
      console.info(msgStr + "Napi create pixmap.end");
      done();
    })

    /**
     * @tc.name   brightness1
     * @tc.number EFFECT_KIT_BRIGHTNESS_JSAPI_001
     * @tc.desc   A Brightness effect is added to the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('brightness1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'brightness1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      imageSource.getImageInfo((err, value) => {
        console.error(msgStr + "image size=" + value.size.width + " X " + value.size.height);
      })
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {;
          console.log("effectKitTest brightness1 createEffect faild");
          expect(true).assertFail();
          done();
        }
        let brightFilter = headFilter.brightness(0);
        expect(brightFilter != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
      console.info(msgStr + "Napi create pixmap.end");
      done();
    })

    /**
     * @tc.name   brightness2
     * @tc.number EFFECT_KIT_BRIGHTNESS_JSAPI_002
     * @tc.desc   A Brightness effect is added to the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('brightness2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'brightness2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      imageSource.getImageInfo((err, value) => {
        console.error(msgStr + "image size=" + value.size.width + " X " + value.size.height);
      })
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log("effectKitTest brightness2 createEffect faild");
          expect(true).assertFail();
          done();
        }
        let brightFilter = headFilter.brightness(0.5);
        expect(brightFilter != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
      console.info(msgStr + "Napi create pixmap.end");
      done();
    })

    /**
     * @tc.name   brightness3
     * @tc.number EFFECT_KIT_BRIGHTNESS_JSAPI_003
     * @tc.desc   A Brightness effect is added to the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('brightness3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'brightness3';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      imageSource.getImageInfo((err, value) => {
        console.error(msgStr + "image size=" + value.size.width + " X " + value.size.height);
      })
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log("effectKitTest brightness3 createEffect faild");
          expect(true).assertFail();
          done();
        }
        let brightFilter = headFilter.brightness(-0.5);
        expect(brightFilter != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
      console.info(msgStr + "Napi create pixmap.end");
      done();
    })

    /**
     * @tc.name   grayscale1
     * @tc.number EFFECT_KIT_GRAYSCALE_JSAPI_001
     * @tc.desc   A Grayscale effect is added to the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('grayscale1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'grayscale1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      imageSource.getImageInfo((err, value) => {
        console.error(msgStr + "image size=" + value.size.width + " X " + value.size.height);
      })
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log("effectKitTest grayscale1 createEffect faild");
          expect(true).assertFail();
          done();
        }
        let grayFilter = headFilter.grayscale();
        expect(grayFilter != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
      console.info(msgStr + "Napi create pixmap.end");
      done();
    })

    /**
     * @tc.name   getPixelMap1
     * @tc.number EFFECT_KIT_GETPIXELMAP_JSAPI_001
     * @tc.desc   Gets the PixelMap where all filter effects have been added to the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getPixelMap1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'getPixelMap1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      imageSource.getImageInfo((err, value) => {
        console.error(msgStr + "image size=" + value.size.width + " X " + value.size.height);
      })
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log("effectKitTest getPixelMap1 createEffect faild");
          expect(true).assertFail();
          done();
        }
        let resultPixel = headFilter.getPixelMap();
        expect(resultPixel != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
      console.info(msgStr + "Napi create pixmap.end");
      done();
    })

    /**
     * @tc.name   getPixelMap2
     * @tc.number EFFECT_KIT_GETPIXELMAP_JSAPI_002
     * @tc.desc   Gets the PixelMap where all filter effects have been added to the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getPixelMap2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'getPixelMap2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      imageSource.getImageInfo((err, value) => {
        console.error(msgStr + "image size=" + value.size.width + " X " + value.size.height);
      })
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log("effectKitTest getPixelMap2 createEffect faild");
          expect(true).assertFail();
          done();
        }
        let resultPixel = headFilter.grayscale().getPixelMap();
        expect(resultPixel != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
      console.info(msgStr + "Napi create pixmap.end");
      done();
    })

    /**
     * @tc.name   getPixelMap3
     * @tc.number EFFECT_KIT_GETPIXELMAP_JSAPI_003
     * @tc.desc   Gets the PixelMap where all filter effects have been added to the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getPixelMap3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'getPixelMap3';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      imageSource.getImageInfo((err, value) => {
        console.error(msgStr + "image size=" + value.size.width + " X " + value.size.height);
      })
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log("effectKitTest getPixelMap3 createEffect faild");
          expect(true).assertFail();
          done();
        }
        let resultPixel = headFilter.blur(5).brightness(0.5).grayscale().getPixelMap();
        expect(resultPixel != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
      console.info(msgStr + "Napi create pixmap.end");
      done();
    })

    /**
     * @tc.name   createColorPicker1
     * @tc.number EFFECT_KIT_CREATECOLORPICKER_JSAPI_001
     * @tc.desc   Create a color picker to get the main color.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createColorPicker1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'createColorPicker1';
      let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
      console.log(msgStr + 'begin');
      let imageSource = image.createImageSource(testPng.buffer);
      console.info(msgStr + "promise create pixmap.start");
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create ColorPicker.start");
        effectKit.createColorPicker(pixelMap).then(colorPicker => {
          console.info(msgStr + "Napi createColorPicker");
          done();
        }).catch((ex: BusinessError) => {
          console.error(msgStr + "Napi colorPicker.error=" + ex.toString());
          expect(true).assertFail();
          done();
        })
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
      console.info(msgStr + "Napi create pixmap.end");
      done();
    })

    /**
     * @tc.name   createColorPicker2
     * @tc.number EFFECT_KIT_CREATECOLORPICKER_JSAPI_002
     * @tc.desc   Create a color picker to get the main color.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createColorPicker2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'createColorPicker2';
      let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
      console.log(msgStr + 'begin');
      console.info(msgStr + "Napi create ImageSource");
      let imageSource = image.createImageSource(testJpg.buffer);
      console.info(msgStr + "promise create pixmap.start");
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create ColorPicker.start");
        effectKit.createColorPicker(pixelMap).then(colorPicker => {
          console.info(msgStr + "Napi createColorPicker");
          done();
        }).catch((ex: BusinessError) => {
          console.error(msgStr + "Napi colorPicker.error=" + ex.toString());
          expect(true).assertFail();
          done();
        })
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
      console.info(msgStr + "Napi create pixmap.end");
      done();
    })

    /**
     * @tc.name   createColorPicker3
     * @tc.number EFFECT_KIT_CREATECOLORPICKER_JSAPI_003
     * @tc.desc   Create a color picker to get the main color.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createColorPicker3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'createColorPicker3';
      let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
      console.log(msgStr + 'begin');
      console.info(msgStr + "Napi create ImageSource");
      let imageSource = image.createImageSource(testJpg.buffer);
      console.info(msgStr + "promise create pixmap.start");
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create ColorPicker.start");
        effectKit.createColorPicker(pixelMap).then(colorPicker => {
          console.info(msgStr + "Napi create color picker");
          done();
        }).catch((ex: BusinessError) => {
          console.error(msgStr + "Napi colorPicker.error=" + ex.toString());
          expect(true).assertFail();
          done();
        })
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
      console.info(msgStr + "Napi create pixmap.end");
      done();
    })

    /**
     * @tc.name   createColorPicker4
     * @tc.number EFFECT_KIT_CREATECOLORPICKER_JSAPI_004
     * @tc.desc   Create a color picker to get the main color.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createColorPicker4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'createColorPicker4';
      let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
      console.log(msgStr + 'begin');
      console.info(msgStr + "Napi create ImageSource");
      let imageSource = image.createImageSource(testPng.buffer);
      console.info(msgStr + "promise create pixmap.start");
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create ColorPicker.start");
        effectKit.createColorPicker(pixelMap).then(colorPicker => {
          console.info(msgStr + "Napi createColorPicker");
          done();
        }).catch((ex: BusinessError) => {
          console.error(msgStr + "Napi colorPicker.error=" + ex.toString());
          expect(true).assertFail();
          done();
        })
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
      console.info(msgStr + "Napi create pixmap.end");
      done();
    })

    /**
     * @tc.name   createColorPicker5
     * @tc.number EFFECT_KIT_CREATECOLORPICKER_JSAPI_005
     * @tc.desc   Create a color picker to get the main color.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createColorPicker5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'createColorPicker5';
      let msgStr = 'jsunittest effectKitTest' + caseName + ' '
      console.log(msgStr + 'begin');
      let imageSource = image.createImageSource(testPng.buffer);
      console.info(msgStr + "callback create pixmap.start");
      imageSource.createPixelMap((error, pixelMap) => {
        if (error) {
          console.info("Napi error,create pixmap");
          expect(true).assertFail();
          done();
        }
        console.info("Napi create ColorPicker.start");
        effectKit.createColorPicker(pixelMap, (error, colorPicker) => {
          if (error) {
            console.error("Napi error, create color picker");
            expect(true).assertFail();
            done();
          }
          console.info(msgStr + "Napi create ok");
          done();
        })
      })
      console.info(msgStr + "Napi create pixmap.end");
      done();
    })

    /**
     * @tc.name   createColorPicker6
     * @tc.number EFFECT_KIT_CREATECOLORPICKER_JSAPI_006
     * @tc.desc   Create a color picker to get the main color.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createColorPicker6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'createColorPicker6';
      let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
      console.log(msgStr + 'begin');
      console.info(msgStr + "Napi create ImageSource");
      let imageSource = image.createImageSource(testJpg.buffer);
      console.info(msgStr + "callback create pixmap.start");
      imageSource.createPixelMap((error, pixelMap) => {
        if (error) {
          console.info("Napi error,create pixmap");
          expect(true).assertFail();
          done();
        }
        console.info("Napi create ColorPicker.start");
        effectKit.createColorPicker(pixelMap, (error, colorPicker) => {
          if (error) {
            console.error("Napi error, create color picker");
            expect(true).assertFail();
            done();
          }
          console.info(msgStr + "Napi create ok");
          done();
        })
      })
      console.info(msgStr + "Napi create pixmap.end");
      done();
    })

    /**
     * @tc.name   createColorPicker7
     * @tc.number EFFECT_KIT_CREATECOLORPICKER_JSAPI_007
     * @tc.desc   Create a color picker to get the main color.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createColorPicker7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'createColorPicker7';
      let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
      console.log(msgStr + 'begin');
      let imageSource = image.createImageSource(testPng.buffer);
      console.info(msgStr + "promise create pixmap.start");
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create ColorPicker.start");
        effectKit.createColorPicker(pixelMap).then(colorPicker => {
          console.info(msgStr + "Napi createColorPicker");
          done();
        }).catch((ex: BusinessError) => {
          console.error(msgStr + "Napi colorPicker.error=" + ex.toString());
          expect(true).assertFail();
          done();
        })
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
      console.info(msgStr + "Napi create pixmap.end");
      done();
    })

    /**
     * @tc.name   getMainColor1
     * @tc.number EFFECT_KIT_GETMAINCOLOR_JSAPI_001
     * @tc.desc   Create a color picker to get the main color.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getMainColor1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'getMainColor1';
      let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
      console.log(msgStr + 'begin');
      let imageSource = image.createImageSource(testPng.buffer);
      console.info(msgStr + "promise create pixmap.start");
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create ColorPicker.start");
        effectKit.createColorPicker(pixelMap).then(colorPicker => {
          console.info(msgStr + "Napi get main color start");
          colorPicker.getMainColor().then(color => {
            console.info(msgStr + "Napi color[ARGB]=" + color.red + "," + color.green + "," + color.blue);
            done();
          }).catch((ex: BusinessError) => {
            console.error(msgStr + "Napi color.error=" + ex.toString());
            expect(true).assertFail();
            done();
          })
        }).catch((ex: BusinessError) => {
          console.error(msgStr + "Napi colorPicker.error=" + ex.toString());
          expect(true).assertFail();
          done();
        })
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
      console.info(msgStr + "Napi create pixmap.end");
      done();
    })

    /**
     * @tc.name   getMainColor2
     * @tc.number EFFECT_KIT_GETMAINCOLOR_JSAPI_002
     * @tc.desc   Create a color picker to get the main color.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getMainColor2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'getMainColor2';
      let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
      console.log(msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      console.info(msgStr + "promise create pixmap.start");
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create ColorPicker.start");
        effectKit.createColorPicker(pixelMap).then(colorPicker => {
          console.info(msgStr + "Napi get main color start");
          colorPicker.getMainColor().then(color => {
            console.info(msgStr + "Napi color[ARGB]=" + color.red + "," + color.green + "," + color.blue);
            done();
          }).catch((ex: BusinessError) => {
            console.error(msgStr + "Napi color.error=" + ex.toString());
            expect(true).assertFail();
            done();
          })
        }).catch((ex: BusinessError) => {
          console.error(msgStr + "Napi colorPicker.error=" + ex.toString());
          expect(true).assertFail();
          done();
        })
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
      console.info(msgStr + "Napi create pixmap.end");
      done();
    })

    /**
     * @tc.name   getMainColorSync1
     * @tc.number EFFECT_KIT_GETMAINCOLORSYNC_JSAPI_001
     * @tc.desc   Create a color picker to get the main color.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getMainColorSync1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'getMainColorSync1';
      let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
      console.log(msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      console.info(msgStr + "promise create pixmap.start");
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create ColorPicker.start");
        effectKit.createColorPicker(pixelMap).then(colorPicker => {
          console.info(msgStr + "Napi get main color start");
          let color = colorPicker.getMainColorSync();
          console.info(msgStr + "Napi color[ARGB]=" + color.red + "," + color.green + "," + color.blue);
          done();
        }).catch((ex: BusinessError) => {
          console.error(msgStr + "Napi colorPicker.error=" + ex.toString());
          expect(true).assertFail();
          done();
        })
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
      console.info(msgStr + "Napi create pixmap.end");
      done();
    })

    /**
     * @tc.name   getMainColorSync2
     * @tc.number EFFECT_KIT_GETMAINCOLORSYNC_JSAPI_002
     * @tc.desc   Create a color picker to get the main color.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getMainColorSync2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'getMainColorSync2';
      let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
      console.log(msgStr + 'begin');
      let imageSource = image.createImageSource(testPng.buffer);
      console.info(msgStr + "promise create pixmap.start");
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create ColorPicker.start");
        effectKit.createColorPicker(pixelMap).then(colorPicker => {
          console.info(msgStr + "Napi get main color start");
          let color = colorPicker.getMainColorSync();
          console.info(msgStr + "Napi color[ARGB]=" + color.red + "," + color.green + "," + color.blue);
          done();
        }).catch((ex: BusinessError) => {
          console.error(msgStr + "Napi colorPicker.error=" + ex.toString());
          expect(true).assertFail();
          done();
        })
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
      console.info(msgStr + "Napi create pixmap.end");
      done();
    })
    /**
     * @tc.name   getLargestProportionColor
     * @tc.number EFFECT_KIT_GETLARGESTPROPORTIONCOLOR_JSAPI_001
     * @tc.desc   .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getLargestProportionColor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'getLargestProportionColor';
      let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
      console.log(msgStr + 'begin');
      let imageSource = image.createImageSource(testPng.buffer);
      imageSource.getImageInfo((err, value) => {
        if (err) {
          try {
            expect(true).assertFail();
          } catch (err) {
            console.log(msgStr + 'expect assert fail');
          }
          done();
          return;
        }
        console.info(msgStr + "Napi size=" + value.size.width + " X " + value.size.height);
        let size: image.Size = {
          width: value.size.width, height: value.size.height
        }
        console.info(msgStr + "promise create pixmap.start");
        imageSource.createPixelMap({
          desiredSize: size
        }).then(pixelMap => {
          console.info(msgStr + "Napi create ColorPicker.start");
          effectKit.createColorPicker(pixelMap).then(colorPicker => {
            console.info(msgStr + "Napi createColorPicker");
            let color = colorPicker.getLargestProportionColor();
            console.log(msgStr + JSON.stringify(color));
            expect(color.alpha !== null).assertTrue();
            expect(color.red !== null).assertTrue();
            expect(color.green !== null).assertTrue();
            expect(color.blue !== null).assertTrue();
            done();
          }).catch((ex: BusinessError) => {
            console.error(msgStr + "Napi colorPicker.error=" + ex.toString());
            expect(true).assertFail();
            done();
          })
        }).catch((ex: BusinessError) => {
          console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
          expect(true).assertFail();
          done();
        })
      })
    })
    /**
     * @tc.name   getHighestSaturationColor
     * @tc.number EFFECT_KIT_GETHIGHESTSATURATIONCOLOR_JSAPI_001
     * @tc.desc   .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getHighestSaturationColor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'getHighestSaturationColor';
      let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
      console.log(msgStr + 'begin');
      let imageSource = image.createImageSource(testPng.buffer);
      imageSource.getImageInfo((err, value) => {
        if (err) {
          try {
            expect(true).assertFail();
          } catch (err) {
            console.log(msgStr + 'expect assert fail');
          }
          done();
          return;
        }
        console.info(msgStr + "Napi size=" + value.size.width + " X " + value.size.height);
        let size: image.Size = {
          width: value.size.width, height: value.size.height
        }
        console.info(msgStr + "promise create pixmap.start");
        imageSource.createPixelMap({
          desiredSize: size
        }).then(pixelMap => {
          console.info(msgStr + "Napi create ColorPicker.start");
          effectKit.createColorPicker(pixelMap).then(colorPicker => {
            console.info(msgStr + "Napi createColorPicker");
            let color = colorPicker.getHighestSaturationColor();
            console.log(msgStr + JSON.stringify(color));
            expect(color.alpha !== null).assertTrue();
            expect(color.red !== null).assertTrue();
            expect(color.green !== null).assertTrue();
            expect(color.blue !== null).assertTrue();
            done();
          }).catch((ex: BusinessError) => {
            console.error(msgStr + "Napi colorPicker.error=" + ex.toString());
            expect(true).assertFail();
            done();
          })
        }).catch((ex: BusinessError) => {
          console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
          expect(true).assertFail();
          done();
        })
      })
    })
    /**
     * @tc.name   getAverageColor
     * @tc.number EFFECT_KIT_GETAVERAGECOLOR_JSAPI_001
     * @tc.desc   .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAverageColor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'getAverageColor';
      let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
      console.log(msgStr + 'begin');
      let imageSource = image.createImageSource(testPng.buffer);
      imageSource.getImageInfo((err, value) => {
        if (err) {
          try {
            expect(true).assertFail();
          } catch (err) {
            console.log(msgStr + 'expect assert fail');
          }
          done()
          return;
        }
        console.info(msgStr + "Napi size=" + value.size.width + " X " + value.size.height);
        let size: image.Size = {
          width: value.size.width, height: value.size.height
        }
        console.info(msgStr + "promise create pixmap.start");
        imageSource.createPixelMap({
          desiredSize: size
        }).then(pixelMap => {
          console.info(msgStr + "Napi create ColorPicker.start");
          effectKit.createColorPicker(pixelMap).then(colorPicker => {
            console.info(msgStr + "Napi createColorPicker");
            let color = colorPicker.getAverageColor();
            console.log(msgStr + JSON.stringify(color));
            expect(color.alpha !== null).assertTrue();
            expect(color.red !== null).assertTrue();
            expect(color.green !== null).assertTrue();
            expect(color.blue !== null).assertTrue();
            done();
          }).catch((ex: BusinessError) => {
            console.error(msgStr + "Napi colorPicker.error=" + ex.toString());
            expect(true).assertFail();
            done();
          })
        }).catch((ex: BusinessError) => {
          console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
          expect(true).assertFail();
          done();
        })
      })
    })
    /**
     * @tc.name   isBlackOrWhiteOrGrayColor
     * @tc.number EFFECT_KIT_ISBLACKORWHITEORGRAYCOLOR_JSAPI_001
     * @tc.desc   .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isBlackOrWhiteOrGrayColor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'isBlackOrWhiteOrGrayColor';
      let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
      console.log(msgStr + 'begin');
      let imageSource = image.createImageSource(testPng.buffer);
      imageSource.getImageInfo((err, value) => {
        if (err) {
          try {
            expect(true).assertFail();
          } catch (err) {
            console.log(msgStr + 'expect assert fail');
          }
          done();
          return;
        }
        console.info(msgStr + "Napi size=" + value.size.width + " X " + value.size.height);
        let size: image.Size = {
          width: value.size.width, height: value.size.height
        }
        console.info(msgStr + "promise create pixmap.start");
        imageSource.createPixelMap({
          desiredSize: size
        }).then(pixelMap => {
          console.info(msgStr + "Napi create ColorPicker.start");
          effectKit.createColorPicker(pixelMap).then(colorPicker => {
            console.info(msgStr + "Napi createColorPicker");
            let color_white = colorPicker.isBlackOrWhiteOrGrayColor(0xFFFFFFFF);
            expect(color_white).assertTrue();
            let color_blue = colorPicker.isBlackOrWhiteOrGrayColor(0xFF0000FF);
            expect(!color_blue).assertTrue();
            let color_green = colorPicker.isBlackOrWhiteOrGrayColor(0xFF00FF00);
            expect(!color_green).assertTrue();
            let color_red = colorPicker.isBlackOrWhiteOrGrayColor(0xFFFF0000);
            expect(!color_red).assertTrue();
            let color_zero = colorPicker.isBlackOrWhiteOrGrayColor(0);
            expect(color_zero).assertTrue();
            done();
          }).catch((ex: BusinessError) => {
            console.error(msgStr + "Napi colorPicker.error=" + ex.toString());
            expect(true).assertFail();
            done();
          })
        }).catch((ex: BusinessError) => {
          console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
          expect(true).assertFail();
          done();
        })
      })
    })
    /**
     * @tc.name   createColorPickerTest001
     * @tc.number EFFECT_KIT_CREATECOLORPICKER_JSAPI_001
     * @tc.desc   Create a ColorPicker instance from the passed PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createColorPickerTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'createColorPickerTest001';
      let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
      console.log(msgStr + 'begin');
      let imageSource = image.createImageSource(testPng.buffer);
      imageSource.getImageInfo((err, value) => {
        if (err) {
          try {
            expect(true).assertFail();
          } catch (err) {
            console.log(msgStr + 'expect assert fail');
          }
          done()
          return;
        }
        console.info(msgStr + "Napi size=" + value.size.width + " X " + value.size.height);
        let size: image.Size = {
          width: value.size.width, height: value.size.height
        }
        console.info(msgStr + "promise create pixmap.start");
        imageSource.createPixelMap({
          desiredSize: size
        }).then(pixelMap => {
          console.info(msgStr + "Napi create ColorPicker.start");
          effectKit.createColorPicker(pixelMap, undefined).then(colorPicker => {
            console.info(msgStr + "Napi createColorPicker");
            let color = colorPicker.getAverageColor();
            console.log(msgStr + JSON.stringify(color));
            expect(color.alpha !== null).assertTrue();
            expect(color.red !== null).assertTrue();
            expect(color.green !== null).assertTrue();
            expect(color.blue !== null).assertTrue();
            done()
          }).catch((ex: BusinessError) => {
            console.error(msgStr + "Napi colorPicker.error=" + ex.toString());
            expect(true).assertFail();
            done();
          })
        }).catch((ex: BusinessError) => {
          console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
          expect(true).assertFail();
          done();
        })
      })
    })
    /**
     * @tc.name   createColorPickerTest002
     * @tc.number EFFECT_KIT_CREATECOLORPICKER_JSAPI_002
     * @tc.desc   Create a ColorPicker instance from the passed PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createColorPickerTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'createColorPickerTest002';
      let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
      console.log(msgStr + 'begin');
      let imageSource = image.createImageSource(testPng.buffer);
      imageSource.getImageInfo((err, value) => {
        if (err) {
          try {
            expect(true).assertFail();
          } catch (err) {
            console.log(msgStr + 'expect assert fail');
          }
          done();
          return;
        }
        console.info(msgStr + "Napi size=" + value.size.width + " X " + value.size.height);
        let size: image.Size = {
          width: value.size.width, height: value.size.height
        }
        console.info(msgStr + "promise create pixmap.start");
        imageSource.createPixelMap({
          desiredSize: size
        }).then(pixelMap => {
          console.info(msgStr + "Napi create ColorPicker.start");
          effectKit.createColorPicker(pixelMap, [0.1, 0.1, 0.5, 0.8]).then(colorPicker => {
            console.info(msgStr + "Napi createColorPicker");
            let color = colorPicker.getAverageColor();
            console.log(msgStr + JSON.stringify(color));
            expect(color.alpha !== null).assertTrue();
            expect(color.red !== null).assertTrue();
            expect(color.green !== null).assertTrue();
            expect(color.blue !== null).assertTrue();
            done();
          }).catch((ex: BusinessError) => {
            console.error(msgStr + "Napi colorPicker.error=" + ex.toString());
            expect(true).assertFail();
            done();
          })
        }).catch((ex: BusinessError) => {
          console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
          expect(true).assertFail();
          done();
        })
      })
    })
    /**
     * @tc.name   createColorPickerTest003
     * @tc.number EFFECT_KIT_CREATECOLORPICKER_JSAPI_003
     * @tc.desc   Create a ColorPicker instance from the passed PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createColorPickerTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'createColorPickerTest003';
      let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
      console.log(msgStr + 'begin');
      let imageSource = image.createImageSource(testPng.buffer);
      imageSource.getImageInfo((err, value) => {
        if (err) {
          try {
            expect(true).assertFail();
          } catch (err) {
            console.log(msgStr + 'expect assert fail');
          }
          done();
          return;
        }
        console.info(msgStr + "Napi size=" + value.size.width + " X " + value.size.height);
        let size: image.Size = {
          width: value.size.width, height: value.size.height
        }
        console.info(msgStr + "promise create pixmap.start");
        imageSource.createPixelMap({
          desiredSize: size
        }).then(pixelMap => {
          console.info(msgStr + "Napi create ColorPicker.start");
          effectKit.createColorPicker(pixelMap, [0.1, 0.3, 0.5, 0.7, 0.9]).then(colorPicker => {
            console.info(msgStr + "Napi createColorPicker");
            let color = colorPicker.getAverageColor();
            console.log(msgStr + JSON.stringify(color));
            expect(color.alpha !== null).assertTrue();
            expect(color.red !== null).assertTrue();
            expect(color.green !== null).assertTrue();
            expect(color.blue !== null).assertTrue();
            done();
          }).catch((ex: BusinessError) => {
            console.error(msgStr + "Napi colorPicker.error=" + ex.toString());
            expect(true).assertFail();
            done();
          })
        }).catch((ex: BusinessError) => {
          console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
          expect(true).assertFail();
          done();
        })
      })
    })
    /**
     * @tc.name   createColorPickerTest004
     * @tc.number EFFECT_KIT_CREATECOLORPICKER_JSAPI_004
     * @tc.desc   Create a ColorPicker instance from the passed PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createColorPickerTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'createColorPickerTest004';
      let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
      console.log(msgStr + 'begin');
      let imageSource = image.createImageSource(testPng.buffer);
      imageSource.getImageInfo((err, value) => {
        if (err) {
          try {
            expect(true).assertFail();
          } catch (err) {
            console.log(msgStr + 'expect assert fail');
          }
          done();
          return;
        }
        console.info(msgStr + "Napi size=" + value.size.width + " X " + value.size.height);
        let size: image.Size = {
          width: value.size.width, height: value.size.height
        }
        console.info(msgStr + "promise create pixmap.start");
        imageSource.createPixelMap({
          desiredSize: size
        }).then(pixelMap => {
          console.info(msgStr + "Napi create ColorPicker.start");
          effectKit.createColorPicker(pixelMap, [0.6, 0.5, 0.3, 0.2]).then(colorPicker => {
            expect(true).assertFail();
            done();
          }).catch((ex: BusinessError) => {
            console.error(msgStr + "Napi colorPicker.error=" + ex.toString());
            done();
          })
        }).catch((ex: BusinessError) => {
          console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
          done();
        })
      })
    })
    /**
     * @tc.name   createColorPickerTest005
     * @tc.number EFFECT_KIT_CREATECOLORPICKER_JSAPI_005
     * @tc.desc   Create a ColorPicker instance from the passed PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createColorPickerTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'createColorPickerTest005';
      let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
      console.log(msgStr + 'begin');
      let imageSource = image.createImageSource(testPng.buffer);
      imageSource.getImageInfo((err, value) => {
        if (err) {
          try {
            expect(true).assertFail();
          } catch (err) {
            console.log(msgStr + 'expect assert fail');
          }
          done();
          return;
        }
        console.info(msgStr + "Napi size=" + value.size.width + " X " + value.size.height);
        let size: image.Size = {
          width: value.size.width, height: value.size.height
        }
        console.info(msgStr + "promise create pixmap.start");
        imageSource.createPixelMap({
          desiredSize: size
        }).then(pixelMap => {
          console.info(msgStr + "Napi create ColorPicker.start");
          effectKit.createColorPicker(pixelMap, [0.1, 0.1]).then(colorPicker => {
            expect(true).assertFail();
            done();
          }).catch((ex: BusinessError) => {
            console.error(msgStr + "Napi colorPicker.error=" + ex.toString());
            done();
          })
        }).catch((ex: BusinessError) => {
          console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
          done();
        })
      })
    })
    /**
     * @tc.name   testGetEffectPixelMap_Functin_Promise
     * @tc.number EFFECT_KIT_GETEFFECTPIXELMAP_JSAPI_0100
     * @tc.desc   Gets the getEffectPixelMap where all filter effects have been added to the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetEffectPixelMap_Functin_Promise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let msgStr = 'testGetEffectPixelMap';
      console.log(msgStr + 'begin');
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {
          height: 4,
          width: 6
        }
      };
      try {
        let promise = image.createPixelMap(color, opts);
        promise.then((pixelMap) => {
          effectKit.createEffect(pixelMap).grayscale().getEffectPixelMap().then(data => {
            console.log(msgStr + 'getPixelBytesNumber = ', data.getPixelBytesNumber());
            done();
          })
        }).catch((error: BusinessError) => {
          console.log(msgStr + 'failed to the getEffectPixelMap ' + JSON.stringify(error));
          expect().assertFail();
          done();
        })
      } catch (error) {
        console.log(msgStr + 'failed to the testGetEffectPixelMap_Functin_Promise' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })
  })
}