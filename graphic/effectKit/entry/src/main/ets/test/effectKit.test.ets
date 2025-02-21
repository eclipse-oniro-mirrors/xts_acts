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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "deccjsunit/index"

import image from '@ohos.multimedia.image'
import effectKit from '@ohos.effectKit';
import {testPng, testJpg} from '../model/testImg'

export default function effectKitTest() {
  describe('effectKitTest', function () {
    console.log('describe effectKitTest start!!!')

    /**
     * @tc.number     EFFECT_KIT_CREATEEFFECT_JSAPI_001
     * @tc.name       Test createEffect1
     * @tc.desc       Create a FilterChain to add multiple effects to an image.
     */
    it('createEffect1', 0, function (done) {
      let caseName = 'createEffect1'
      let msgStr = 'jsunittest ' + caseName + ' '
      console.log("effectKitTest" + msgStr + 'begin')
      var imageSource = image.createImageSource(testJpg.buffer);
      imageSource.getImageInfo((err, value) => {
        console.error(msgStr + "Napi size=" + value.size.width + " X " + value.size.height)
      })
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start")
        let filter = effectKit.createEffect(pixelMap)
        expect(filter != null).assertTrue()
        done()
      }).catch(ex => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString())
        expect(true).assertFail()
        done()
      })
      console.info(msgStr + "Napi create pixmap.end")
      expect(true).assertTrue()
      done()
    })

    /**
     * @tc.number     EFFECT_KIT_CREATEEFFECT_JSAPI_002
     * @tc.name       Test createEffect2
     * @tc.desc       Create a FilterChain to add multiple effects to an image.
     */
    it('createEffect2', 0, function (done) {
      let caseName = 'createEffect2'
      let msgStr = 'jsunittest ' + caseName + ' '
      console.log("effectKitTest" + msgStr + 'begin')
      let pixelmap = null
      let filter = effectKit.createEffect(pixelmap)
      expect(filter == null).assertTrue()
      done()
    })

    /**
     * @tc.number     EFFECT_KIT_BLUR_JSAPI_001
     * @tc.name       Test blur1
     * @tc.desc       A blur effect is added to the image.
     */
    it('blur1', 0, function (done) {
      let caseName = 'blur1'
      let msgStr = 'jsunittest ' + caseName + ' '
      console.log("effectKitTest" + msgStr + 'begin')
      var imageSource = image.createImageSource(testJpg.buffer);
      imageSource.getImageInfo((err, value) => {
        console.error(msgStr + "image size=" + value.size.width + " X " + value.size.height)
      })
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start")
        let headFilter = effectKit.createEffect(pixelMap)
        if (headFilter == null) {
          console.log("effectKitTest blur1 createEffect faild")
          expect(true).assertFail()
          done()
        }
        let blurFilter = headFilter.blur(10)
        expect(blurFilter != null).assertTrue()
        done()
      }).catch(ex => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString())
        expect(true).assertFail()
        done()
      })
      console.info(msgStr + "Napi create pixmap.end")
      expect(true).assertTrue()
      done()
    })

    /**
     * @tc.number     EFFECT_KIT_BLUR_JSAPI_002
     * @tc.name       Test blur2
     * @tc.desc       A blur effect is added to the image.
     */
    it('blur2', 0, function (done) {
      let caseName = 'blur2'
      let msgStr = 'jsunittest ' + caseName + ' '
      console.log("effectKitTest" + msgStr + 'begin')
      var imageSource = image.createImageSource(testJpg.buffer);
      imageSource.getImageInfo((err, value) => {
        console.error(msgStr + "image size=" + value.size.width + " X " + value.size.height)
      })
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start")
        let headFilter = effectKit.createEffect(pixelMap)
        if (headFilter == null) {
          console.log("effectKitTest blur2 createEffect faild")
          expect(true).assertFail()
          done()
        }
        let blurFilter = headFilter.blur(-10)
        expect(blurFilter != null).assertTrue()
        done()
      }).catch(ex => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString())
        expect(true).assertFail()
        done()
      })
      console.info(msgStr + "Napi create pixmap.end")
      expect(true).assertTrue()
      done()
    })

    /**
     * @tc.number     EFFECT_KIT_BLUR_JSAPI_003
     * @tc.name       Test blur3
     * @tc.desc       A blur effect is added to the image.
     */
    it('blur3', 0, function (done) {
      let caseName = 'blur3'
      let msgStr = 'jsunittest ' + caseName + ' '
      console.log("effectKitTest" + msgStr + 'begin')
      var imageSource = image.createImageSource(testJpg.buffer);
      imageSource.getImageInfo((err, value) => {
        console.error(msgStr + "image size=" + value.size.width + " X " + value.size.height)
      })
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start")
        let headFilter = effectKit.createEffect(pixelMap)
        if (headFilter == null) {
          console.log("effectKitTest blur3 createEffect faild")
          expect(true).assertFail()
          done()
        }
        let blurFilter = headFilter.blur(0)
        expect(blurFilter != null).assertTrue()
        done()
      }).catch(ex => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString())
        expect(true).assertFail()
        done()
      })
      console.info(msgStr + "Napi create pixmap.end")
      expect(true).assertTrue()
      done()
    })

    /**
     * @tc.number     EFFECT_KIT_BRIGHTNESS_JSAPI_001
     * @tc.name       Test brightness1
     * @tc.desc       A Brightness effect is added to the image.
     */
    it('brightness1', 0, function (done) {
      let caseName = 'brightness1'
      let msgStr = 'jsunittest ' + caseName + ' '
      console.log("effectKitTest" + msgStr + 'begin')
      var imageSource = image.createImageSource(testJpg.buffer);
      imageSource.getImageInfo((err, value) => {
        console.error(msgStr + "image size=" + value.size.width + " X " + value.size.height)
      })
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start")
        let headFilter = effectKit.createEffect(pixelMap)
        if (headFilter == null) {
          console.log("effectKitTest brightness1 createEffect faild")
          expect(true).assertFail()
          done()
        }
      let brightFilter = headFilter.brightness(0)
      expect(brightFilter != null).assertTrue()
      done()
      }).catch(ex => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString())
        expect(true).assertFail()
        done()
      })
      console.info(msgStr + "Napi create pixmap.end")
      expect(true).assertTrue()
      done()
    })

    /**
     * @tc.number     EFFECT_KIT_BRIGHTNESS_JSAPI_002
     * @tc.name       Test brightness2
     * @tc.desc       A Brightness effect is added to the image.
     */
    it('brightness2', 0, function (done) {
      let caseName = 'brightness2'
      let msgStr = 'jsunittest ' + caseName + ' '
      console.log("effectKitTest" + msgStr + 'begin')
      var imageSource = image.createImageSource(testJpg.buffer);
      imageSource.getImageInfo((err, value) => {
        console.error(msgStr + "image size=" + value.size.width + " X " + value.size.height)
      })
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start")
        let headFilter = effectKit.createEffect(pixelMap)
        if (headFilter == null) {
          console.log("effectKitTest brightness2 createEffect faild")
          expect(true).assertFail()
          done()
        }
      let brightFilter = headFilter.brightness(0.5)
      expect(brightFilter != null).assertTrue()
      done()
      }).catch(ex => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString())
        expect(true).assertFail()
        done()
      })
      console.info(msgStr + "Napi create pixmap.end")
      expect(true).assertTrue()
      done()
    })

    /**
     * @tc.number     EFFECT_KIT_BRIGHTNESS_JSAPI_003
     * @tc.name       Test brightness3
     * @tc.desc       A Brightness effect is added to the image.
     */
    it('brightness3', 0, function (done) {
      let caseName = 'brightness3'
      let msgStr = 'jsunittest ' + caseName + ' '
      console.log("effectKitTest" + msgStr + 'begin')
      var imageSource = image.createImageSource(testJpg.buffer);
      imageSource.getImageInfo((err, value) => {
        console.error(msgStr + "image size=" + value.size.width + " X " + value.size.height)
      })
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start")
        let headFilter = effectKit.createEffect(pixelMap)
        if (headFilter == null) {
          console.log("effectKitTest brightness3 createEffect faild")
          expect(true).assertFail()
          done()
        }
      let brightFilter = headFilter.brightness(-0.5)
      expect(brightFilter != null).assertTrue()
      done()
      }).catch(ex => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString())
        expect(true).assertFail()
        done()
      })
      console.info(msgStr + "Napi create pixmap.end")
      expect(true).assertTrue()
      done()
    })

    /**
     * @tc.number     EFFECT_KIT_GRAYSCALE_JSAPI_001
     * @tc.name       Test grayscale1
     * @tc.desc       A Grayscale effect is added to the image.
     */
    it('grayscale1', 0, function (done) {
      let caseName = 'grayscale1'
      let msgStr = 'jsunittest ' + caseName + ' '
      console.log("effectKitTest" + msgStr + 'begin')
      var imageSource = image.createImageSource(testJpg.buffer);
      imageSource.getImageInfo((err, value) => {
        console.error(msgStr + "image size=" + value.size.width + " X " + value.size.height)
      })
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start")
        let headFilter = effectKit.createEffect(pixelMap)
        if (headFilter == null) {
          console.log("effectKitTest grayscale1 createEffect faild")
          expect(true).assertFail()
          done()
        }
        let grayFilter = headFilter.grayscale()
        expect(grayFilter != null).assertTrue()
        done()
      }).catch(ex => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString())
        expect(true).assertFail()
        done()
      })
      console.info(msgStr + "Napi create pixmap.end")
      expect(true).assertTrue()
      done()
    })

    /**
     * @tc.number     EFFECT_KIT_GETPIXELMAP_JSAPI_001
     * @tc.name       Test getPixelMap1
     * @tc.desc       Gets the PixelMap where all filter effects have been added to the image.
     */
    it('getPixelMap1', 0, function (done) {
      let caseName = 'getPixelMap1'
      let msgStr = 'jsunittest ' + caseName + ' '
      console.log("effectKitTest" + msgStr + 'begin')
      var imageSource = image.createImageSource(testJpg.buffer);
      imageSource.getImageInfo((err, value) => {
        console.error(msgStr + "image size=" + value.size.width + " X " + value.size.height)
      })
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start")
        let headFilter = effectKit.createEffect(pixelMap)
        if (headFilter == null) {
          console.log("effectKitTest getPixelMap1 createEffect faild")
          expect(true).assertFail()
          done()
        }
        let resultPixel = headFilter.getPixelMap()
        expect(resultPixel != null).assertTrue()
        done()
      }).catch(ex => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString())
        expect(true).assertFail()
        done()
      })
      console.info(msgStr + "Napi create pixmap.end")
      expect(true).assertTrue()
      done()
    })

    /**
     * @tc.number     EFFECT_KIT_GETPIXELMAP_JSAPI_002
     * @tc.name       Test getPixelMap2
     * @tc.desc       Gets the PixelMap where all filter effects have been added to the image.
     */
    it('getPixelMap2', 0, function (done) {
      let caseName = 'getPixelMap2'
      let msgStr = 'jsunittest ' + caseName + ' '
      console.log("effectKitTest" + msgStr + 'begin')
      var imageSource = image.createImageSource(testJpg.buffer);
      imageSource.getImageInfo((err, value) => {
        console.error(msgStr + "image size=" + value.size.width + " X " + value.size.height)
      })
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start")
        let headFilter = effectKit.createEffect(pixelMap)
        if (headFilter == null) {
          console.log("effectKitTest getPixelMap2 createEffect faild")
          expect(true).assertFail()
          done()
        }
        let resultPixel = headFilter.grayscale().getPixelMap()
        expect(resultPixel != null).assertTrue()
        done()
      }).catch(ex => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString())
        expect(true).assertFail()
        done()
      })
      console.info(msgStr + "Napi create pixmap.end")
      expect(true).assertTrue()
      done()
    })

    /**
     * @tc.number     EFFECT_KIT_GETPIXELMAP_JSAPI_003
     * @tc.name       Test getPixelMap3
     * @tc.desc       Gets the PixelMap where all filter effects have been added to the image.
     */
    it('getPixelMap3', 0, function (done) {
      let caseName = 'getPixelMap3'
      let msgStr = 'jsunittest ' + caseName + ' '
      console.log("effectKitTest" + msgStr + 'begin')
      var imageSource = image.createImageSource(testJpg.buffer);
      imageSource.getImageInfo((err, value) => {
        console.error(msgStr + "image size=" + value.size.width + " X " + value.size.height)
      })
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start")
        let headFilter = effectKit.createEffect(pixelMap)
        if (headFilter == null) {
          console.log("effectKitTest getPixelMap3 createEffect faild")
          expect(true).assertFail()
          done()
        }
        let resultPixel = headFilter.blur(5).brightness(0.5).grayscale().getPixelMap()
        expect(resultPixel != null).assertTrue()
        done()
      }).catch(ex => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString())
        expect(true).assertFail()
        done()
      })
      console.info(msgStr + "Napi create pixmap.end")
      expect(true).assertTrue()
      done()
    })

    /**
     * @tc.number     EFFECT_KIT_CREATECOLORPICKER_JSAPI_001
     * @tc.name       Test createColorPicker
     * @tc.desc       Create a color picker to get the main color.
     */
    it('createColorPicker1', 0, function (done) {
      let caseName = 'createColorPicker1'
      let msgStr = 'jsunittest effectKitTest' + caseName + ' '
      console.log(msgStr + 'begin')
      var imageSource = image.createImageSource(testPng.buffer)
      console.info(msgStr + "promise create pixmap.start")
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create ColorPicker.start")
        effectKit.createColorPicker(pixelMap).then(colorPicker => {
          console.info(msgStr + "Napi createColorPicker")
          expect(true).assertTrue()
          done()
        }).catch(ex => {
          console.error(msgStr + "Napi colorPicker.error=" + ex.toString())
          expect(true).assertFail()
          done()
        })
      }).catch(ex => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString())
        expect(true).assertFail()
        done()
      })
      console.info(msgStr + "Napi create pixmap.end")
      expect(true).assertTrue()
      done()
    })

    /**
     * @tc.number     EFFECT_KIT_CREATECOLORPICKER_JSAPI_002
     * @tc.name       Test createColorPicker
     * @tc.desc       Create a color picker to get the main color.
     */
    it('createColorPicker2', 0, function (done) {
      let caseName = 'createColorPicker2'
      let msgStr = 'jsunittest effectKitTest' + caseName + ' '
      console.log(msgStr + 'begin')
      console.info(msgStr + "Napi create ImageSource")
      var imageSource = image.createImageSource(testJpg.buffer);
      console.info(msgStr + "promise create pixmap.start")
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create ColorPicker.start")
        effectKit.createColorPicker(pixelMap).then(colorPicker => {
          console.info(msgStr + "Napi createColorPicker")
          expect(true).assertTrue()
          done()
        }).catch(ex => {
          console.error(msgStr + "Napi colorPicker.error=" + ex.toString())
          expect(true).assertFail()
          done()
        })
      }).catch(ex => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString())
        expect(true).assertFail()
        done()
      })
      console.info(msgStr + "Napi create pixmap.end")
      expect(true).assertTrue()
      done()
    })

    /**
     * @tc.number     EFFECT_KIT_CREATECOLORPICKER_JSAPI_003
     * @tc.name       Test createColorPicker
     * @tc.desc       Create a color picker to get the main color.
     */
    it('createColorPicker3', 0, function (done) {
      let caseName = 'createColorPicker3'
      let msgStr = 'jsunittest effectKitTest' + caseName + ' '
      console.log(msgStr + 'begin')
      console.info(msgStr + "Napi create ImageSource")
      var imageSource = image.createImageSource(testJpg.buffer);
      console.info(msgStr + "promise create pixmap.start")
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create ColorPicker.start")
        effectKit.createColorPicker(pixelMap).then(colorPicker => {
          console.info(msgStr + "Napi create color picker")
          expect(true).assertTrue()
          done()
        }).catch(ex => {
          console.error(msgStr + "Napi colorPicker.error=" + ex.toString())
          expect(true).assertFail()
          done()
        })
      }).catch(ex => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString())
        expect(true).assertFail()
        done()
      })
      console.info(msgStr + "Napi create pixmap.end")
      expect(true).assertTrue()
      done()
    })

    /**
     * @tc.number     EFFECT_KIT_CREATECOLORPICKER_JSAPI_004
     * @tc.name       Test createColorPicker
     * @tc.desc       Create a color picker to get the main color.
     */
    it('createColorPicker4', 0, function (done) {
      let caseName = 'createColorPicker4'
      let msgStr = 'jsunittest effectKitTest' + caseName + ' '
      console.log(msgStr + 'begin')
      console.info(msgStr + "Napi create ImageSource")
      var imageSource = image.createImageSource(testPng.buffer);
      console.info(msgStr + "promise create pixmap.start")
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create ColorPicker.start")
        effectKit.createColorPicker(pixelMap).then(colorPicker => {
          console.info(msgStr + "Napi createColorPicker")
          expect(true).assertTrue()
          done()
        }).catch(ex => {
          console.error(msgStr + "Napi colorPicker.error=" + ex.toString())
          expect(true).assertFail()
          done()
        })
      }).catch(ex => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString())
        expect(true).assertFail()
        done()
      })
      console.info(msgStr + "Napi create pixmap.end")
      expect(true).assertTrue()
      done()
    })

    /**
     * @tc.number     EFFECT_KIT_CREATECOLORPICKER_JSAPI_005
     * @tc.name       Test createColorPicker
     * @tc.desc       Create a color picker to get the main color.
     */
    it('createColorPicker5', 0, function (done) {
      let caseName = 'createColorPicker5'
      let msgStr = 'jsunittest effectKitTest' + caseName + ' '
      console.log(msgStr + 'begin')
      var imageSource = image.createImageSource(testPng.buffer);
      console.info(msgStr + "callback create pixmap.start")
      imageSource.createPixelMap((error, pixelMap) => {
        if(error) {
          console.info("Napi error,create pixmap")
          expect(true).assertFail()
          done()
        }
        console.info("Napi create ColorPicker.start")
        effectKit.createColorPicker(pixelMap, (error, colorPicker) => {
          if (error) {
            console.error("Napi error, create color picker")
            expect(true).assertFail()
            done()
          }
          console.info(msgStr + "Napi create ok")
          expect(true).assertTrue()
          done()
        })
      })
      console.info(msgStr + "Napi create pixmap.end")
      expect(true).assertTrue()
      done()
    })

    /**
     * @tc.number     EFFECT_KIT_CREATECOLORPICKER_JSAPI_006
     * @tc.name       Test createColorPicker
     * @tc.desc       Create a color picker to get the main color.
     */
    it('createColorPicker6', 0, function (done) {
      let caseName = 'createColorPicker6'
      let msgStr = 'jsunittest effectKitTest' + caseName + ' '
      console.log(msgStr + 'begin')
      console.info(msgStr + "Napi create ImageSource")
      var imageSource = image.createImageSource(testJpg.buffer)
      console.info(msgStr + "callback create pixmap.start")
      imageSource.createPixelMap((error, pixelMap) => {
        if(error) {
          console.info("Napi error,create pixmap")
          expect(true).assertFail()
          done()
        }
        console.info("Napi create ColorPicker.start")
        effectKit.createColorPicker(pixelMap, (error, colorPicker) => {
          if (error) {
            console.error("Napi error, create color picker")
            expect(true).assertFail()
            done()
          }
          console.info(msgStr + "Napi create ok")
          expect(true).assertTrue()
          done()
        })
      })
      console.info(msgStr + "Napi create pixmap.end")
      expect(true).assertTrue()
      done()
    })

    /**
     * @tc.number     EFFECT_KIT_CREATECOLORPICKER_JSAPI_007
     * @tc.name       Test createColorPicker
     * @tc.desc       Create a color picker to get the main color.
     */
    it('createColorPicker7', 0, function (done) {
      let caseName = 'createColorPicker7'
      let msgStr = 'jsunittest effectKitTest' + caseName + ' '
      console.log(msgStr + 'begin')
      var imageSource = image.createImageSource(testPng.buffer)
      console.info(msgStr + "promise create pixmap.start")
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create ColorPicker.start")
        effectKit.createColorPicker(pixelMap).then(colorPicker => {
          console.info(msgStr + "Napi createColorPicker")
          expect(true).assertTrue()
          done()
        }).catch(ex => {
          console.error(msgStr + "Napi colorPicker.error=" + ex.toString())
          expect(true).assertFail()
          done()
        })
      }).catch(ex => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString())
        expect(true).assertFail()
        done()
      })
      console.info(msgStr + "Napi create pixmap.end")
      expect(true).assertTrue()
      done()
    })

    /**
     * @tc.number     EFFECT_KIT_GETMAINCOLOR_JSAPI_001
     * @tc.name       Test getMainColor
     * @tc.desc       Create a color picker to get the main color.
     */
    it('getMainColor1', 0, function (done) {
      let caseName = 'getMainColor1'
      let msgStr = 'jsunittest effectKitTest' + caseName + ' '
      console.log(msgStr + 'begin')
      var imageSource = image.createImageSource(testPng.buffer)
      console.info(msgStr + "promise create pixmap.start")
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create ColorPicker.start")
        effectKit.createColorPicker(pixelMap).then(colorPicker => {
          console.info(msgStr + "Napi get main color start")
          colorPicker.getMainColor().then(color => {
            console.info(msgStr + "Napi color[ARGB]=" + color.red + "," + color.green + "," + color.blue)
            expect(true).assertTrue()
            done()
          }).catch(ex => {
            console.error(msgStr + "Napi color.error=" + ex.toString())
            expect(true).assertFail()
            done()
          })
        }).catch(ex => {
          console.error(msgStr + "Napi colorPicker.error=" + ex.toString())
          expect(true).assertFail()
          done()
        })
      }).catch(ex => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString())
        expect(true).assertFail()
        done()
      })
      console.info(msgStr + "Napi create pixmap.end")
      expect(true).assertTrue()
      done()
    })

    /**
     * @tc.number     EFFECT_KIT_GETMAINCOLOR_JSAPI_002
     * @tc.name       Test getMainColor
     * @tc.desc       Create a color picker to get the main color.
     */
    it('getMainColor2', 0, function (done) {
      let caseName = 'getMainColor2'
      let msgStr = 'jsunittest effectKitTest' + caseName + ' '
      console.log(msgStr + 'begin')
      var imageSource = image.createImageSource(testJpg.buffer)
      console.info(msgStr + "promise create pixmap.start")
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create ColorPicker.start")
        effectKit.createColorPicker(pixelMap).then(colorPicker => {
          console.info(msgStr + "Napi get main color start")
          colorPicker.getMainColor().then(color => {
            console.info(msgStr + "Napi color[ARGB]=" + color.red + "," + color.green + "," + color.blue)
            expect(true).assertTrue()
            done()
          }).catch(ex => {
            console.error(msgStr + "Napi color.error=" + ex.toString())
            expect(true).assertFail()
            done()
          })
        }).catch(ex => {
          console.error(msgStr + "Napi colorPicker.error=" + ex.toString())
          expect(true).assertFail()
          done()
        })
      }).catch(ex => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString())
        expect(true).assertFail()
        done()
      })
      console.info(msgStr + "Napi create pixmap.end")
      expect(true).assertTrue()
      done()
    })

    /**
     * @tc.number     EFFECT_KIT_GETMAINCOLORSYNC_JSAPI_001
     * @tc.name       Test getMainColorSync
     * @tc.desc       Create a color picker to get the main color.
     */
    it('getMainColorSync1', 0, function (done) {
      let caseName = 'getMainColorSync1'
      let msgStr = 'jsunittest effectKitTest' + caseName + ' '
      console.log(msgStr + 'begin')
      var imageSource = image.createImageSource(testJpg.buffer)
      console.info(msgStr + "promise create pixmap.start")
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create ColorPicker.start")
        effectKit.createColorPicker(pixelMap).then(colorPicker => {
          console.info(msgStr + "Napi get main color start")
          let color = colorPicker.getMainColorSync()
          console.info(msgStr + "Napi color[ARGB]=" + color.red + "," + color.green + "," + color.blue)
          expect(true).assertTrue()
          done()
        }).catch(ex => {
          console.error(msgStr + "Napi colorPicker.error=" + ex.toString())
          expect(true).assertFail()
          done()
        })
      }).catch(ex => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString())
        expect(true).assertFail()
        done()
      })
      console.info(msgStr + "Napi create pixmap.end")
      expect(true).assertTrue()
      done()
    })

    /**
     * @tc.number     EFFECT_KIT_GETMAINCOLORSYNC_JSAPI_002
     * @tc.name       Test getMainColorSync
     * @tc.desc       Create a color picker to get the main color.
     */
    it('getMainColorSync2', 0, function (done) {
      let caseName = 'getMainColorSync2'
      let msgStr = 'jsunittest effectKitTest' + caseName + ' '
      console.log(msgStr + 'begin')
      var imageSource = image.createImageSource(testPng.buffer)
      console.info(msgStr + "promise create pixmap.start")
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create ColorPicker.start")
        effectKit.createColorPicker(pixelMap).then(colorPicker => {
          console.info(msgStr + "Napi get main color start")
          let color = colorPicker.getMainColorSync()
          console.info(msgStr + "Napi color[ARGB]=" + color.red + "," + color.green + "," + color.blue)
          expect(true).assertTrue()
          done()
        }).catch(ex => {
          console.error(msgStr + "Napi colorPicker.error=" + ex.toString())
          expect(true).assertFail()
          done()
        })
      }).catch(ex => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString())
        expect(true).assertFail()
        done()
      })
      console.info(msgStr + "Napi create pixmap.end")
      expect(true).assertTrue()
      done()
    })

  })
}
