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
     * @tc.name   blur4
     * @tc.number EFFECT_KIT_BLUR_JSAPI_004
     * @tc.desc   A blur effect is added to the image with TileMode.CLAMP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('blur4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'blur4';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      imageSource.getImageInfo((err, value) => {
        console.error(msgStr + "image size=" + value.size.width + " X " + value.size.height);
      })
      await imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log("effectKitTest blur4 createEffect faild");
          expect(true).assertFail();
          done();
        }
        let blurFilter = headFilter.blur(15, effectKit.TileMode.CLAMP);
        expect(blurFilter != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
    })

    /**
     * @tc.name   blur5
     * @tc.number EFFECT_KIT_BLUR_JSAPI_005
     * @tc.desc   A blur effect is added to the image with TileMode.REPEAT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('blur5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'blur5';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      imageSource.getImageInfo((err, value) => {
        console.error(msgStr + "image size=" + value.size.width + " X " + value.size.height);
      })
      await imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log("effectKitTest blur5 createEffect faild");
          expect(true).assertFail();
          done();
        }
        let blurFilter = headFilter.blur(20, effectKit.TileMode.REPEAT);
        expect(blurFilter != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
    })

    /**
     * @tc.name   blur6
     * @tc.number EFFECT_KIT_BLUR_JSAPI_006
     * @tc.desc   A blur effect is added to the image with TileMode.MIRROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('blur6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'blur6';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      imageSource.getImageInfo((err, value) => {
        console.error(msgStr + "image size=" + value.size.width + " X " + value.size.height);
      })
      await imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log("effectKitTest blur6 createEffect faild");
          expect(true).assertFail();
          done();
        }
        let blurFilter = headFilter.blur(25, effectKit.TileMode.MIRROR);
        expect(blurFilter != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
    })

    /**
     * @tc.name   blur7
     * @tc.number EFFECT_KIT_BLUR_JSAPI_007
     * @tc.desc   A blur effect is added to the image with TileMode.DECAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('blur7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'blur7';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      imageSource.getImageInfo((err, value) => {
        console.error(msgStr + "image size=" + value.size.width + " X " + value.size.height);
      })
      await imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log("effectKitTest blur7 createEffect faild");
          expect(true).assertFail();
          done();
        }
        let blurFilter = headFilter.blur(30, effectKit.TileMode.DECAL);
        expect(blurFilter != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
    })

    /**
     * @tc.name   blur8
     * @tc.number EFFECT_KIT_BLUR_JSAPI_008
     * @tc.desc   Test blur with large radius value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('blur8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'blur8';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      imageSource.getImageInfo((err, value) => {
        console.error(msgStr + "image size=" + value.size.width + " X " + value.size.height);
      })
      await imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log("effectKitTest blur8 createEffect faild");
          expect(true).assertFail();
          done();
        }
        let blurFilter = headFilter.blur(50);
        expect(blurFilter != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
    })

    /**
     * @tc.name   blur9
     * @tc.number EFFECT_KIT_BLUR_JSAPI_009
     * @tc.desc   Test blur with small radius value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('blur9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'blur9';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      imageSource.getImageInfo((err, value) => {
        console.error(msgStr + "image size=" + value.size.width + " X " + value.size.height);
      })
      await imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log("effectKitTest blur9 createEffect faild");
          expect(true).assertFail();
          done();
        }
        let blurFilter = headFilter.blur(1);
        expect(blurFilter != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
    })

    /**
     * @tc.name   blur10
     * @tc.number EFFECT_KIT_BLUR_JSAPI_010
     * @tc.desc   Test blur with chain calls and getPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('blur10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'blur10';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      imageSource.getImageInfo((err, value) => {
        console.error(msgStr + "image size=" + value.size.width + " X " + value.size.height);
      })
      await imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log("effectKitTest blur10 createEffect faild");
          expect(true).assertFail();
          done();
        }
        let resultPixel = headFilter.blur(10).getPixelMap();
        expect(resultPixel != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
    })

    /**
     * @tc.name   blur11
     * @tc.number EFFECT_KIT_BLUR_JSAPI_011
     * @tc.desc   Test blur with getEffectPixelMap method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('blur11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'blur11';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      imageSource.getImageInfo((err, value) => {
        console.error(msgStr + "image size=" + value.size.width + " X " + value.size.height);
      })
      await imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log("effectKitTest blur11 createEffect faild");
          expect(true).assertFail();
          done();
        }
        headFilter.blur(12).getEffectPixelMap().then(data => {
          console.info(msgStr + 'getPixelBytesNumber = ', data.getPixelBytesNumber());
          expect(data != null).assertTrue();
          done();
        }).catch((error: BusinessError) => {
          console.error(msgStr + 'failed to getEffectPixelMap ' + JSON.stringify(error));
          expect().assertFail();
          done();
        })
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
    })

    /**
     * @tc.name   blur12
     * @tc.number EFFECT_KIT_BLUR_JSAPI_012
     * @tc.desc   Test multiple blur effects in chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('blur12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'blur12';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      imageSource.getImageInfo((err, value) => {
        console.error(msgStr + "image size=" + value.size.width + " X " + value.size.height);
      })
      await imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log("effectKitTest blur12 createEffect faild");
          expect(true).assertFail();
          done();
        }
        let resultPixel = headFilter.blur(5).blur(10).getPixelMap();
        expect(resultPixel != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
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
     * @tc.name   getMainColor3
     * @tc.number EFFECT_KIT_GETMAINCOLOR_JSAPI_003
     * @tc.desc   Verify the color properties returned by getMainColor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getMainColor3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'getMainColor3';
      let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
      console.log(msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      console.info(msgStr + "promise create pixmap.start");
      await imageSource.createPixelMap().then(async (pixelMap) => {
        console.info(msgStr + "Napi create ColorPicker.start");
        effectKit.createColorPicker(pixelMap).then(colorPicker => {
          console.info(msgStr + "Napi get main color start");
          colorPicker.getMainColor().then(color => {
            console.info(msgStr + "Napi color[ARGB]=" + color.alpha + "," + color.red + "," + color.green + "," + color.blue);
            // Verify color properties exist
            expect(color != null).assertTrue();
            expect(color.alpha).assertEqual(255);
            expect(color.red).assertEqual(255);
            expect(color.green).assertEqual(201);
            expect(color.blue).assertEqual(13);
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
    })

    /**
     * @tc.name   getMainColor4
     * @tc.number EFFECT_KIT_GETMAINCOLOR_JSAPI_004
     * @tc.desc   Verify the color type returned by getMainColor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getMainColor4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'getMainColor4';
      let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
      console.log(msgStr + 'begin');
      let imageSource = image.createImageSource(testPng.buffer);
      console.info(msgStr + "promise create pixmap.start");
      await imageSource.createPixelMap().then(async (pixelMap) => {
        console.info(msgStr + "Napi create ColorPicker.start");
        effectKit.createColorPicker(pixelMap).then(colorPicker => {
          console.info(msgStr + "Napi get main color start");
          colorPicker.getMainColor().then(color => {
            console.info(msgStr + "Napi color[ARGB]=" + color.alpha + "," + color.red + "," + color.green + "," + color.blue);
            // Verify color value types
            expect(typeof color === 'object').assertTrue();
            expect(typeof color.alpha === 'number').assertTrue();
            expect(typeof color.red === 'number').assertTrue();
            expect(typeof color.green === 'number').assertTrue();
            expect(typeof color.blue === 'number').assertTrue();
            expect(color.alpha).assertEqual(255);
            expect(color.red).assertEqual(177);
            expect(color.green).assertEqual(175);
            expect(color.blue).assertEqual(160);
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
    })

    /**
     * @tc.name   getMainColor5
     * @tc.number EFFECT_KIT_GETMAINCOLOR_JSAPI_005
     * @tc.desc   Test getMainColor with region parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getMainColor5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'getMainColor5';
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
        }
        console.info(msgStr + "Napi size=" + value.size.width + " X " + value.size.height);
        let size: image.Size = {
          width: value.size.width, height: value.size.height
        }
        console.info(msgStr + "promise create pixmap.start");
        imageSource.createPixelMap({
          desiredSize: size
        }).then(async (pixelMap) => {
          console.info(msgStr + "Napi create ColorPicker.start");
          effectKit.createColorPicker(pixelMap, [0, 0, 0.5, 0.5]).then(colorPicker => {
            console.info(msgStr + "Napi get main color start with region");
            colorPicker.getMainColor().then(color => {
              console.info(msgStr + "Napi color[ARGB]=" + color.alpha + "," + color.red + "," + color.green + "," + color.blue);
              expect(color != null).assertTrue();
              expect(color.alpha).assertEqual(255);
              expect(color.red).assertEqual(177);
              expect(color.green).assertEqual(175);
              expect(color.blue).assertEqual(160);
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
      })
    })

    /**
     * @tc.name   getMainColor6
     * @tc.number EFFECT_KIT_GETMAINCOLOR_JSAPI_006
     * @tc.desc   Test getMainColor multiple calls consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getMainColor6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'getMainColor6';
      let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
      console.log(msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      console.info(msgStr + "promise create pixmap.start");
      await imageSource.createPixelMap().then(async (pixelMap) => {
        console.info(msgStr + "Napi create ColorPicker.start");
        await effectKit.createColorPicker(pixelMap).then(async (colorPicker) => {
          console.info(msgStr + "Napi get main color start");
          // First call
          await colorPicker.getMainColor().then(color1 => {
            console.info(msgStr + "Napi color1[ARGB]=" + color1.alpha + "," + color1.red + "," + color1.green + "," + color1.blue);
            // Second call
            colorPicker.getMainColor().then(color2 => {
              console.info(msgStr + "Napi color2[ARGB]=" + color2.alpha + "," + color2.red + "," + color2.green + "," + color2.blue);
              // Verify consistency
              expect(color1.alpha === color2.alpha).assertTrue();
              expect(color1.red === color2.red).assertTrue();
              expect(color1.green === color2.green).assertTrue();
              expect(color1.blue === color2.blue).assertTrue();
              done();
            }).catch((ex: BusinessError) => {
              console.error(msgStr + "Napi second color.error=" + ex.toString());
              expect(true).assertFail();
              done();
            })
          }).catch((ex: BusinessError) => {
            console.error(msgStr + "Napi first color.error=" + ex.toString());
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
    })

    /**
     * @tc.name   getMainColor7
     * @tc.number EFFECT_KIT_GETMAINCOLOR_JSAPI_007
     * @tc.desc   Test getMainColor with full image region
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getMainColor7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'getMainColor7';
      let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
      console.log(msgStr + 'begin');
      let imageSource = image.createImageSource(testPng.buffer);
      console.info(msgStr + "promise create pixmap.start");
      await imageSource.createPixelMap().then(async (pixelMap) => {
        console.info(msgStr + "Napi create ColorPicker.start");
        await effectKit.createColorPicker(pixelMap, [0, 0, 1, 1]).then(async (colorPicker) => {
          console.info(msgStr + "Napi get main color start with full region");
          await colorPicker.getMainColor().then(color => {
            console.info(msgStr + "Napi color[ARGB]=" + color.alpha + "," + color.red + "," + color.green + "," + color.blue);
            expect(color != null).assertTrue();
            expect(typeof color.alpha === 'number').assertTrue();
            expect(typeof color.red === 'number').assertTrue();
            expect(typeof color.green === 'number').assertTrue();
            expect(typeof color.blue === 'number').assertTrue();
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
    })

    /**
     * @tc.name   getMainColor8
     * @tc.number EFFECT_KIT_GETMAINCOLOR_JSAPI_008
     * @tc.desc   Compare getMainColor with getMainColorSync results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getMainColor8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'getMainColor8';
      let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
      console.log(msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      console.info(msgStr + "promise create pixmap.start");
      await imageSource.createPixelMap().then(async (pixelMap) => {
        console.info(msgStr + "Napi create ColorPicker.start");
        await effectKit.createColorPicker(pixelMap).then(async (colorPicker) => {
          console.info(msgStr + "Napi get main color start (async)");
          // Get color using async method
          await colorPicker.getMainColor().then(colorAsync => {
            console.info(msgStr + "Napi async color[ARGB]=" + colorAsync.alpha + "," + colorAsync.red + "," + colorAsync.green + "," + colorAsync.blue);
            // Get color using sync method
            let colorSync = colorPicker.getMainColorSync();
            console.info(msgStr + "Napi sync color[ARGB]=" + colorSync.alpha + "," + colorSync.red + "," + colorSync.green + "," + colorSync.blue);
            // Compare results
            expect(colorAsync.alpha === colorSync.alpha).assertTrue();
            expect(colorAsync.red === colorSync.red).assertTrue();
            expect(colorAsync.green === colorSync.green).assertTrue();
            expect(colorAsync.blue === colorSync.blue).assertTrue();
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
     * @tc.name   getMainColorSync3
     * @tc.number EFFECT_KIT_GETMAINCOLORSYNC_JSAPI_003
     * @tc.desc   Verify the color properties returned by getMainColorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getMainColorSync3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'getMainColorSync3';
      let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
      console.log(msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      console.info(msgStr + "promise create pixmap.start");
      await imageSource.createPixelMap().then(async (pixelMap) => {
        console.info(msgStr + "Napi create ColorPicker.start");
        await effectKit.createColorPicker(pixelMap).then(async (colorPicker) => {
          console.info(msgStr + "Napi get main color start");
          let color = colorPicker.getMainColorSync();
          console.info(msgStr + "Napi color[ARGB]=" + color.alpha + "," + color.red + "," + color.green + "," + color.blue);
          expect(color.alpha !== null).assertTrue();
          expect(color.red !== null).assertTrue();
          expect(color.green !== null).assertTrue();
          expect(color.blue !== null).assertTrue();
          expect(color.alpha >= 0 && color.alpha <= 255).assertTrue();
          expect(color.red >= 0 && color.red <= 255).assertTrue();
          expect(color.green >= 0 && color.green <= 255).assertTrue();
          expect(color.blue >= 0 && color.blue <= 255).assertTrue();
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

    /**
     * @tc.name   getMainColorSync4
     * @tc.number EFFECT_KIT_GETMAINCOLORSYNC_JSAPI_004
     * @tc.desc   Test getMainColorSync with PNG image
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getMainColorSync4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'getMainColorSync4';
      let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
      console.log(msgStr + 'begin');
      let imageSource = image.createImageSource(testPng.buffer);
      console.info(msgStr + "promise create pixmap.start");
      await imageSource.createPixelMap().then(async (pixelMap) => {
        console.info(msgStr + "Napi create ColorPicker.start");
        await effectKit.createColorPicker(pixelMap).then(async (colorPicker) => {
          console.info(msgStr + "Napi get main color start");
          let color = colorPicker.getMainColorSync();
          console.info(msgStr + "Napi color[ARGB]=" + color.alpha + "," + color.red + "," + color.green + "," + color.blue);
          expect(color != null).assertTrue();
          expect(typeof color.alpha === 'number').assertTrue();
          expect(typeof color.red === 'number').assertTrue();
          expect(typeof color.green === 'number').assertTrue();
          expect(typeof color.blue === 'number').assertTrue();
          expect(color.alpha).assertEqual(255);
          expect(color.red).assertEqual(177);
          expect(color.green).assertEqual(175);
          expect(color.blue).assertEqual(160);
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

    /**
     * @tc.name   getMainColorSync5
     * @tc.number EFFECT_KIT_GETMAINCOLORSYNC_JSAPI_005
     * @tc.desc   Test getMainColorSync with region parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getMainColorSync5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'getMainColorSync5';
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
        }
        console.info(msgStr + "Napi size=" + value.size.width + " X " + value.size.height);
        let size: image.Size = {
          width: value.size.width, height: value.size.height
        }
        console.info(msgStr + "promise create pixmap.start");
        imageSource.createPixelMap({ desiredSize: size }).then(async (pixelMap) => {
          console.info(msgStr + "Napi create ColorPicker.start");
          await effectKit.createColorPicker(pixelMap, [0, 0, 0.5, 0.5]).then(async (colorPicker) => {
            console.info(msgStr + "Napi get main color start with region");
            let color = colorPicker.getMainColorSync();
            console.info(msgStr + "Napi color[ARGB]=" + color.alpha + "," + color.red + "," + color.green + "," + color.blue);
            expect(color != null).assertTrue();
            expect(color.alpha).assertEqual(255);
            expect(color.red).assertEqual(177);
            expect(color.green).assertEqual(175);
            expect(color.blue).assertEqual(160);
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
     * @tc.name   getMainColorSync6
     * @tc.number EFFECT_KIT_GETMAINCOLORSYNC_JSAPI_006
     * @tc.desc   Test getMainColorSync multiple calls consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getMainColorSync6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'getMainColorSync6';
      let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
      console.log(msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      console.info(msgStr + "promise create pixmap.start");
      await imageSource.createPixelMap().then(async (pixelMap) => {
        console.info(msgStr + "Napi create ColorPicker.start");
        await effectKit.createColorPicker(pixelMap).then(async (colorPicker) => {
          console.info(msgStr + "Napi get main color start");
          let color1 = colorPicker.getMainColorSync();
          let color2 = colorPicker.getMainColorSync();
          console.info(msgStr + "Napi color1[ARGB]=" + color1.alpha + "," + color1.red + "," + color1.green + "," + color1.blue);
          console.info(msgStr + "Napi color2[ARGB]=" + color2.alpha + "," + color2.red + "," + color2.green + "," + color2.blue);
          expect(color1.alpha === color2.alpha).assertTrue();
          expect(color1.red === color2.red).assertTrue();
          expect(color1.green === color2.green).assertTrue();
          expect(color1.blue === color2.blue).assertTrue();
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

    /**
     * @tc.name   verifyFilterProperties
     * @tc.number EFFECT_KIT_FILTER_PROPERTIES_JSAPI_001
     * @tc.desc   Verify the properties of filter object returned by createEffect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('verifyFilterProperties', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = 'verifyFilterProperties';
        let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
        console.log(msgStr + 'begin');
        let imageSource = image.createImageSource(testJpg.buffer);
        console.info(msgStr + "promise create pixmap.start");
        await imageSource.createPixelMap().then(pixelMap => {
          console.info(msgStr + "Napi create Effect.start");
          let filter = effectKit.createEffect(pixelMap);
          console.info(msgStr + "Filter object: " + JSON.stringify(filter));

          // Verify filter is not null or undefined
          expect(filter != null).assertTrue();
          expect(filter != undefined).assertTrue();

          // Verify filter is an object
          expect(typeof filter === 'object').assertTrue();

          // Verify filter has expected methods
          expect(typeof filter.blur === 'function').assertTrue();
          expect(typeof filter.brightness === 'function').assertTrue();
          expect(typeof filter.grayscale === 'function').assertTrue();
          expect(typeof filter.invert === 'function').assertTrue();
          expect(typeof filter.setColorMatrix === 'function').assertTrue();
          expect(typeof filter.getPixelMap === 'function').assertTrue();
          expect(typeof filter.getEffectPixelMap === 'function').assertTrue();

          console.info(msgStr + "All filter properties verified successfully");
          done();
        }).catch((ex: BusinessError) => {
          console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
          expect(true).assertFail();
          done();
        })
      })

    /**
     * @tc.name   verifyFilterMethodsReturn
     * @tc.number EFFECT_KIT_FILTER_METHODS_RETURN_JSAPI_002
     * @tc.desc   Verify the return values of filter methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('verifyFilterMethodsReturn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = 'verifyFilterMethodsReturn';
        let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
        console.log(msgStr + 'begin');
        let imageSource = image.createImageSource(testJpg.buffer);
        console.info(msgStr + "promise create pixmap.start");
        await imageSource.createPixelMap().then(pixelMap => {
          console.info(msgStr + "Napi create Effect.start");
          let headFilter = effectKit.createEffect(pixelMap);

          // Test blur method returns filter object
          let blurFilter = headFilter.blur(10);
          expect(blurFilter != null).assertTrue();
          expect(typeof blurFilter.blur === 'function').assertTrue();
          expect(typeof blurFilter.brightness === 'function').assertTrue();

          // Test brightness method returns filter object
          let brightnessFilter = headFilter.brightness(0.5);
          expect(brightnessFilter != null).assertTrue();
          expect(typeof brightnessFilter.blur === 'function').assertTrue();
          expect(typeof brightnessFilter.grayscale === 'function').assertTrue();

          // Test grayscale method returns filter object
          let grayscaleFilter = headFilter.grayscale();
          expect(grayscaleFilter != null).assertTrue();
          expect(typeof grayscaleFilter.blur === 'function').assertTrue();
          expect(typeof grayscaleFilter.invert === 'function').assertTrue();

          // Test invert method returns filter object
          let invertFilter = headFilter.invert();
          expect(invertFilter != null).assertTrue();
          expect(typeof invertFilter.blur === 'function').assertTrue();
          expect(typeof invertFilter.brightness === 'function').assertTrue();

          console.info(msgStr + "All filter methods return verified successfully");
          done();
        }).catch((ex: BusinessError) => {
          console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
          expect(true).assertFail();
          done();
        })
      })

    /**
     * @tc.name   verifyFilterChainCalls
     * @tc.number EFFECT_KIT_FILTER_CHAIN_CALLS_JSAPI_003
     * @tc.desc   Verify filter chain calls return correct objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('verifyFilterChainCalls', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = 'verifyFilterChainCalls';
        let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
        console.log(msgStr + 'begin');
        let imageSource = image.createImageSource(testJpg.buffer);
        console.info(msgStr + "promise create pixmap.start");
        await imageSource.createPixelMap().then(pixelMap => {
          console.info(msgStr + "Napi create Effect.start");
          let headFilter = effectKit.createEffect(pixelMap);

          // Test single chain
          let chain1 = headFilter.blur(10);
          expect(chain1 != null).assertTrue();
          expect(typeof chain1.getPixelMap === 'function').assertTrue();

          // Test double chain
          let chain2 = headFilter.blur(10).brightness(0.5);
          expect(chain2 != null).assertTrue();
          expect(typeof chain2.getPixelMap === 'function').assertTrue();

          // Test triple chain
          let chain3 = headFilter.blur(10).brightness(0.5).grayscale();
          expect(chain3 != null).assertTrue();
          expect(typeof chain3.getPixelMap === 'function').assertTrue();

          // Test quadruple chain
          let chain4 = headFilter.blur(5).brightness(0.3).grayscale().invert();
          expect(chain4 != null).assertTrue();
          expect(typeof chain4.getPixelMap === 'function').assertTrue();

          console.info(msgStr + "All filter chain calls verified successfully");
          done();
        }).catch((ex: BusinessError) => {
          console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
          expect(true).assertFail();
          done();
        })
      })

    /**
     * @tc.name   verifyFilterGetPixelMap
     * @tc.number EFFECT_KIT_FILTER_GETPIXELMAP_JSAPI_004
     * @tc.desc   Verify getPixelMap method returns valid PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('verifyFilterGetPixelMap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = 'verifyFilterGetPixelMap';
        let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
        console.log(msgStr + 'begin');
        let imageSource = image.createImageSource(testJpg.buffer);
        console.info(msgStr + "promise create pixmap.start");
        await imageSource.createPixelMap().then(pixelMap => {
          console.info(msgStr + "Napi create Effect.start");
          let headFilter = effectKit.createEffect(pixelMap);

          // Test getPixelMap on base filter
          let pixelMap1 = headFilter.getPixelMap();
          expect(pixelMap1 != null).assertTrue();
          expect(typeof pixelMap1 === 'object').assertTrue();
          expect(typeof pixelMap1.getImageInfo === 'function').assertTrue();

          // Test getPixelMap after blur
          let pixelMap2 = headFilter.blur(10).getPixelMap();
          expect(pixelMap2 != null).assertTrue();
          expect(typeof pixelMap2 === 'object').assertTrue();
          expect(typeof pixelMap2.getPixelBytesNumber === 'function').assertTrue();

          // Test getPixelMap after chain
          let pixelMap3 = headFilter.blur(5).brightness(0.5).getPixelMap();
          expect(pixelMap3 != null).assertTrue();
          expect(typeof pixelMap3 === 'object').assertTrue();

          console.info(msgStr + "All getPixelMap calls verified successfully");
          done();
        }).catch((ex: BusinessError) => {
          console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
          expect(true).assertFail();
          done();
        })
      })

    /**
     * @tc.name   verifyFilterGetEffectPixelMap
     * @tc.number EFFECT_KIT_FILTER_GETEFFECTPIXELMAP_JSAPI_005
     * @tc.desc   Verify getEffectPixelMap method returns valid PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('verifyFilterGetEffectPixelMap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = 'verifyFilterGetEffectPixelMap';
        let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
        console.log(msgStr + 'begin');
        let imageSource = image.createImageSource(testJpg.buffer);
        console.info(msgStr + "promise create pixmap.start");
        await imageSource.createPixelMap().then(pixelMap => {
          console.info(msgStr + "Napi create Effect.start");
          let headFilter = effectKit.createEffect(pixelMap);

          // Test getEffectPixelMap after blur
          headFilter.blur(10).getEffectPixelMap().then(data => {
            expect(data != null).assertTrue();
            expect(typeof data === 'object').assertTrue();
            expect(typeof data.getPixelBytesNumber === 'function').assertTrue();
            let bytes = data.getPixelBytesNumber();
            expect(bytes > 0).assertTrue();
            console.info(msgStr + "getEffectPixelMap bytes: " + bytes);
            done();
          }).catch((error: BusinessError) => {
            console.error(msgStr + "getEffectPixelMap error: " + JSON.stringify(error));
            expect().assertFail();
            done();
          })
        }).catch((ex: BusinessError) => {
          console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
          expect(true).assertFail();
          done();
        })
      })

    /**
     * @tc.name   verifyFilterSetColorMatrix
     * @tc.number EFFECT_KIT_FILTER_SETCOLORMATRIX_JSAPI_006
     * @tc.desc   Verify setColorMatrix method behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('verifyFilterSetColorMatrix', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = 'verifyFilterSetColorMatrix';
        let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
        console.log(msgStr + 'begin');
        let imageSource = image.createImageSource(testJpg.buffer);
        console.info(msgStr + "promise create pixmap.start");
        await imageSource.createPixelMap().then(pixelMap => {
          console.info(msgStr + "Napi create Effect.start");
          let headFilter = effectKit.createEffect(pixelMap);

          // Test setColorMatrix returns filter object
          let colorMatrix: Array<number> = [
            0.2126, 0.7152, 0.0722, 0, 0,
            0.2126, 0.7152, 0.0722, 0, 0,
            0.2126, 0.7152, 0.0722, 0, 0,
            0, 0, 0, 1, 0
          ];
          let result = headFilter.setColorMatrix(colorMatrix);
          expect(result != null).assertTrue();
          expect(typeof result.blur === 'function').assertTrue();
          expect(typeof result.getPixelMap === 'function').assertTrue();

          // Test chain with colorMatrix
          let chainResult = headFilter.setColorMatrix(colorMatrix).blur(5);
          expect(chainResult != null).assertTrue();
          expect(typeof chainResult.getPixelMap === 'function').assertTrue();

          console.info(msgStr + "setColorMatrix verified successfully");
          done();
        }).catch((ex: BusinessError) => {
          console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
          expect(true).assertFail();
          done();
        })
      })

    /**
     * @tc.name   verifyFilterWithDifferentTileModes
     * @tc.number EFFECT_KIT_FILTER_TILEMODES_JSAPI_007
     * @tc.desc   Verify filter with different TileMode parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('verifyFilterWithDifferentTileModes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = 'verifyFilterWithDifferentTileModes';
        let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
        console.log(msgStr + 'begin');
        let imageSource = image.createImageSource(testJpg.buffer);
        console.info(msgStr + "promise create pixmap.start");
        await imageSource.createPixelMap().then(pixelMap => {
          console.info(msgStr + "Napi create Effect.start");
          let headFilter = effectKit.createEffect(pixelMap);

          // Test with CLAMP
          let filter1 = headFilter.blur(10, effectKit.TileMode.CLAMP);
          expect(filter1 != null).assertTrue();
          expect(typeof filter1.getPixelMap === 'function').assertTrue();

          // Test with REPEAT
          let filter2 = headFilter.blur(10, effectKit.TileMode.REPEAT);
          expect(filter2 != null).assertTrue();
          expect(typeof filter2.getPixelMap === 'function').assertTrue();

          // Test with MIRROR
          let filter3 = headFilter.blur(10, effectKit.TileMode.MIRROR);
          expect(filter3 != null).assertTrue();
          expect(typeof filter3.getPixelMap === 'function').assertTrue();

          // Test with DECAL
          let filter4 = headFilter.blur(10, effectKit.TileMode.DECAL);
          expect(filter4 != null).assertTrue();
          expect(typeof filter4.getPixelMap === 'function').assertTrue();

          console.info(msgStr + "All TileMode filters verified successfully");
          done();
        }).catch((ex: BusinessError) => {
          console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
          expect(true).assertFail();
          done();
        })
      })

  })
}