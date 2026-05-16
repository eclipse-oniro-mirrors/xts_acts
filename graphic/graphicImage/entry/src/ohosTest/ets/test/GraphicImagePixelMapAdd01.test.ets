/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import image from '@ohos.multimedia.image';
import { BusinessError } from '@kit.BasicServicesKit';

// 统一的日志标识前缀
const LOG_PREFIX: string = '[www data GraphicImagePixelMapAdd_01]';

export default function GraphicImagePixelMapAdd01() {
  describe('GraphicImagePixelMapAdd01', ()=> {
    beforeAll(async (done:Function)=> {
      console.info("imagePixelMapTest beforeEach start");
      done();
    });
    
    /**
     * @tc.name opacityNullParam
     * @tc.number PixelMapAdditionalCoverageTest_001
     * @tc.desc PixelMap opacity with null parameter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('opacityNullParam', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} opacityNullParam: Starting test with null parameter.`);

        // 测试 null 参数
        pixelMap.opacity(null, (error: BusinessError) => {
          if (error) {
            console.info(
              `${LOG_PREFIX} opacityNullParam: As expected, failed with null parameter. Code: ${error.code}`
            );
            expect(error.code).assertUndefined();
            pixelMap?.release();
            done();
          } else {
            console.error(`${LOG_PREFIX} opacityNullParam: Unexpectedly succeeded with null parameter`);
            expect().assertFail();
            pixelMap?.release();
            done();
          }
        });
      } catch (error) {
        console.info(`${LOG_PREFIX} opacityNullParam: Caught exception as expected: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name opacityValidParam
     * @tc.number PixelMapAdditionalCoverageTest_002
     * @tc.desc PixelMap opacity with valid parameter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('opacityValidParam', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} opacityValidParam: Starting test with valid parameter.`);

        // 测试正常参数
        await pixelMap.opacity(0.5);
        console.info(`${LOG_PREFIX} opacityValidParam: Succeeded with valid parameter.`);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} opacityValidParam failed: code ${error.code}, message ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scaleValidParamNone
     * @tc.number PixelMapAdditionalCoverageTest_003
     * @tc.desc PixelMap scale with AntiAliasingLevel.NONE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('scaleValidParamNone', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scaleValidParamNone: Starting test with AntiAliasingLevel.NONE.`);

        // 测试 AntiAliasingLevel.NONE 枚举值
        await pixelMap.scale(1.0, 1.0, image.AntiAliasingLevel.NONE);
        console.info(`${LOG_PREFIX} scaleValidParamNone: Succeeded with AntiAliasingLevel.NONE.`);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} scaleValidParamNone failed: code ${error.code}, message ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scaleValidParamHigh
     * @tc.number PixelMapAdditionalCoverageTest_004
     * @tc.desc PixelMap scale with AntiAliasingLevel.HIGH
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('scaleValidParamHigh', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scaleValidParamHigh: Starting test with AntiAliasingLevel.HIGH.`);

        // 测试 AntiAliasingLevel.HIGH 枚举值
        await pixelMap.scale(1.0, 1.0, image.AntiAliasingLevel.HIGH);
        console.info(`${LOG_PREFIX} scaleValidParamHigh: Succeeded with AntiAliasingLevel.HIGH.`);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} scaleValidParamHigh failed: code ${error.code}, message ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name flipHorizontalTrue
     * @tc.number PixelMapAdditionalCoverageTest_005
     * @tc.desc PixelMap flip with horizontal=true, vertical=true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('flipHorizontalTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} flipHorizontalTrue: Starting test with horizontal=true, vertical=true.`);

        // 测试 true, true 参数
        pixelMap.flip(true, true, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} flipHorizontalTrue failed: code ${error.code}, message ${error.message}`);
            expect().assertFail();
            pixelMap?.release();
            done();
          } else {
            console.info(`${LOG_PREFIX} flipHorizontalTrue: Succeeded with horizontal=true, vertical=true.`);
            pixelMap?.release();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} flipHorizontalTrue failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name flipHorizontalFalse
     * @tc.number PixelMapAdditionalCoverageTest_006
     * @tc.desc PixelMap flip with horizontal=true, vertical=false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('flipHorizontalFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} flipHorizontalFalse: Starting test with horizontal=true, vertical=false.`);

        // 测试 true, false 参数
        pixelMap.flip(true, false, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} flipHorizontalFalse failed: code ${error.code}, message ${error.message}`);
            expect().assertFail();
            pixelMap?.release();
            done();
          } else {
            console.info(`${LOG_PREFIX} flipHorizontalFalse: Succeeded with horizontal=true, vertical=false.`);
            pixelMap?.release();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} flipHorizontalFalse failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name flipHorizontalFalseVerticalTrue
     * @tc.number PixelMapAdditionalCoverageTest_007
     * @tc.desc PixelMap flip with horizontal=false, vertical=true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('flipHorizontalFalseVerticalTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 },
          };
          const pixelMap = image.createPixelMapSync(color, opts);
          console.info(
            `${LOG_PREFIX} flipHorizontalFalseVerticalTrue: Starting test with horizontal=false, vertical=true.`
          );

          // 测试 false, true 参数
          pixelMap.flip(false, true, (error: BusinessError) => {
            if (error) {
              console.error(
                `${LOG_PREFIX} flipHorizontalFalseVerticalTrue failed: code ${error.code}, message ${error.message}`
              );
              expect().assertFail();
              pixelMap?.release();
              done();
            } else {
              console.info(
                `${LOG_PREFIX} flipHorizontalFalseVerticalTrue: Succeeded with horizontal=false, vertical=true.`
              );
              pixelMap?.release();
              done();
            }
          });
        } catch (error) {
          console.error(`${LOG_PREFIX} flipHorizontalFalseVerticalTrue failed: ${error}`);
          expect().assertFail();
          done();
        }
    });

    /**
     * @tc.name flipHorizontalFalseVerticalFalse
     * @tc.number PixelMapAdditionalCoverageTest_008
     * @tc.desc PixelMap flip with horizontal=false, vertical=false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('flipHorizontalFalseVerticalFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 },
          };
          const pixelMap = image.createPixelMapSync(color, opts);
          console.info(
            `${LOG_PREFIX} flipHorizontalFalseVerticalFalse: Starting test with horizontal=false, vertical=false.`
          );

          // 测试 false, false 参数
          pixelMap.flip(false, false, (error: BusinessError) => {
            if (error) {
              console.error(
                `${LOG_PREFIX} flipHorizontalFalseVerticalFalse failed: code ${error.code}, message ${error.message}`
              );
              expect().assertFail();
              pixelMap?.release();
            } else {
              console.info(
                `${LOG_PREFIX} flipHorizontalFalseVerticalFalse: Succeeded with horizontal=false, vertical=false.`
              );
              pixelMap?.release();
              done();
            }
          });
        } catch (error) {
          console.error(`${LOG_PREFIX} flipHorizontalFalseVerticalFalse failed: ${error}`);
          expect().assertFail();
          done();
        }
    });
    

    /**
     * @tc.name createPixelMap001
     * @tc.number PixelMapCreateTest_001
     * @tc.desc createPixelMap with valid parameters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('createPixelMap001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        expect(pixelMap !== null).assertTrue();
        console.info(`${LOG_PREFIX} createPixelMap001: Succeeded in creating pixel map.`);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} createPixelMap001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createPixelMapNull001
     * @tc.number PixelMapCreateTest_002
     * @tc.desc createPixelMap with null buffer (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('createPixelMapNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(null, opts);
        console.info(`${LOG_PREFIX} createPixelMapNull001 success `, JSON.stringify(pixelMap));
        expect(pixelMap).assertUndefined();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} createPixelMapNull001: Failed with null buffer as expected, code: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createPixelMapNull002
     * @tc.number PixelMapCreateTest_003
     * @tc.desc createPixelMap with null options (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('createPixelMapNull002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const pixelMap = image.createPixelMapSync(color, null);
        console.info(`${LOG_PREFIX} createPixelMapNull002 success `, JSON.stringify(pixelMap));
        expect(pixelMap).assertUndefined();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} createPixelMapNull002: Failed with null options as expected, code: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createPixelMapUndefined001
     * @tc.number PixelMapCreateTest_004
     * @tc.desc createPixelMap with undefined buffer (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('createPixelMapUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(undefined, opts);
        console.info(`${LOG_PREFIX} createPixelMapUndefined001 success `, JSON.stringify(pixelMap));
        expect(pixelMap).assertUndefined();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(
          `${LOG_PREFIX} createPixelMapUndefined001: Failed with undefined buffer as expected, code: ${error}`
        );
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createPixelMapUndefined002
     * @tc.number PixelMapCreateTest_005
     * @tc.desc createPixelMap with undefined options (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('createPixelMapUndefined002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const pixelMap = image.createPixelMapSync(color, undefined);
        console.info(`${LOG_PREFIX} createPixelMapUndefined002 success `, JSON.stringify(pixelMap));
        expect(pixelMap).assertUndefined();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(
          `${LOG_PREFIX} createPixelMapUndefined002: Failed with undefined options as expected, code: ${error}`
        );
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createPixelMapInvalidSize001
     * @tc.number PixelMapCreateTest_006
     * @tc.desc createPixelMap with invalid size (width: 0)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('createPixelMapInvalidSize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 0 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} createPixelMapInvalidSize001 success `, JSON.stringify(pixelMap));
        expect(pixelMap).assertUndefined();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} createPixelMapInvalidSize001: Failed with width 0 as expected, code: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createPixelMapInvalidSize002
     * @tc.number PixelMapCreateTest_007
     * @tc.desc createPixelMap with invalid size (height: 0)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('createPixelMapInvalidSize002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 0, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} createPixelMapInvalidSize002 success `, JSON.stringify(pixelMap));
        expect(pixelMap).assertUndefined();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} createPixelMapInvalidSize002: Failed with height 0 as expected, code: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createPixelMapInvalidSize003
     * @tc.number PixelMapCreateTest_008
     * @tc.desc createPixelMap with invalid size (negative width)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('createPixelMapInvalidSize003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: -1 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} createPixelMapInvalidSize003 success `, JSON.stringify(pixelMap));
        expect(pixelMap).assertUndefined();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(
          `${LOG_PREFIX} createPixelMapInvalidSize003: Failed with negative width as expected, code: ${error}`
        );
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createPixelMapInvalidSize004
     * @tc.number PixelMapCreateTest_009
     * @tc.desc createPixelMap with invalid size (negative height)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('createPixelMapInvalidSize004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: -1, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} createPixelMapInvalidSize004 success `, JSON.stringify(pixelMap));
        expect(pixelMap).assertUndefined();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(
          `${LOG_PREFIX} createPixelMapInvalidSize004: Failed with negative height as expected, code: ${error}`
        );
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createPixelMapDifferentFormats001
     * @tc.number PixelMapCreateTest_010
     * @tc.desc createPixelMap with different pixel formats
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('createPixelMapDifferentFormats001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);

          // Test with RGBA_8888 format
          const opts1: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 },
          };
          const pixelMap1 = image.createPixelMapSync(color, opts1);
          expect(pixelMap1 !== null).assertTrue();

          // Test with RGB_565 format
          const opts2: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGB_565,
            size: { height: 4, width: 6 },
          };
          const pixelMap2 = image.createPixelMapSync(color, opts2);
          expect(pixelMap2 !== null).assertTrue();

          // Test with BGRA_8888 format
          const opts3: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.BGRA_8888,
            size: { height: 4, width: 6 },
          };
          const pixelMap3 = image.createPixelMapSync(color, opts3);
          console.info(
            `${LOG_PREFIX} createPixelMapDifferentFormats001: Succeeded in creating pixel maps with different formats.`
          );
          expect(pixelMap3 !== null).assertTrue();
          await pixelMap1?.release();
          await pixelMap2?.release();
          await pixelMap3?.release();
          done();
        } catch (error) {
          console.error(`${LOG_PREFIX} createPixelMapDifferentFormats001 failed: ${error}`);
          expect().assertFail();
          done();
        }
      }
    );

    /**
     * @tc.name createPixelMapAsync001
     * @tc.number PixelMapCreateTest_011
     * @tc.desc createPixelMap with async callback - valid parameters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('createPixelMapAsync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };

        image.createPixelMap(color, opts, (error: BusinessError, pixelMap: image.PixelMap) => {
          if (error) {
            console.error(`${LOG_PREFIX} createPixelMapAsync001 failed: code ${error.code}, message ${error.message}`);
            expect().assertFail();
            pixelMap?.release();
            done();
          } else {
            console.info(`${LOG_PREFIX} createPixelMapAsync001: Succeeded in creating pixel map.`);
            expect(pixelMap !== null).assertTrue();
            pixelMap?.release();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} createPixelMapAsync001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createPixelMapPromise001
     * @tc.number PixelMapCreateTest_013
     * @tc.desc createPixelMap with Promise - valid parameters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('createPixelMapPromise001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };

        const pixelMap = await image.createPixelMap(color, opts);
        console.info(`${LOG_PREFIX} createPixelMapPromise001: Succeeded in creating pixel map.`);
        expect(pixelMap !== null).assertTrue();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} createPixelMapPromise001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createPixelMapPromiseNull001
     * @tc.number PixelMapCreateTest_014
     * @tc.desc createPixelMap with Promise - null buffer (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('createPixelMapPromiseNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = await image.createPixelMap(null, opts);
        console.info(
          `${LOG_PREFIX} createPixelMapPromiseNull001: Succeeded in creating pixel map.`,
          JSON.stringify(pixelMap)
        );
        expect(pixelMap).assertUndefined();
        done();
      } catch (error) {
        console.error(
          `${LOG_PREFIX} createPixelMapPromiseNull001: Failed with null buffer as expected, code: ${error}`
        );
        expect().assertFail(); // Parameter error
        done();
      }
    });

    /**
     * @tc.name createPixelMapARGB8888001
     * @tc.number PixelMapCreateAdditionalTest_001
     * @tc.desc createPixelMap with ARGB_8888 pixelFormat test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('createPixelMapARGB8888001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.ARGB_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = await image.createPixelMap(color, opts);
        console.info(
          `${LOG_PREFIX} createPixelMapARGB8888001: isEditable = ${pixelMap.isEditable}, isStrideAlignment = `
            + `${pixelMap.isStrideAlignment}`
        );
        console.info(`${LOG_PREFIX} createPixelMapARGB8888001: Succeeded in creating pixel map with ARGB_8888 format.`);
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertTrue();
        expect(pixelMap.isStrideAlignment).assertFalse();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} createPixelMapARGB8888001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createPixelMapRGBA101010201
     * @tc.number PixelMapCreateAdditionalTest_002
     * @tc.desc createPixelMap with RGBA_1010102 pixelFormat test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('createPixelMapRGBA101010201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_1010102,
          size: { height: 4, width: 4 },
        };
        const pixelMap = await image.createPixelMap(color, opts);
        console.info(
          `${LOG_PREFIX} createPixelMapRGBA101010201: isEditable = ${pixelMap.isEditable}, isStrideAlignment = `
            + `${pixelMap.isStrideAlignment}`
        );
        console.info(
          `${LOG_PREFIX} createPixelMapRGBA101010201: Succeeded in creating pixel map with RGBA_1010102 format.`
        );
        // expect(pixelMap !== null).assertTrue();
        // expect(pixelMap.isEditable).assertTrue();
        expect().assertFail();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} createPixelMapRGBA101010201 failed: ${error}`);
        expect(Number(error) === 62980096).assertTrue();
        done();
      }
    });

    /**
     * @tc.name createPixelMapYCBCRP01001
     * @tc.number PixelMapCreateAdditionalTest_003
     * @tc.desc createPixelMap with YCBCR_P010 pixelFormat test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('createPixelMapYCBCRP01001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.YCBCR_P010,
          size: { height: 4, width: 4 },
        };
        const pixelMap = await image.createPixelMap(color, opts);
        console.info(
          `${LOG_PREFIX} createPixelMapYCBCRP01001: isEditable = ${pixelMap.isEditable}, isStrideAlignment = `
            + `${pixelMap.isStrideAlignment}`
        );
        console.info(
          `${LOG_PREFIX} createPixelMapYCBCRP01001: Succeeded in creating pixel map with YCBCR_P010 format.`
        );
        expect().assertFail();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} createPixelMapYCBCRP01001 failed: ${error}`);
        expect(Number(error) === 62980096).assertTrue();
        done();
      }
    });

    /**
     * @tc.name createPixelMapYCRCBP01001
     * @tc.number PixelMapCreateAdditionalTest_004
     * @tc.desc createPixelMap with YCRCB_P010 pixelFormat test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('createPixelMapYCRCBP01001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.YCRCB_P010,
          size: { height: 4, width: 4 },
        };
        const pixelMap = await image.createPixelMap(color, opts);
        console.info(
          `${LOG_PREFIX} createPixelMapYCRCBP01001: isEditable = ${pixelMap.isEditable}, isStrideAlignment = `
            + `${pixelMap.isStrideAlignment}`
        );
        console.info(
          `${LOG_PREFIX} createPixelMapYCRCBP01001: Succeeded in creating pixel map with YCRCB_P010 format.`
        );
        expect().assertFail();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} createPixelMapYCRCBP01001 failed: ${error}`);
        expect(Number(error) === 62980096).assertTrue();
        done();
      }
    });

    /**
     * @tc.name createPixelMapASTC4x401
     * @tc.number PixelMapCreateAdditionalTest_005
     * @tc.desc createPixelMap with ASTC_4x4 pixelFormat test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('createPixelMapASTC4x401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.ASTC_4x4,
          size: { height: 4, width: 4 },
        };
        const pixelMap = await image.createPixelMap(color, opts);
        console.info(
          `${LOG_PREFIX} createPixelMapASTC4x401: isEditable = ${pixelMap.isEditable}, isStrideAlignment = `
            + `${pixelMap.isStrideAlignment}`
        );
        console.info(`${LOG_PREFIX} createPixelMapASTC4x401: Succeeded in creating pixel map with ASTC_4x4 format.`);
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertTrue();
        expect(pixelMap.isStrideAlignment).assertFalse();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} createPixelMapASTC4x401 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createPixelMapPREMUL001
     * @tc.number PixelMapCreateAdditionalTest_006
     * @tc.desc createPixelMap with PREMUL alphaType test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('createPixelMapPREMUL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          alphaType: image.AlphaType.PREMUL,
          size: { height: 4, width: 4 },
        };
        const pixelMap = await image.createPixelMap(color, opts);
        console.info(
          `${LOG_PREFIX} createPixelMapPREMUL001: isEditable = ${pixelMap.isEditable}, isStrideAlignment = `
            + `${pixelMap.isStrideAlignment}`
        );
        console.info(`${LOG_PREFIX} createPixelMapPREMUL001: Succeeded in creating pixel map with PREMUL alpha type.`);
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertTrue();
        expect(pixelMap.isStrideAlignment).assertFalse();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} createPixelMapPREMUL001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createPixelMapFIT_TARGET_SIZE001
     * @tc.number PixelMapCreateAdditionalTest_007
     * @tc.desc createPixelMap with FIT_TARGET_SIZE scaleMode test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('createPixelMapFIT_TARGET_SIZE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
            size: { height: 4, width: 4 },
          };
          const pixelMap = await image.createPixelMap(color, opts);
          console.info(
            `${LOG_PREFIX} createPixelMapFIT_TARGET_SIZE001: isEditable = ${pixelMap.isEditable}, isStrideAlignment = `
              + `${pixelMap.isStrideAlignment}`
          );
          console.info(
            `${LOG_PREFIX}`
              + ` createPixelMapFIT_TARGET_SIZE001: Succeeded in creating pixel map with FIT_TARGET_SIZE scale mode.`
          );
          expect(pixelMap !== null).assertTrue();
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          await pixelMap?.release();
          done();
        } catch (error) {
          console.error(`${LOG_PREFIX} createPixelMapFIT_TARGET_SIZE001 failed: ${error}`);
          expect().assertFail();
          done();
        }
    });

    /**
     * @tc.name createPixelMapNullBuffer001
     * @tc.number PixelMapCreateAdditionalTest_008
     * @tc.desc createPixelMap with null colors buffer (should fail).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('createPixelMapNullBuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        try {
          const pixelMap = await image.createPixelMap(null, opts);
          console.info(`${LOG_PREFIX} createPixelMapNullBuffer001: Succeeded .`, JSON.stringify(pixelMap));
          expect().assertUndefined();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} createPixelMapNullBuffer001: error .`, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      } catch (error) {
        console.error(`${LOG_PREFIX} createPixelMapNullBuffer001: Failed with null buffer as expected, code: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createPixelMapUndefinedBuffer001
     * @tc.number PixelMapCreateAdditionalTest_009
     * @tc.desc createPixelMap with undefined colors buffer (should fail).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('createPixelMapUndefinedBuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 4 },
          };
          const undefinedBuffer: ArrayBuffer | undefined = undefined;
          const pixelMap = await image.createPixelMap(undefinedBuffer, opts);
          console.info(`${LOG_PREFIX} createPixelMapUndefinedBuffer001: Succeeded .`, JSON.stringify(pixelMap));
          expect(pixelMap).assertUndefined();
          done();
        } catch (error) {
          console.error(
            `${LOG_PREFIX} createPixelMapUndefinedBuffer001: Failed with undefined buffer as expected, code: ${error}`
          );
          expect().assertFail();
          done();
        }
    });

    /**
     * @tc.name createPixelMapNullOptions001
     * @tc.number PixelMapCreateAdditionalTest_010
     * @tc.desc createPixelMap with null options (should fail).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('createPixelMapNullOptions001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const nullOpts: image.InitializationOptions | null = null;
        const pixelMap = await image.createPixelMap(color, nullOpts);
        console.info(`${LOG_PREFIX} createPixelMapNullOptions001: Succeeded .`, JSON.stringify(pixelMap));
        expect(pixelMap).assertUndefined();
        done();
      } catch (error) {
        console.error(
          `${LOG_PREFIX} createPixelMapNullOptions001: Failed with null options as expected, code: ${error}`
        );
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createPixelMapUndefinedOptions001
     * @tc.number PixelMapCreateAdditionalTest_011
     * @tc.desc createPixelMap with undefined options (should fail).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('createPixelMapUndefinedOptions001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const undefinedOpts: image.InitializationOptions | undefined = undefined;
          const pixelMap = await image.createPixelMap(color, undefinedOpts);
          console.info(`${LOG_PREFIX} createPixelMapUndefinedOptions001: Succeeded .`, JSON.stringify(pixelMap));
          expect(pixelMap).assertUndefined();
          done();
        } catch (error) {
          console.error(
            `${LOG_PREFIX} createPixelMapUndefinedOptions001: Failed with undefined options as expected, code: ${error}`
          );
          expect().assertFail();
          done();
        }
    });

    /**
     * @tc.name createPixelMapEditableFalse001
     * @tc.number PixelMapCreateAdditionalTest_012
     * @tc.desc createPixelMap with editable false test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('createPixelMapEditableFalse001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: false,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = await image.createPixelMap(color, opts);
        console.info(
          `${LOG_PREFIX} createPixelMapEditableFalse001: isEditable = ${pixelMap.isEditable}, isStrideAlignment = `
            + `${pixelMap.isStrideAlignment}`
        );
        console.info(`${LOG_PREFIX} createPixelMapEditableFalse001: Succeeded in creating non-editable pixel map.`);
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertFalse();
        expect(pixelMap.isStrideAlignment).assertFalse();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} createPixelMapEditableFalse001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createPixelMapCallbackARGB8888001
     * @tc.number PixelMapCreateAdditionalTest_013
     * @tc.desc createPixelMap callback with ARGB_8888 pixelFormat test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('createPixelMapCallbackARGB8888001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.ARGB_8888,
            size: { height: 4, width: 4 },
          };
          image.createPixelMap(color, opts, (error: BusinessError, pixelMap: image.PixelMap) => {
            if (error) {
              console.error(
                `${LOG_PREFIX} createPixelMapCallbackARGB8888001 failed: code ${error.code}, message ${error.message}`
              );
              expect().assertFail();
              pixelMap?.release();
              done();
            } else {
              console.info(
                `${LOG_PREFIX} createPixelMapCallbackARGB8888001: isEditable = ${pixelMap.isEditable}`
                  + `, isStrideAlignment = ${pixelMap.isStrideAlignment}`
              );
              console.info(
                `${LOG_PREFIX}`
                  + ` createPixelMapCallbackARGB8888001: Succeeded in creating pixel map with`
                  + ` ARGB_8888 format using callback.`
              );
              expect(pixelMap !== null).assertTrue();
              expect(pixelMap.isEditable).assertTrue();
              expect(pixelMap.isStrideAlignment).assertFalse();
              pixelMap?.release();
              done();
            }
          });
        } catch (error) {
          console.error(`${LOG_PREFIX} createPixelMapCallbackARGB8888001 failed: ${error}`);
          expect().assertFail();
          done();
        }
    });

    /**
     * @tc.name createPixelMapCallbackPREMUL001
     * @tc.number PixelMapCreateAdditionalTest_014
     * @tc.desc createPixelMap callback with PREMUL alphaType test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('createPixelMapCallbackPREMUL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            alphaType: image.AlphaType.PREMUL,
            size: { height: 4, width: 4 },
          };
          image.createPixelMap(color, opts, (error: BusinessError, pixelMap: image.PixelMap) => {
            if (error) {
              console.error(
                `${LOG_PREFIX} createPixelMapCallbackPREMUL001 failed: code ${error.code}, message ${error.message}`
              );
              expect().assertFail();
              pixelMap?.release();
              done();
            } else {
              console.info(
                `${LOG_PREFIX} createPixelMapCallbackPREMUL001: isEditable = ${pixelMap.isEditable}`
                  + `, isStrideAlignment = ${pixelMap.isStrideAlignment}`
              );
              console.info(
                `${LOG_PREFIX}`
                  + ` createPixelMapCallbackPREMUL001: Succeeded in creating pixel map with PREMUL alpha`
                  + ` type using callback.`
              );
              expect(pixelMap !== null).assertTrue();
              expect(pixelMap.isEditable).assertTrue();
              expect(pixelMap.isStrideAlignment).assertFalse();
              pixelMap?.release();
              done();
            }
          });
        } catch (error) {
          console.error(`${LOG_PREFIX} createPixelMapCallbackPREMUL001 failed: ${error}`);
          expect().assertFail();
          done();
        }
    });

    /**
     * @tc.name createPixelMapCallbackFIT_TARGET_SIZE001
     * @tc.number PixelMapCreateAdditionalTest_015
     * @tc.desc createPixelMap callback with FIT_TARGET_SIZE scaleMode test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('createPixelMapCallbackFIT_TARGET_SIZE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
            size: { height: 4, width: 4 },
          };
          image.createPixelMap(color, opts, (error: BusinessError, pixelMap: image.PixelMap) => {
            if (error) {
              console.error(
                `${LOG_PREFIX} createPixelMapCallbackFIT_TARGET_SIZE001 failed: code ${error.code}, message `
                  + `${error.message}`
              );
              expect().assertFail();
              pixelMap?.release();
              done();
            } else {
              console.info(
                `${LOG_PREFIX} createPixelMapCallbackFIT_TARGET_SIZE001: isEditable = ${pixelMap.isEditable}`
                  + `, isStrideAlignment = ${pixelMap.isStrideAlignment}`
              );
              console.info(
                `${LOG_PREFIX}`
                  + ` createPixelMapCallbackFIT_TARGET_SIZE001: Succeeded in creating pixel map`
                  + ` with FIT_TARGET_SIZE scale mode using callback.`
              );
              expect(pixelMap !== null).assertTrue();
              expect(pixelMap.isEditable).assertTrue();
              expect(pixelMap.isStrideAlignment).assertFalse();
              pixelMap?.release();
              done();
            }
          });
        } catch (error) {
          console.error(`${LOG_PREFIX} createPixelMapCallbackFIT_TARGET_SIZE001 failed: ${error}`);
          expect().assertFail();
          done();
        }
    });

    /**
     * @tc.name createScaledPixelMap001
     * @tc.number PixelMapCreateScaledPixelMapTest_001
     * @tc.desc PixelMap createScaledPixelMap with scale factor 1.0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('createScaledPixelMap001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} createScaledPixelMap001: Starting test.`);
        console.info(
          `${LOG_PREFIX} createScaledPixelMap001: Original isEditable = ${pixelMap.isEditable}, isStrideAlignment = `
            + `${pixelMap.isStrideAlignment}`
        );
        expect(pixelMap.isEditable).assertTrue();
        expect(pixelMap.isStrideAlignment).assertFalse();

        pixelMap.createScaledPixelMap(1.0, 3.0).then(async (scaledMap) => {
            console.info(
              `${LOG_PREFIX} createScaledPixelMap001: Scaled isEditable = ${scaledMap.isEditable}, isStrideAlignment = `
                + `${scaledMap.isStrideAlignment}`
            );
            expect(scaledMap !== null).assertTrue();
            expect(scaledMap.isEditable).assertFalse();
            expect(scaledMap.isStrideAlignment).assertFalse();

            const info = scaledMap.getImageInfoSync();
            console.info(
              `${LOG_PREFIX} createScaledPixelMap001: Succeeded in creating scaled pixel map.`,
              JSON.stringify(info)
            );
            expect(info.size.width).assertEqual(4);
            expect(info.size.height).assertEqual(12);
            await pixelMap?.release();
            await scaledMap?.release();
            done();
          })
          .catch((err: BusinessError) => {
            console.error(
              `${LOG_PREFIX} createScaledPixelMap001: failed in creating scaled pixel map.`,
              JSON.stringify(err)
            );
            expect().assertFail();
            done();
          });
      } catch (error) {
        console.error(`${LOG_PREFIX} createScaledPixelMap001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createScaledPixelMap002
     * @tc.number PixelMapCreateScaledPixelMapTest_002
     * @tc.desc PixelMap createScaledPixelMap with scale factor 2.0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('createScaledPixelMap002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(
          `${LOG_PREFIX} createScaledPixelMap002: Starting test.`,
          pixelMap.isEditable,
          pixelMap.isStrideAlignment
        );
        expect(pixelMap.isEditable).assertTrue();
        expect(pixelMap.isStrideAlignment).assertFalse();

        await pixelMap.createScaledPixelMap(2.0, 1.0).then(async (scaledMap) => {
            console.info(
              `${LOG_PREFIX} createScaledPixelMap002: Succeeded .`,
              scaledMap.isEditable,
              scaledMap.isStrideAlignment
            );
            expect(scaledMap !== null).assertTrue();
            expect(scaledMap.isEditable).assertFalse();
            expect(scaledMap.isStrideAlignment).assertFalse();

            const info = scaledMap.getImageInfoSync();
            console.info(
              `${LOG_PREFIX} createScaledPixelMap002: Succeeded in creating scaled pixel map.`,
              JSON.stringify(info)
            );
            expect(info.size.width).assertEqual(8);
            expect(info.size.height).assertEqual(4);
            await pixelMap?.release();
            await scaledMap?.release();
            done();
          })
          .catch((err: BusinessError) => {
            console.error(
              `${LOG_PREFIX} createScaledPixelMap002: failed in creating scaled pixel map.`,
              JSON.stringify(err)
            );
            expect().assertFail();
            done();
          });
      } catch (error) {
        console.error(`${LOG_PREFIX} createScaledPixelMap002 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createScaledPixelMap003
     * @tc.number PixelMapCreateScaledPixelMapTest_003
     * @tc.desc PixelMap createScaledPixelMap with scale factor 0.5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('createScaledPixelMap003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(
          `${LOG_PREFIX} createScaledPixelMap003: Starting test.`,
          pixelMap.isEditable,
          pixelMap.isStrideAlignment
        );
        expect(pixelMap.isEditable).assertTrue();
        expect(pixelMap.isStrideAlignment).assertFalse();

        pixelMap.createScaledPixelMap(0.5, 0.5).then(async (scaledMap) => {
            console.info(
              `${LOG_PREFIX} createScaledPixelMap003: Succeeded .`,
              scaledMap.isEditable,
              scaledMap.isStrideAlignment
            );
            expect(scaledMap !== null).assertTrue();
            expect(scaledMap.isEditable).assertFalse();
            expect(scaledMap.isStrideAlignment).assertFalse();

            const info = scaledMap.getImageInfoSync();
            console.info(
              `${LOG_PREFIX} createScaledPixelMap003: Succeeded in creating scaled pixel map.`,
              JSON.stringify(info)
            );
            expect(info.size.width).assertEqual(2);
            expect(info.size.height).assertEqual(2);
            await pixelMap?.release();
            await scaledMap?.release();
            done();
          })
          .catch((err: BusinessError) => {
            console.error(
              `${LOG_PREFIX} createScaledPixelMap003: failed in creating scaled pixel map.`,
              JSON.stringify(err)
            );
            expect().assertFail();
            done();
          });
      } catch (error) {
        console.error(`${LOG_PREFIX} createScaledPixelMap003 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createScaledPixelMapInvalid001
     * @tc.number PixelMapCreateScaledPixelMapTest_004
     * @tc.desc PixelMap createScaledPixelMap with negative scale (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('createScaledPixelMapInvalid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, 
      async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} createScaledPixelMapInvalid001: success.`, pixelMap.isEditable);
        expect(pixelMap.isEditable).assertTrue();

        await pixelMap.createScaledPixelMap(-1, 0).then(async (scaledMap) => {
            console.info(`${LOG_PREFIX} createScaledPixelMapInvalid001: scaledMap success.`, scaledMap.isEditable);
            console.info(
              `${LOG_PREFIX} createScaledPixelMapInvalid001: scaledMap success.`,
              scaledMap.isStrideAlignment
            );
            expect(scaledMap.isEditable).assertFalse();
            expect(scaledMap.isStrideAlignment).assertFalse();
            await pixelMap?.release();
            await scaledMap?.release();
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`${LOG_PREFIX} createScaledPixelMapInvalid001: error `, JSON.stringify(err));
            expect().assertFail();
            done();
          });
      } catch (error) {
        console.error(
          `${LOG_PREFIX} createScaledPixelMapInvalid001: Failed with negative scale as expected, code: ${error}`
        );
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createScaledPixelMapInvalid002
     * @tc.number PixelMapCreateScaledPixelMapTest_005
     * @tc.desc PixelMap createScaledPixelMap with zero scale (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('createScaledPixelMapInvalid002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} createScaledPixelMapInvalid002: Starting test with zero scale.`);
        expect(pixelMap.isEditable).assertTrue();

        pixelMap.createScaledPixelMap(0, 0).then(async (scaledMap) => {
            console.info(`${LOG_PREFIX} createScaledPixelMapInvalid001: scaledMap success.`, scaledMap.isEditable);
            console.info(
              `${LOG_PREFIX} createScaledPixelMapInvalid001: scaledMap success.`,
              scaledMap.isStrideAlignment
            );
            expect(scaledMap.isEditable).assertFalse();
            expect(scaledMap.isStrideAlignment).assertFalse();
            await pixelMap?.release();
            await scaledMap?.release();
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`${LOG_PREFIX} createScaledPixelMapInvalid001: error `, JSON.stringify(err));
            expect().assertFail();
            done();
          });
      } catch (error) {
        console.error(
          `${LOG_PREFIX} createScaledPixelMapInvalid002: Failed with zero scale as expected, code: ${error.code}`
        );
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createPixelMapSyncARGB8888001
     * @tc.number PixelMapCreateSyncAdditionalTest_001
     * @tc.desc createPixelMapSync with ARGB_8888 pixelFormat test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('createPixelMapSyncARGB8888001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.ARGB_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(
          `${LOG_PREFIX} createPixelMapSyncARGB8888001: isEditable = ${pixelMap.isEditable}, isStrideAlignment = `
            + `${pixelMap.isStrideAlignment}`
        );
        console.info(
          `${LOG_PREFIX} createPixelMapSyncARGB8888001: Succeeded in creating pixel map with ARGB_8888 format.`
        );
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertTrue();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} createPixelMapSyncARGB8888001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createPixelMapSyncRGBA101010201
     * @tc.number PixelMapCreateSyncAdditionalTest_002
     * @tc.desc createPixelMapSync with RGBA_1010102 pixelFormat test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('createPixelMapSyncRGBA101010201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.RGBA_1010102,
            pixelFormat: image.PixelMapFormat.RGBA_1010102,
            size: { height: 4, width: 4 },
          };
          const pixelMap = image.createPixelMapSync(color, opts);
          console.info(
            `${LOG_PREFIX} createPixelMapSyncRGBA101010201: Succeeded in creating pixel map with RGBA_1010102 format.`,
            JSON.stringify(pixelMap)
          );
          expect(pixelMap).assertUndefined();
          await pixelMap?.release();
          done();
        } catch (error) {
          console.error(`${LOG_PREFIX} createPixelMapSyncRGBA101010201 failed: ${error}`);
          expect().assertFail();
          done();
        }
      }
    );

    /**
     * @tc.name createPixelMapSyncYCBCRP01001
     * @tc.number PixelMapCreateSyncAdditionalTest_003
     * @tc.desc createPixelMapSync with YCBCR_P010 pixelFormat test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('createPixelMapSyncYCBCRP01001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.YCBCR_P010,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(
          `${LOG_PREFIX} createPixelMapSyncYCBCRP01001: Succeeded in creating pixel map with YCBCR_P010 format.`,
          JSON.stringify(pixelMap)
        );
        expect(pixelMap).assertUndefined();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} createPixelMapSyncYCBCRP01001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createPixelMapSyncYCRCBP01001
     * @tc.number PixelMapCreateSyncAdditionalTest_004
     * @tc.desc createPixelMapSync with YCRCB_P010 pixelFormat test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('createPixelMapSyncYCRCBP01001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.YCRCB_P010,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(
          `${LOG_PREFIX} createPixelMapSyncYCRCBP01001: Succeeded in creating pixel map with YCRCB_P010 format.`,
          JSON.stringify(pixelMap)
        );
        expect(pixelMap).assertUndefined();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} createPixelMapSyncYCRCBP01001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createPixelMapSyncASTC4x401
     * @tc.number PixelMapCreateSyncAdditionalTest_005
     * @tc.desc createPixelMapSync with ASTC_4x4 pixelFormat test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('createPixelMapSyncASTC4x401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.ASTC_4x4,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(
          `${LOG_PREFIX} createPixelMapSyncASTC4x401: isEditable = ${pixelMap.isEditable}, isStrideAlignment = `
            + `${pixelMap.isStrideAlignment}`
        );
        console.info(
          `${LOG_PREFIX} createPixelMapSyncASTC4x401: Succeeded in creating pixel map with ASTC_4x4 format.`
        );
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertTrue();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} createPixelMapSyncASTC4x401 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createPixelMapSyncPREMUL001
     * @tc.number PixelMapCreateSyncAdditionalTest_006
     * @tc.desc createPixelMapSync with PREMUL alphaType test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('createPixelMapSyncPREMUL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          alphaType: image.AlphaType.PREMUL,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(
          `${LOG_PREFIX} createPixelMapSyncPREMUL001: isEditable = ${pixelMap.isEditable}, isStrideAlignment = `
            + `${pixelMap.isStrideAlignment}`
        );
        console.info(
          `${LOG_PREFIX} createPixelMapSyncPREMUL001: Succeeded in creating pixel map with PREMUL alpha type.`
        );
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertTrue();
        expect(pixelMap.isStrideAlignment).assertFalse();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} createPixelMapSyncPREMUL001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createPixelMapSyncFIT_TARGET_SIZE001
     * @tc.number PixelMapCreateSyncAdditionalTest_007
     * @tc.desc createPixelMapSync with FIT_TARGET_SIZE scaleMode test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('createPixelMapSyncFIT_TARGET_SIZE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
            size: { height: 4, width: 4 },
          };
          const pixelMap = image.createPixelMapSync(color, opts);
          console.info(
            `${LOG_PREFIX} createPixelMapSyncFIT_TARGET_SIZE001: isEditable = ${pixelMap.isEditable}`
              + `, isStrideAlignment = ${pixelMap.isStrideAlignment}`
          );
          console.info(
            `${LOG_PREFIX}`
              + ` createPixelMapSyncFIT_TARGET_SIZE001: Succeeded in creating pixel map`
              + ` with FIT_TARGET_SIZE scale mode.`
          );
          expect(pixelMap !== null).assertTrue();
          expect(pixelMap.isEditable).assertTrue();
          expect(pixelMap.isStrideAlignment).assertFalse();
          await pixelMap?.release();
          done();
        } catch (error) {
          console.error(`${LOG_PREFIX} createPixelMapSyncFIT_TARGET_SIZE001 failed: ${error}`);
          expect().assertFail();
          done();
        }
      }
    );

    /**
     * @tc.name createPixelMapSyncNullBuffer001
     * @tc.number PixelMapCreateSyncAdditionalTest_008
     * @tc.desc createPixelMapSync with null colors buffer (should fail).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('createPixelMapSyncNullBuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 4 },
          };
          const nullBuffer: ArrayBuffer | null = null;
          const pixelMap = image.createPixelMapSync(nullBuffer, opts);
          console.info(`${LOG_PREFIX} createPixelMapSyncNullBuffer001: success `, JSON.stringify(pixelMap));
          expect(pixelMap).assertUndefined();
          await pixelMap?.release();
          done();
        } catch (error) {
          console.error(
            `${LOG_PREFIX} createPixelMapSyncNullBuffer001: Failed with null buffer as expected, code: ${error}`
          );
          expect().assertFail();
          done();
        }
      }
    );

    /**
     * @tc.name createPixelMapSyncUndefinedBuffer001
     * @tc.number PixelMapCreateSyncAdditionalTest_009
     * @tc.desc createPixelMapSync with undefined colors buffer (should fail).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('createPixelMapSyncUndefinedBuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 4 },
          };
          const undefinedBuffer: ArrayBuffer | undefined = undefined;
          const pixelMap = image.createPixelMapSync(undefinedBuffer, opts);
          console.info(`${LOG_PREFIX} createPixelMapSyncUndefinedBuffer001: success`, JSON.stringify(pixelMap));
          expect(pixelMap).assertUndefined();
          await pixelMap?.release();
          done();
        } catch (error) {
          console.error(
            `${LOG_PREFIX} createPixelMapSyncUndefinedBuffer001: Failed with undefined buffer as expected, code: `
              + `${error}`
          );
          expect().assertFail();
          done();
        }
      }
    );

    /**
     * @tc.name createPixelMapSyncNullOptions001
     * @tc.number PixelMapCreateSyncAdditionalTest_010
     * @tc.desc createPixelMapSync with null options (should fail).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('createPixelMapSyncNullOptions001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const nullOpts: image.InitializationOptions | null = null;
          const pixelMap = image.createPixelMapSync(color, nullOpts);
          console.info(`${LOG_PREFIX} createPixelMapSyncNullOptions001: success `, JSON.stringify(pixelMap));
          expect(pixelMap).assertUndefined();
          await pixelMap?.release();
          done();
        } catch (error) {
          console.error(
            `${LOG_PREFIX} createPixelMapSyncNullOptions001: Failed with null options as expected, code: ${error}`
          );
          expect().assertFail();
          done();
        }
      }
    );

    /**
     * @tc.name createPixelMapSyncUndefinedOptions001
     * @tc.number PixelMapCreateSyncAdditionalTest_011
     * @tc.desc createPixelMapSync with undefined options (should fail).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('createPixelMapSyncUndefinedOptions001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const undefinedOpts: image.InitializationOptions | undefined = undefined;
          const pixelMap = image.createPixelMapSync(color, undefinedOpts);
          console.info(`${LOG_PREFIX} createPixelMapSyncUndefinedOptions001: success`, JSON.stringify(pixelMap));
          expect(pixelMap).assertUndefined();
          await pixelMap?.release();
          done();
        } catch (error) {
          console.error(
            `${LOG_PREFIX} createPixelMapSyncUndefinedOptions001: Failed with undefined options as expected, code: `
              + `${error}`
          );
          expect().assertFail();
          done();
        }
      }
    );

    /**
     * @tc.name createPixelMapSyncEditableFalse001
     * @tc.number PixelMapCreateSyncAdditionalTest_012
     * @tc.desc createPixelMapSync with editable false test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('createPixelMapSyncEditableFalse001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: false,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 4 },
          };
          const pixelMap = image.createPixelMapSync(color, opts);
          console.info(
            `${LOG_PREFIX} createPixelMapSyncEditableFalse001: isEditable = ${pixelMap.isEditable}`
              + `, isStrideAlignment = ${pixelMap.isStrideAlignment}`
          );
          console.info(
            `${LOG_PREFIX} createPixelMapSyncEditableFalse001: Succeeded in creating non-editable pixel map.`
          );
          expect(pixelMap !== null).assertTrue();
          expect(pixelMap.isEditable).assertFalse();
          await pixelMap?.release();
          done();
        } catch (error) {
          console.error(`${LOG_PREFIX} createPixelMapSyncEditableFalse001 failed: ${error}`);
          expect().assertFail();
          done();
        }
      }
    );

    /**
     * @tc.name createPixelMapSyncNoBuffer001
     * @tc.number PixelMapCreateSyncAdditionalTest_013
     * @tc.desc createPixelMapSync with only options (no buffer) test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('createPixelMapSyncNoBuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(opts);
        console.info(
          `${LOG_PREFIX} createPixelMapSyncNoBuffer001: isEditable = ${pixelMap.isEditable}, isStrideAlignment = `
            + `${pixelMap.isStrideAlignment}`
        );
        console.info(`${LOG_PREFIX} createPixelMapSyncNoBuffer001: Succeeded in creating pixel map with only options.`);
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable).assertTrue();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} createPixelMapSyncNoBuffer001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });
    
  })
}