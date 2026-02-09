/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import effectKit from '@ohos.effectKit';
import image from '@ohos.multimedia.image';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { testJpg } from '../model/testImg';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function GraphicEffectKitStaticTest() {

  describe("graphicEffectKitStaticTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    let pixelMap: image.PixelMap;
    beforeAll(() => {
      const color = new ArrayBuffer(96);
      let opts : image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: {
          height: 4,
          width: 6
        }
      };
      pixelMap = image.createPixelMapSync(color, opts);
    })
    /**
     * @tc.name   effectKitTest_static_0100
     * @tc.number effectKitTest_static_0100
     * @tc.desc   effect for test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("effectKitTest_static_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      // effectKit test codes
      hilog.info(domain, tag, '%{public}s', 'effectKit test START');
      const opts: image.InitializationOptions = {
        size: { width: 400, height: 360},
        srcPixelFormat: image.PixelMapFormat.RGBA_8888,
        alphaType: image.AlphaType.PREMUL,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        editable: true
      };
      let pixelMap = image.createPixelMapSync(opts);
      if (pixelMap == undefined) {
        hilog.info(domain, tag, '%{public}s', 'effectKit createPixelMapSync failed.');
        expect().assertFail();
      };
      try {
        let headFilter: effectKit.Filter = effectKit.createEffect(pixelMap);
        console.info('www data succeed')
        if (headFilter == undefined) {
          hilog.info(domain, tag, '%{public}s', 'effectKit createFilter failed.');
          expect().assertFail();
        }
        try {
          let blurFilter: effectKit.Filter = headFilter.blur(10);
          hilog.info(domain, tag, '%{public}s', 'effectKit createFilter successfully.');
          const effectPixelMap = await blurFilter.getEffectPixelMap();
          hilog.info(domain, tag, '%{public}s', 'effectKit test END');
          expect(effectPixelMap != undefined).assertTrue();
          done();
        } catch(err){
          expect().assertFail();
          done();
        }
      } catch(err){
        console.info('www data err ' + JSON.stringify(err))
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   effectKitTest_static_0200
     * @tc.number effectKitTest_static_0200
     * @tc.desc   effect for test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("effectKitTest_static_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          let radius = 30;
          let headFilter = effectKit.createEffect(pixelMap);
          if (headFilter != null) {
            headFilter.blur(radius, effectKit.TileMode.CLAMP);
            headFilter.blur(radius, effectKit.TileMode.REPEAT);
            headFilter.blur(radius, effectKit.TileMode.MIRROR);
            let blur4 = headFilter.blur(radius, effectKit.TileMode.DECAL);
            expect(blur4 != undefined).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        } catch(err) {
          console.info('www data effectKitTest_static_0100 error ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   effectKitTest_static_0300
     * @tc.number effectKitTest_static_0300
     * @tc.desc   effect for test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("effectKitTest_static_0300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let msg = 'testTileMode'
        console.log(msg + ' begin')
        expect(effectKit.TileMode.CLAMP + '').assertEqual('0')
        expect(effectKit.TileMode.REPEAT + '').assertEqual('1')
        expect(effectKit.TileMode.MIRROR + '').assertEqual('2')
        expect(effectKit.TileMode.DECAL + '').assertEqual('3')
        done()
      })

    /**
     * @tc.name   effectKitTest_static_0400
     * @tc.number effectKitTest_static_0400
     * @tc.desc   effect for test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("effectKitTest_static_0400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          let bright1 = 0.0;
          let bright2 = 0.5;
          let bright3 = 1.0;
          let headFilter = effectKit.createEffect(pixelMap);
          if (headFilter != null) {
            headFilter.brightness(bright1);
            headFilter.brightness(bright2);
            let brightness3 = headFilter.brightness(bright3);
            expect(brightness3 != undefined).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        } catch(err) {
          console.info('www data effectKitTest_static_0400 error ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   effectKitTest_static_0500
     * @tc.number effectKitTest_static_0500
     * @tc.desc   effect for test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("effectKitTest_static_0500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter != null) {
          let grayscale1 = headFilter.grayscale();
          expect(grayscale1 != undefined).assertTrue();
          done();
        } else {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   effectKitTest_static_0600
     * @tc.number effectKitTest_static_0600
     * @tc.desc   effect for test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("effectKitTest_static_0600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter != null) {
          let invert1 = headFilter.invert();
          expect(invert1 != undefined).assertTrue();
          done();
        } else {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   effectKitTest_static_0700
     * @tc.number effectKitTest_static_0700
     * @tc.desc   effect for test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("effectKitTest_static_0700", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let colorMatrix:Array<number> = [
          0.2126,0.7152,0.0722,0,0,
          0.2126,0.7152,0.0722,0,0,
          0.2126,0.7152,0.0722,0,0,
          0,0,0,1,0
        ];
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter != null) {
          let setColorMatrix1 = headFilter.setColorMatrix(colorMatrix);
          expect(setColorMatrix1 != undefined).assertTrue();
          done();
        } else {
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   effectKitTest_static_0800
     * @tc.number effectKitTest_static_0800
     * @tc.desc   effect for test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("effectKitTest_static_0800", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await effectKit.createColorPicker(pixelMap).then(async (colorPicker: effectKit.ColorPicker) => {
          console.info("www data color picker=" + colorPicker);
          await colorPicker.getMainColor().then((color: effectKit.Color) => {
            console.info('www data Succeeded in getting main color.');
            console.info(`www data color[ARGB]=${color?.alpha},${color?.red},${color?.green},${color.blue}`);
            expect(color != undefined).assertTrue();
            done();
          }).catch(err => {
            console.info('www data error getting main color.');
            expect().assertFail();
            done();
          })
        }).catch( (reason) => {
          console.error("www data effectKitTest_static_0800 error=");
          expect().assertFail();
          done();
        })
      })

    /**
     * @tc.name   effectKitTest_static_0900
     * @tc.number effectKitTest_static_0900
     * @tc.desc   effect for test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("effectKitTest_static_0900", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        effectKit.createColorPicker(pixelMap).then((colorPicker: effectKit.ColorPicker) => {
          try {
            let color = colorPicker.getMainColorSync();
            console.info('www data Succeeded in getMainColorSync.', color);
            console.info('www data Succeeded in getMainColorSync.', color.red);
            expect(color.red).assertLargerOrEqual(0);
            done();
          } catch (err) {
            console.error('www data Failed to getMainColorSync.');
            expect().assertFail();
            done();
          }
        }).catch( (reason) => {
          console.error("www data effectKitTest_static_0900 error=");
          expect().assertFail();
          done();
        })
      })

    /**
     * @tc.name   effectKitTest_static_1000
     * @tc.number effectKitTest_static_1000
     * @tc.desc   effect for test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("effectKitTest_static_1000", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        effectKit.createColorPicker(pixelMap).then((colorPicker: effectKit.ColorPicker) => {
          try {
            let color = colorPicker.getLargestProportionColor();
            console.info('www data Succeeded in getLargestProportionColor.',color);
            expect(color).assertUndefined();
            done();
          } catch (err) {
            console.error('www data Failed to getLargestProportionColor.');
            expect().assertFail();
            done();
          }
        }).catch( (reason) => {
          console.error("www data effectKitTest_static_1000 error=");
          expect().assertFail();
          done();
        })
      })

    /**
     * @tc.name   effectKitTest_static_1100
     * @tc.number effectKitTest_static_1100
     * @tc.desc   effect for test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("effectKitTest_static_1100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        effectKit.createColorPicker(pixelMap).then((colorPicker: effectKit.ColorPicker) => {
          try {
            let colors1 = colorPicker.getTopProportionColors(2);
            console.info('www data Succeeded in getTopProportionColors1.', colors1);
            let colors2 = colorPicker.getTopProportionColors(1);
            console.info('www data Succeeded in getTopProportionColors2.', colors2);
            done();
          } catch (err) {
            console.error('www data Failed to getTopProportionColors.');
            expect().assertFail();
            done();
          }
        }).catch( (reason) => {
          console.error("www data effectKitTest_static_1100 error=");
          expect().assertFail();
          done();
        })
      })

    /**
     * @tc.name   effectKitTest_static_1200
     * @tc.number effectKitTest_static_1200
     * @tc.desc   effect for test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("effectKitTest_static_1200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        effectKit.createColorPicker(pixelMap).then((colorPicker: effectKit.ColorPicker) => {
          try {
            let color = colorPicker.getHighestSaturationColor();
            console.info('www data Succeeded in getHighestSaturationColor.',color);
            expect(color).assertUndefined();
            done();
          } catch (err) {
            console.error('www data Failed to getHighestSaturationColor.');
            expect().assertFail();
            done();
          }
        }).catch( (reason) => {
          console.error("www data effectKitTest_static_1200 error=");
          expect().assertFail();
          done();
        })
      })

    /**
     * @tc.name   effectKitTest_static_1300
     * @tc.number effectKitTest_static_1300
     * @tc.desc   effect for test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("effectKitTest_static_1300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        effectKit.createColorPicker(pixelMap).then((colorPicker: effectKit.ColorPicker) => {
          try {
            let color = colorPicker.getAverageColor();
            console.info('www data Succeeded in getAverageColor.',color);
            expect(color).assertUndefined();
            done();
          } catch (err) {
            console.error('www data Failed to getAverageColor.');
            done();
          }
        }).catch( (reason) => {
          console.error("www data effectKitTest_static_1300 error=");
          expect().assertFail();
          done();
        })
      })

    /**
     * @tc.name   effectKitTest_static_1400
     * @tc.number effectKitTest_static_1400
     * @tc.desc   effect for test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("effectKitTest_static_1400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        effectKit.createColorPicker(pixelMap).then((colorPicker: effectKit.ColorPicker) => {
          try {
            let bJudge = colorPicker.isBlackOrWhiteOrGrayColor(0xFFFFFFFF as long);
            console.info('www data effectKitTest_static_1400 Succeeded in isBlackOrWhiteOrGrayColor.', bJudge);
            expect(bJudge).assertTrue();
            done();
          } catch (err) {
            console.error('www data effectKitTest_static_1400 Failed to isBlackOrWhiteOrGrayColor.', err);
            expect().assertFail();
            done();
          }
        }).catch( (reason) => {
          console.error("www data effectKitTest_static_1400 effectKitTest_static_1400 error=");
          expect().assertFail();
          done();
        })
      })

    /**
     * @tc.name   effectKitTest_static_1500
     * @tc.number effectKitTest_static_1500
     * @tc.desc   effect for test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("effectKitTest_static_1500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {

        effectKit.createColorPicker(pixelMap).then((colorPicker: effectKit.ColorPicker) => {
          try {
            let color = colorPicker.getMainColorSync();
            console.info('www data Succeeded in getMainColorSync.' + JSON.stringify(color));
            console.info('www data color 123 ' + color?.red + '' + color?.blue + '' + color?.green + '' + color.alpha);
            expect(color.red).assertLargerOrEqual(0);
            done();
          } catch (err) {
            console.error('www data Failed to getMainColorSync.');
            expect().assertFail();
            done();
          }
        }).catch( (reason) => {
          console.error("www data effectKitTest_static_0900 error=");
          expect().assertFail();
          done();
        })
      })

    /**
     * @tc.name   effectKitTest_static_1600
     * @tc.number effectKitTest_static_1600
     * @tc.desc   effect for test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("effectKitTest_static_1600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        effectKit.createColorPicker(pixelMap).then((colorPicker: effectKit.ColorPicker) => {
          console.info("www data effectKitTest_static_1600 color picker=" + colorPicker);
          expect(colorPicker != undefined).assertTrue();
          done();
        }).catch( (reason) => {
          console.error("www data effectKitTest_static_1600 error=");
          expect().assertFail();
          done();
        })
      })

    /**
     * @tc.name   effectKitTest_static_1700
     * @tc.number effectKitTest_static_1700
     * @tc.desc   effect for test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("effectKitTest_static_1700", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        effectKit.createColorPicker(pixelMap, (error, colorPicker) => {
          if (error) {
            console.error('www data Failed to create color picker.' + JSON.stringify(error));
            expect().assertFail();
            done();
          } else {
            console.info('www data Succeeded in creating color picker.');
            done();
          }
        })
      })

    /**
     * @tc.name   effectKitTest_static_1800
     * @tc.number effectKitTest_static_1800
     * @tc.desc   effect for test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("effectKitTest_static_1800", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        effectKit.createColorPicker(pixelMap, [0, 0, 1, 1], (error, colorPicker) => {
          if (error) {
            console.error('www data Failed to create color picker.' + JSON.stringify(error));
            expect().assertFail();
            done();
          } else {
            console.info('www data Succeeded in creating color picker.');
            done();
          }
        })
      })

    /**
     * @tc.name   effectKitTest_static_1900
     * @tc.number effectKitTest_static_1900
     * @tc.desc   effect for test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("effectKitTest_static_1900", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'effectKit test START');
        const opts: image.InitializationOptions = {
          size: { width: 400, height: 360},
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          alphaType: image.AlphaType.PREMUL,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          editable: true
        };
        let pixelMap = image.createPixelMapSync(opts);
        if (pixelMap == undefined) {
          hilog.info(domain, tag, '%{public}s', 'effectKit createPixelMapSync failed.');
          expect().assertFail();
          return undefined;
        };
        try {
          let headFilter: effectKit.Filter = effectKit.createEffect(pixelMap);
          console.info('www data succeed 11111')
          if (headFilter == undefined) {
            hilog.info(domain, tag, '%{public}s', 'effectKit createFilter failed.');
            expect().assertFail();
            return undefined;
          }
          let blurFilter: effectKit.Filter = headFilter.blur(10);
          console.info('www data succeed 2222')
          hilog.info(domain, tag, '%{public}s', 'effectKit createFilter successfully.');
          const effectPixelMap1 = await blurFilter.getEffectPixelMap(false);
          console.info('www data succeed 33333')
          if (effectPixelMap1 != undefined) {
            console.info('www data succeed 6666')
            hilog.info(domain, tag, '%{public}s', 'effectKit getEffectPixelMap successfully.');
          } else {
            hilog.info(domain, tag, '%{public}s', 'effectKit getEffectPixelMap failed.');
            expect().assertFail();
          }
          const effectPixelMap2 = await blurFilter.getEffectPixelMap(true);
          console.info('www data succeed 33333')
          if (effectPixelMap2 != undefined) {
            console.info('www data succeed 6666')
            hilog.info(domain, tag, '%{public}s', 'effectKit getEffectPixelMap successfully.');
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', 'effectKit getEffectPixelMap failed.');
            expect().assertFail();
            done();
          }
        } catch(err){
          console.info('www data err ' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   effectKitTest_static_2000
     * @tc.number effectKitTest_static_2000
     * @tc.desc   effect for test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("effectKitTest_static_2000", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data testGetTopProportionColors_2 '
        let imageSource: image.ImageSource = image.createImageSource(testJpg.buffer) as image.ImageSource;
        const opts: image.DecodingOptions = {
          editable: true,
          desiredPixelFormat: image.PixelMapFormat.RGBA_8888
        };
        let pixelMap = (await imageSource.createPixelMap()) as image.PixelMap;
        let colorPicker = (await effectKit.createColorPicker(pixelMap)) as effectKit.ColorPicker;
        let color1 = colorPicker.getTopProportionColors(2);
        console.info(msgStr + JSON.stringify(color1));
        expect(color1.length).assertLarger(0);
        let color2 = colorPicker.getTopProportionColors(-1);
        console.info(msgStr + JSON.stringify(color2));
        console.info('www data color2[index]', color2.length)
        if(JSON.stringify(color2) == '[null]'){
          console.info('www data color111 ', 11111);
          color2.pop();
          expect(color2.length == 0).assertTrue();
          done();
        } else {
          console.info('www data color111 ', 22222);
          expect(color2.length).assertLarger(0);
          done();
        }
      })

    /**
     * @tc.name   effectKitTest_static_2100
     * @tc.number effectKitTest_static_2100
     * @tc.desc   effect for test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("effectKitTest_static_2100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data testGetTopProportionColors_2 '
        let imageSource: image.ImageSource = image.createImageSource(testJpg.buffer) as image.ImageSource;
        const opts: image.DecodingOptions = {
          editable: true,
          desiredPixelFormat: image.PixelMapFormat.RGBA_8888
        };
        let pixelMap = (await imageSource.createPixelMap()) as image.PixelMap;
        let colorPicker = (await effectKit.createColorPicker(pixelMap)) as effectKit.ColorPicker;
        let color_white = colorPicker.isBlackOrWhiteOrGrayColor(0xFFFFFFFF as long);
        expect(color_white == true).assertTrue();
        let color_blue = colorPicker.isBlackOrWhiteOrGrayColor(0xFF0000FF as long);
        expect(color_blue == false).assertTrue();
        console.info(msgStr + '  ' + color_white + ' ' + color_blue);
        done();
      })

    /**
     * @tc.name   effectKitTest_static_2200
     * @tc.number effectKitTest_static_2200
     * @tc.desc   effect for test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("effectKitTest_static_2200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = 'www data testGetTopProportionColors_2 '
        let imageSource: image.ImageSource = image.createImageSource(testJpg.buffer) as image.ImageSource;
        const opts: image.DecodingOptions = {
          editable: true,
          desiredPixelFormat: image.PixelMapFormat.RGBA_8888
        };
        let pixelMap = (await imageSource.createPixelMap()) as image.PixelMap;
        let colorPicker = (await effectKit.createColorPicker(pixelMap)) as effectKit.ColorPicker;
        let color = colorPicker.getLargestProportionColor();
        console.info('www data get largest proportion color = ' + JSON.stringify(color));
        expect(color.red).assertLargerOrEqual(0);
        done();
      })

  })
}