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
     * @tc.number EFFECT_KIT_CREATEEFFECT_JSAPI_001
     * @tc.name Test createEffect1
     * @tc.desc Create a FilterChain to add multiple effects to an image.
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
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.number EFFECT_KIT_CREATEEFFECT_JSAPI_002
     * @tc.name Test createEffect2
     * @tc.desc Create a FilterChain to add multiple effects to an image.
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
     * @tc.number EFFECT_KIT_BLUR_JSAPI_001
     * @tc.name Test blur1
     * @tc.desc A blur effect is added to the image.
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
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.number EFFECT_KIT_BLUR_JSAPI_002
     * @tc.name Test blur2
     * @tc.desc A blur effect is added to the image.
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
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.number EFFECT_KIT_BLUR_JSAPI_003
     * @tc.name Test blur3
     * @tc.desc A blur effect is added to the image.
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
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.number EFFECT_KIT_BRIGHTNESS_JSAPI_001
     * @tc.name Test brightness1
     * @tc.desc A Brightness effect is added to the image.
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
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.number EFFECT_KIT_BRIGHTNESS_JSAPI_002
     * @tc.name Test brightness2
     * @tc.desc A Brightness effect is added to the image.
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
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.number EFFECT_KIT_BRIGHTNESS_JSAPI_003
     * @tc.name Test brightness3
     * @tc.desc A Brightness effect is added to the image.
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
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.number EFFECT_KIT_GRAYSCALE_JSAPI_001
     * @tc.name Test grayscale1
     * @tc.desc A Grayscale effect is added to the image.
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
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.number EFFECT_KIT_GETPIXELMAP_JSAPI_001
     * @tc.name Test getPixelMap1
     * @tc.desc Gets the PixelMap where all filter effects have been added to the image.
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
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.number EFFECT_KIT_GETPIXELMAP_JSAPI_002
     * @tc.name Test getPixelMap2
     * @tc.desc Gets the PixelMap where all filter effects have been added to the image.
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
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.number EFFECT_KIT_GETPIXELMAP_JSAPI_003
     * @tc.name Test getPixelMap3
     * @tc.desc Gets the PixelMap where all filter effects have been added to the image.
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
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.number EFFECT_KIT_CREATECOLORPICKER_JSAPI_001
     * @tc.name Test createColorPicker
     * @tc.desc Create a color picker to get the main color.
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
          expect(true).assertTrue();
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
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.number EFFECT_KIT_CREATECOLORPICKER_JSAPI_002
     * @tc.name Test createColorPicker
     * @tc.desc Create a color picker to get the main color.
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
          expect(true).assertTrue();
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
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.number EFFECT_KIT_CREATECOLORPICKER_JSAPI_003
     * @tc.name Test createColorPicker
     * @tc.desc Create a color picker to get the main color.
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
          expect(true).assertTrue();
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
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.number EFFECT_KIT_CREATECOLORPICKER_JSAPI_004
     * @tc.name Test createColorPicker
     * @tc.desc Create a color picker to get the main color.
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
          expect(true).assertTrue();
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
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.number EFFECT_KIT_CREATECOLORPICKER_JSAPI_005
     * @tc.name Test createColorPicker
     * @tc.desc Create a color picker to get the main color.
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
          expect(true).assertTrue();
          done();
        })
      })
      console.info(msgStr + "Napi create pixmap.end");
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.number EFFECT_KIT_CREATECOLORPICKER_JSAPI_006
     * @tc.name Test createColorPicker
     * @tc.desc Create a color picker to get the main color.
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
          expect(true).assertTrue();
          done();
        })
      })
      console.info(msgStr + "Napi create pixmap.end");
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.number EFFECT_KIT_CREATECOLORPICKER_JSAPI_007
     * @tc.name Test createColorPicker
     * @tc.desc Create a color picker to get the main color.
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
          expect(true).assertTrue();
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
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.number EFFECT_KIT_GETMAINCOLOR_JSAPI_001
     * @tc.name Test getMainColor
     * @tc.desc Create a color picker to get the main color.
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
            expect(true).assertTrue();
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
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.number EFFECT_KIT_GETMAINCOLOR_JSAPI_002
     * @tc.name Test getMainColor
     * @tc.desc Create a color picker to get the main color.
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
            expect(true).assertTrue();
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
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.number EFFECT_KIT_GETMAINCOLORSYNC_JSAPI_001
     * @tc.name Test getMainColorSync
     * @tc.desc Create a color picker to get the main color.
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
          expect(true).assertTrue();
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
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.number EFFECT_KIT_GETMAINCOLORSYNC_JSAPI_002
     * @tc.name Test getMainColorSync
     * @tc.desc Create a color picker to get the main color.
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
          expect(true).assertTrue();
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
      expect(true).assertTrue();
      done();
    })
    /**
     * @tc.number EFFECT_KIT_GETLARGESTPROPORTIONCOLOR_JSAPI_001
     * @tc.name Test getLargestProportionColor
     * @tc.desc .
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
     * @tc.number EFFECT_KIT_GETHIGHESTSATURATIONCOLOR_JSAPI_001
     * @tc.name Test getHighestSaturationColor
     * @tc.desc .
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
     * @tc.number EFFECT_KIT_GETAVERAGECOLOR_JSAPI_001
     * @tc.name Test getAverageColor
     * @tc.desc .
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
     * @tc.number EFFECT_KIT_ISBLACKORWHITEORGRAYCOLOR_JSAPI_001
     * @tc.name Test isBlackOrWhiteOrGrayColor
     * @tc.desc .
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
     * @tc.number EFFECT_KIT_CREATECOLORPICKER_JSAPI_001
     * @tc.name Test createColorPickerTest001
     * @tc.desc Create a ColorPicker instance from the passed PixelMap
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
     * @tc.number EFFECT_KIT_CREATECOLORPICKER_JSAPI_002
     * @tc.name Test createColorPickerTest002
     * @tc.desc Create a ColorPicker instance from the passed PixelMap
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
     * @tc.number EFFECT_KIT_CREATECOLORPICKER_JSAPI_003
     * @tc.name Test createColorPickerTest003
     * @tc.desc Create a ColorPicker instance from the passed PixelMap
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
     * @tc.number EFFECT_KIT_CREATECOLORPICKER_JSAPI_004
     * @tc.name Test createColorPickerTest004
     * @tc.desc Create a ColorPicker instance from the passed PixelMap
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
     * @tc.number EFFECT_KIT_CREATECOLORPICKER_JSAPI_005
     * @tc.name Test createColorPickerTest005
     * @tc.desc Create a ColorPicker instance from the passed PixelMap
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
     * @tc.number    : EFFECT_KIT_GETEFFECTPIXELMAP_JSAPI_0100
     * @tc.name      : testGetEffectPixelMap_Functin_Promise
     * @tc.desc      : Gets the getEffectPixelMap where all filter effects have been added to the image.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
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
            expect(true).assertTrue();
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