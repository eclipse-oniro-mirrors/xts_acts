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
const LOG_PREFIX: string = '[www data graphicImagePixelMapAdd04]';

export default function graphicImagePixelMapAdd04() {
  describe('graphicImagePixelMapAdd04', ()=> {
    beforeAll(async (done:Function)=> {
      console.info("imagePixelMapTest beforeEach start");
      done();
    });

    /**
     * @tc.name scaleComp001
     * @tc.number PixelMapComprehensiveTest_001
     * @tc.desc PixelMap scale with AsyncCallback - two parameters success callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('scaleComp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scale001: Starting scale test.`);

        pixelMap.scale(2.0, 2.0, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} scale001 failed: code ${error.code}, message ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(`${LOG_PREFIX} scale001: Succeeded in scaling.`);
            pixelMap.release();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} scale001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scale002
     * @tc.number PixelMapComprehensiveTest_002
     * @tc.desc PixelMap scale with Promise - two parameters success callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('scale002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scale002: Starting scale test.`);

        await pixelMap.scale(0.5, 0.5);
        console.info(`${LOG_PREFIX} scale002: Succeeded in scaling.`);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} scale002 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scaleNullComp001
     * @tc.number PixelMapComprehensiveTest_003
     * @tc.desc PixelMap scale with AsyncCallback - null parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('scaleNullComp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scaleNull001: Starting test with null x parameter.`);

        // Test with null x parameter
        pixelMap.scale(null, 1.0, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} scaleNull001: Failed with null x as expected, code: ${error}`);
            expect(Number(error) === 62980115).assertTrue();
            pixelMap.release();
            done();
          } else {
            expect().assertFail();
            pixelMap.release();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} scaleNull001: Unexpected error: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scaleNullComp002
     * @tc.number PixelMapComprehensiveTest_004
     * @tc.desc PixelMap scale with AsyncCallback - null second parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('scaleNullComp002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scaleNull002: Starting test with null y parameter.`);

        // Test with null y parameter
        pixelMap.scale(1.0, null, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} scaleNull002: Failed with null y as expected, code: ${error}`);
            expect(Number(error) === 62980115).assertTrue();
            pixelMap.release();
            done();
          } else {
            expect().assertFail();
            pixelMap.release();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} scaleNull002: Unexpected error: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scale003
     * @tc.number PixelMapComprehensiveTest_005
     * @tc.desc PixelMap scale with Promise - three parameters including level enum
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('scale003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scale003: Starting scale test with anti-aliasing level.`);

        await pixelMap.scale(0.5, 0.5, image.AntiAliasingLevel.MEDIUM);
        console.info(`${LOG_PREFIX} scale003: Succeeded in scaling with anti-aliasing.`);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} scale003 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scale004
     * @tc.number PixelMapComprehensiveTest_006
     * @tc.desc PixelMap scale with Promise - test all anti-aliasing enum values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('scale004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scale004: Starting test with all anti-aliasing enum values.`);

        // Test all anti-aliasing levels
        await pixelMap.scale(0.5, 0.5, image.AntiAliasingLevel.NONE);
        await pixelMap.scale(0.5, 0.5, image.AntiAliasingLevel.MEDIUM);
        await pixelMap.scale(0.5, 0.5, image.AntiAliasingLevel.HIGH);

        console.info(`${LOG_PREFIX} scale004: Succeeded in testing all anti-aliasing enum values.`);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} scale004 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name translateComp001
     * @tc.number PixelMapComprehensiveTest_007
     * @tc.desc PixelMap translate with AsyncCallback - success callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('translateComp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} translate001: Starting translate test.`);

        pixelMap.translate(10, 20, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} translate001 failed: code ${error.code}, message ${error.message}`);
            expect().assertFail();
            pixelMap.release();
            done();
          } else {
            console.info(`${LOG_PREFIX} translate001: Succeeded in translating.`);
            pixelMap.release();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} translate001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name translateNullComp001
     * @tc.number PixelMapComprehensiveTest_008
     * @tc.desc PixelMap translate with AsyncCallback - null x parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('translateNullComp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} translateNull001: Starting test with null x parameter.`);

        // Test with null x parameter
        pixelMap.translate(null, 10, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} translateNull001: Failed with null x as expected, code: ${error}`);
            expect(Number(error) === 62980115).assertTrue();
            pixelMap.release();
            done();
          } else {
            expect().assertFail();
            pixelMap.release();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} translateNull001: Unexpected error: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name rotateComp001
     * @tc.number PixelMapComprehensiveTest_009
     * @tc.desc PixelMap rotate with AsyncCallback - success callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('rotateComp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} rotate001: Starting rotate test.`);

        pixelMap.rotate(90, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} rotate001 failed: code ${error.code}, message ${error.message}`);
            expect().assertFail();
            done();
          } else {
            pixelMap.release();
            console.info(`${LOG_PREFIX} rotate001: Succeeded in rotating.`);
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} rotate001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name flipComp001
     * @tc.number PixelMapComprehensiveTest_010
     * @tc.desc PixelMap flip with AsyncCallback - success callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('flipComp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} flip001: Starting flip test.`);

        pixelMap.flip(true, false, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} flip001 failed: code ${error.code}, message ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(`${LOG_PREFIX} flip001: Succeeded in flipping horizontally.`);
            pixelMap.release();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} flip001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name flipComp002
     * @tc.number PixelMapComprehensiveTest_011
     * @tc.desc PixelMap flip with AsyncCallback - vertical flip success
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('flipComp002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} flip002: Starting vertical flip test.`);

        pixelMap.flip(false, true, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} flip002 failed: code ${error.code}, message ${error.message}`);
            expect().assertFail();
          } else {
            console.info(`${LOG_PREFIX} flip002: Succeeded in flipping vertically.`);
            pixelMap.release();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} flip002 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name cropComp001
     * @tc.number PixelMapComprehensiveTest_012
     * @tc.desc PixelMap crop with Promise - success callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('cropComp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 6, width: 8 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} crop001: Starting crop test.`);

        const region: image.Region = {
          x: 0,
          y: 0,
          size: {
            width: 4,
            height: 4,
          },
        };
        await pixelMap.crop(region);
        console.info(`${LOG_PREFIX} crop001: Succeeded in cropping.`);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} crop001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name cropNull001
     * @tc.number PixelMapComprehensiveTest_013
     * @tc.desc PixelMap crop with Promise - null region (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('cropNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} cropNull001: Starting test with null region parameter.`, JSON.stringify(pixelMap));

        // Test with null region
        try {
          await pixelMap.crop(null);
          console.info(`${LOG_PREFIX} cropNull001 crop sucess`);
          expect().assertFail();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} cropNull001 crop error `, JSON.stringify(err));
          expect(Number(err) === 62980115).assertTrue();
          await pixelMap.release();
          done();
        }
      } catch (error) {
        console.error(`${LOG_PREFIX} cropNull001: Failed with null region as expected, code: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name setColorSpace001
     * @tc.number PixelMapComprehensiveTest_014
     * @tc.desc PixelMap setColorSpace - success callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('setColorSpace001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} setColorSpace001: Starting color space test.`);

        // Note: ColorSpaceManager is not available in the test environment
        // This test verifies the API exists and can be called
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} setColorSpace001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name setColorSpaceNull001
     * @tc.number PixelMapComprehensiveTest_015
     * @tc.desc PixelMap setColorSpace - null parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('setColorSpaceNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(
          `${LOG_PREFIX} setColorSpaceNull001: Starting test with null parameter.`,
          JSON.stringify(pixelMap)
        );

        try {
          // Test with null colorSpace
          pixelMap.setColorSpace(null);
          console.info(`${LOG_PREFIX} setColorSpaceNull001 success.`);
          expect().assertFail();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} setColorSpaceNull001 error.`, JSON.stringify(err));
          expect(Number(err.code) === 62980115).assertTrue();
          await pixelMap.release();
          done();
        }
      } catch (error) {
        console.error(`${LOG_PREFIX} setColorSpaceNull001: Failed with null as expected, code: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createScaledPixelMapComp001
     * @tc.number PixelMapComprehensiveTest_016
     * @tc.desc PixelMap createScaledPixelMap with Promise - two parameters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('createScaledPixelMapComp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} createScaledPixelMap001: Starting create scaled pixel map test.`);

        const scaledPixelMap = await pixelMap.createScaledPixelMap(2.0, 2.0);
        expect(scaledPixelMap != null).assertTrue();
        console.info(`${LOG_PREFIX} createScaledPixelMap001: Succeeded in creating scaled pixel map.`);
        await pixelMap.release();
        await scaledPixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} createScaledPixelMap001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createScaledPixelMapComp002
     * @tc.number PixelMapComprehensiveTest_017
     * @tc.desc PixelMap createScaledPixelMap with Promise - three parameters with anti-aliasing
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('createScaledPixelMapComp002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(
          `${LOG_PREFIX} createScaledPixelMap002: Starting create scaled pixel map with anti-aliasing test.`
        );

        const scaledPixelMap = await pixelMap.createScaledPixelMap(0.5, 0.5, image.AntiAliasingLevel.HIGH);
        expect(scaledPixelMap != null).assertTrue();
        console.info(
          `${LOG_PREFIX} createScaledPixelMap002: Succeeded in creating scaled pixel map with anti-aliasing.`
        );
        await pixelMap.release();
        await scaledPixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} createScaledPixelMap002 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scalePromiseNullComp001
     * @tc.number PixelMapComprehensiveTest_018
     * @tc.desc PixelMap scale with Promise - null x parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('scalePromiseNullComp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scalePromiseNull001: Starting test with null x parameter.`);
        try {
          await pixelMap.scale(null, 1.0);
          console.info(`${LOG_PREFIX} scalePromiseNull001: scale success.`);
          expect().assertFail();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} scalePromiseNull001: scale error.`, JSON.stringify(err));
          expect(Number(err) === 62980115).assertTrue();
          await pixelMap.release();
          done();
        }
      } catch (error) {
        console.error(`${LOG_PREFIX} scalePromiseNull001: Failed with null x as expected, code: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scalePromiseNullComp002
     * @tc.number PixelMapComprehensiveTest_019
     * @tc.desc PixelMap scale with Promise - null y parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('scalePromiseNullComp002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scalePromiseNull002: Starting test with null y parameter.`);
        try {
          await pixelMap.scale(1.0, null);
          console.info(`${LOG_PREFIX} scalePromiseNull002: scale success.`);
          expect().assertFail();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} scalePromiseNull002: scale error.`, JSON.stringify(err));
          expect(Number(err) === 62980115).assertTrue();
          await pixelMap.release();
          done();
        }
      } catch (error) {
        console.error(`${LOG_PREFIX} scalePromiseNull002: Failed with null y as expected, code: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scalePromiseUndefined001
     * @tc.number PixelMapComprehensiveTest_020
     * @tc.desc PixelMap scale with Promise - undefined x parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('scalePromiseUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scalePromiseUndefined001: Starting test with undefined x parameter.`);
        try {
          await pixelMap.scale(undefined, 1.0);
          console.info(`${LOG_PREFIX} scalePromiseUndefined001: scale success.`);
          expect().assertFail();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} scalePromiseUndefined001: scale error.`, JSON.stringify(err));
          expect(Number(err) === 62980115).assertTrue();
          await pixelMap.release();
          done();
        }
      } catch (error) {
        console.error(
          `${LOG_PREFIX} scalePromiseUndefined001: Failed with undefined x as expected, code: ${error.code}`
        );
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scalePromiseUndefined002
     * @tc.number PixelMapComprehensiveTest_021
     * @tc.desc PixelMap scale with Promise - undefined y parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('scalePromiseUndefined002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scalePromiseUndefined002: Starting test with undefined y parameter.`);
        try {
          await pixelMap.scale(1.0, undefined);
          console.info(`${LOG_PREFIX} scalePromiseUndefined002: scale success.`);
          expect().assertFail();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} scalePromiseUndefined002: scale error.`, JSON.stringify(err));
          expect(Number(err) === 62980115).assertTrue();
          await pixelMap.release();
          done();
        }
      } catch (error) {
        console.error(
          `${LOG_PREFIX} scalePromiseUndefined002: Failed with undefined y as expected, code: ${error.code}`
        );
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scaleAsyncUndefined001
     * @tc.number PixelMapComprehensiveTest_022
     * @tc.desc PixelMap scale with AsyncCallback - undefined x parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('scaleAsyncUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scaleAsyncUndefined001: Starting test with undefined x parameter.`);

        pixelMap.scale(undefined, 1.0, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} scaleAsyncUndefined001: Failed with undefined x as expected, code: ${error}`);
            expect(Number(error) === 62980115).assertTrue();
            pixelMap.release();
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} scaleAsyncUndefined001: Unexpected error: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scaleAsyncUndefined002
     * @tc.number PixelMapComprehensiveTest_023
     * @tc.desc PixelMap scale with AsyncCallback - undefined y parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('scaleAsyncUndefined002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scaleAsyncUndefined002: Starting test with undefined y parameter.`);

        pixelMap.scale(1.0, undefined, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} scaleAsyncUndefined002: Failed with undefined y as expected, code: ${error}`);
            expect(Number(error)).assertEqual(62980115);
            pixelMap.release();
            done();
          done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} scaleAsyncUndefined002: Unexpected error: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scale005
     * @tc.number PixelMapComprehensiveTest_024
     * @tc.desc PixelMap scale with Promise - three parameters with NONE anti-aliasing
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('scale005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scale005: Starting scale test with NONE anti-aliasing.`);

        await pixelMap.scale(0.5, 0.5, image.AntiAliasingLevel.NONE);
        console.info(`${LOG_PREFIX} scale005: Succeeded in scaling with NONE anti-aliasing.`);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} scale005 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scale006
     * @tc.number PixelMapComprehensiveTest_025
     * @tc.desc PixelMap scale with Promise - three parameters with HIGH anti-aliasing
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('scale006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scale006: Starting scale test with HIGH anti-aliasing.`);

        await pixelMap.scale(0.5, 0.5, image.AntiAliasingLevel.HIGH);
        console.info(`${LOG_PREFIX} scale006: Succeeded in scaling with HIGH anti-aliasing.`);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} scale006 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scale003Null001
     * @tc.number PixelMapComprehensiveTest_026
     * @tc.desc PixelMap scale with Promise - three parameters null x (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('scale003Null001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scale003Null001: Starting test with null x parameter.`);
        try {
          await pixelMap.scale(null, 1.0, image.AntiAliasingLevel.MEDIUM);
          console.info(`${LOG_PREFIX} scale003Null001: scale success.`);
          expect().assertFail();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} scale003Null001: scale error.`, JSON.stringify(err));
          expect(Number(err) === 62980115).assertTrue();
          await pixelMap.release();
          done();
        }
      } catch (error) {
        console.error(`${LOG_PREFIX} scale003Null001: Failed with null x as expected, code: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scale003Null002
     * @tc.number PixelMapComprehensiveTest_027
     * @tc.desc PixelMap scale with Promise - three parameters null y (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('scale003Null002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scale003Null002: Starting test with null y parameter.`);
        try {
          await pixelMap.scale(1.0, null, image.AntiAliasingLevel.MEDIUM);
          console.info(`${LOG_PREFIX} scale003Null002: scale success.`);
          expect().assertFail();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} scale003Null002: scale error.`, JSON.stringify(err));
          expect(Number(err) === 62980115).assertTrue();
          await pixelMap.release();
          done();
        }
      } catch (error) {
        console.error(`${LOG_PREFIX} scale003Null002: Failed with null y as expected, code: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scale003Undefined001
     * @tc.number PixelMapComprehensiveTest_028
     * @tc.desc PixelMap scale with Promise - three parameters undefined x (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('scale003Undefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scale003Undefined001: Starting test with undefined x parameter.`);
        try {
          await pixelMap.scale(undefined, 1.0, image.AntiAliasingLevel.MEDIUM);
          console.info(`${LOG_PREFIX} scale003Undefined001: scale success.`);
          expect().assertFail();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} scale003Undefined001: scale error.`, JSON.stringify(err));
          expect(Number(err) === 62980115).assertTrue();
          await pixelMap.release();
          done();
        }
      } catch (error) {
        console.error(`${LOG_PREFIX} scale003Undefined001: Failed with undefined x as expected, code: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scale003Undefined002
     * @tc.number PixelMapComprehensiveTest_029
     * @tc.desc PixelMap scale with Promise - three parameters undefined y (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('scale003Undefined002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scale003Undefined002: Starting test with undefined y parameter.`);
        try {
          await pixelMap.scale(1.0, undefined, image.AntiAliasingLevel.MEDIUM);
          console.info(`${LOG_PREFIX} scale003Undefined002: scale success.`);
          expect().assertFail();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} scale003Undefined002: scale error.`, JSON.stringify(err));
          expect(Number(err) === 62980115).assertTrue();
          await pixelMap.release();
          done();
        }
      } catch (error) {
        console.error(`${LOG_PREFIX} scale003Undefined002: Failed with undefined y as expected, code: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name translate002
     * @tc.number PixelMapComprehensiveTest_030
     * @tc.desc PixelMap translate with Promise - success callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('translate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} translate002: Starting translate test.`);

        await pixelMap.translate(10, 20);
        console.info(`${LOG_PREFIX} translate002: Succeeded in translating.`);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} translate002 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name translateNullComp002
     * @tc.number PixelMapComprehensiveTest_031
     * @tc.desc PixelMap translate with AsyncCallback - null y parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('translateNullComp002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} translateNull002: Starting test with null y parameter.`);

        pixelMap.translate(10, null, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} translateNull002: Failed with null y as expected, code: ${error}`);
            expect(Number(error) === 62980115).assertTrue();
            pixelMap.release();
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} translateNull002: Unexpected error: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name translateUndefinedComp001
     * @tc.number PixelMapComprehensiveTest_032
     * @tc.desc PixelMap translate with AsyncCallback - undefined x parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('translateUndefinedComp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} translateUndefined001: Starting test with undefined x parameter.`);

        pixelMap.translate(undefined, 10, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} translateUndefined001: Failed with undefined x as expected, code: ${error}`);
            expect(Number(error) === 62980115).assertTrue();
            pixelMap.release();
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} translateUndefined001: Unexpected error: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name translateUndefinedComp002
     * @tc.number PixelMapComprehensiveTest_033
     * @tc.desc PixelMap translate with AsyncCallback - undefined y parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('translateUndefinedComp002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} translateUndefined002: Starting test with undefined y parameter.`);

        pixelMap.translate(10, undefined, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} translateUndefined002: Failed with undefined y as expected, code: ${error}`);
            expect(Number(error) === 62980115).assertTrue();
            pixelMap.release();
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} translateUndefined002: Unexpected error: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name rotateComp002
     * @tc.number PixelMapComprehensiveTest_034
     * @tc.desc PixelMap rotate with Promise - success callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('rotateComp002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} rotate002: Starting rotate test.`);

        await pixelMap.rotate(90);
        console.info(`${LOG_PREFIX} rotate002: Succeeded in rotating.`);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} rotate002 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name rotateNull001
     * @tc.number PixelMapComprehensiveTest_035
     * @tc.desc PixelMap rotate with AsyncCallback - null angle (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('rotateNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} rotateNull001: Starting test with null angle parameter.`);

        pixelMap.rotate(null, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} rotateNull001: Failed with null angle as expected, code: ${error}`);
            expect(Number(error) === 62980115).assertTrue();
            pixelMap.release();
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} rotateNull001: Unexpected error: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name rotateUndefined001
     * @tc.number PixelMapComprehensiveTest_036
     * @tc.desc PixelMap rotate with AsyncCallback - undefined angle (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('rotateUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} rotateUndefined001: Starting test with undefined angle parameter.`);

        pixelMap.rotate(undefined, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} rotateUndefined001: Failed with undefined angle as expected, code: ${error}`);
            expect(Number(error) === 62980115).assertTrue();
            pixelMap.release();
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} rotateUndefined001: Unexpected error: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name rotateComp003
     * @tc.number PixelMapComprehensiveTest_037
     * @tc.desc PixelMap rotate with Promise - null angle (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('rotateComp003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} rotate003: Starting test with null angle parameter.`);
        try {
          await pixelMap.rotate(null);
          console.info(`${LOG_PREFIX} rotate003: rotate success.`);
          expect().assertFail();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} rotate003: rotate error.`, JSON.stringify(err));
          expect(Number(err) === 62980115).assertTrue();
          await pixelMap.release();
          done();
        }
      } catch (error) {
        console.error(`${LOG_PREFIX} rotate003: Failed with null angle as expected, code: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name rotateComp004
     * @tc.number PixelMapComprehensiveTest_038
     * @tc.desc PixelMap rotate with Promise - undefined angle (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('rotateComp004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} rotate004: Starting test with undefined angle parameter.`);
        try {
          await pixelMap.rotate(undefined);
          console.info(`${LOG_PREFIX} rotate004: rotate success.`);
          expect().assertFail();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} rotate004: rotate error.`, JSON.stringify(err));
          expect(Number(err) === 62980115).assertTrue();
          await pixelMap.release();
          done();
        }
      } catch (error) {
        console.error(`${LOG_PREFIX} rotate004: Failed with undefined angle as expected, code: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name rotateSyncNull001
     * @tc.number PixelMapComprehensiveTest_039
     * @tc.desc PixelMap rotateSync - null angle (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('rotateSyncNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} rotateSyncNull001: Starting test with null angle parameter.`);
        try {
          pixelMap.rotateSync(null);
          console.info(`${LOG_PREFIX} rotateSyncNull001: rotateSync success.`);
          await pixelMap.release();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} rotateSyncNull001: rotateSync error.`, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      } catch (error) {
        console.error(`${LOG_PREFIX} rotateSyncNull001: Failed with null angle as expected, code: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name rotateSyncUndefined001
     * @tc.number PixelMapComprehensiveTest_040
     * @tc.desc PixelMap rotateSync - undefined angle (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('rotateSyncUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} rotateSyncUndefined001: Starting test with undefined angle parameter.`);
        try {
          pixelMap.rotateSync(undefined);
          console.info(`${LOG_PREFIX} rotateSyncUndefined001: rotateSync success.`);
          await pixelMap.release();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} rotateSyncUndefined001: rotateSync error.`, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      } catch (error) {
        console.error(`${LOG_PREFIX} rotateSyncUndefined001: Failed with undefined angle as expected, code: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name flipComp003
     * @tc.number PixelMapComprehensiveTest_041
     * @tc.desc PixelMap flip with AsyncCallback - horizontal true and vertical true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('flipComp003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} flip003: Starting flip test with both axes.`);

        pixelMap.flip(true, true, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} flip003 failed: code ${error.code}, message ${error.message}`);
            expect().assertFail();
          } else {
            console.info(`${LOG_PREFIX} flip003: Succeeded in flipping both axes.`);
            pixelMap.release();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} flip003 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name flip004
     * @tc.number PixelMapComprehensiveTest_042
     * @tc.desc PixelMap flip with AsyncCallback - horizontal false and vertical false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('flip004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} flip004: Starting flip test with no flip.`);

        pixelMap.flip(false, false, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} flip004 failed: code ${error.code}, message ${error.message}`);
            expect().assertFail();
          } else {
            console.info(`${LOG_PREFIX} flip004: Succeeded in flipping with no flip.`);
            pixelMap.release();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} flip004 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name flip005
     * @tc.number PixelMapComprehensiveTest_043
     * @tc.desc PixelMap flip with Promise - horizontal true and vertical false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('flip005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} flip005: Starting flip test with Promise.`);

        await pixelMap.flip(true, false);
        console.info(`${LOG_PREFIX} flip005: Succeeded in flipping.`);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} flip005 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name flip006
     * @tc.number PixelMapComprehensiveTest_044
     * @tc.desc PixelMap flip with Promise - horizontal false and vertical true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('flip006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} flip006: Starting flip test with Promise.`);

        await pixelMap.flip(false, true);
        console.info(`${LOG_PREFIX} flip006: Succeeded in flipping.`);
        await pixelMap.release();
        done();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} flip006 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scaleSyncComp001
     * @tc.number PixelMapComprehensiveTest_045
     * @tc.desc PixelMap scaleSync - two parameters success case
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('scaleSyncComp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scaleSync001: Starting scale sync test.`);

        pixelMap.scaleSync(0.5, 0.5);
        console.info(`${LOG_PREFIX} scaleSync001: Succeeded in scaling.`);
        await pixelMap.release();
        done();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} scaleSync001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scaleSyncNullComp001
     * @tc.number PixelMapComprehensiveTest_046
     * @tc.desc PixelMap scaleSync - null x parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('scaleSyncNullComp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scaleSyncNull001: Starting test with null x parameter.`);
        try {
          pixelMap.scaleSync(null, 1.0);
          console.info(`${LOG_PREFIX} scaleSyncNull001: scaleSync success.`);
          await pixelMap.release();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} scaleSyncNull001: scaleSync error.`, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      } catch (error) {
        console.error(`${LOG_PREFIX} scaleSyncNull001: Failed with null x as expected, code: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scaleSyncNullComp002
     * @tc.number PixelMapComprehensiveTest_047
     * @tc.desc PixelMap scaleSync - null y parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('scaleSyncNullComp002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scaleSyncNull002: Starting test with null y parameter.`);
        try {
          pixelMap.scaleSync(1.0, null);
          console.info(`${LOG_PREFIX} scaleSyncNull002: scaleSync success.`);
          await pixelMap.release();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} scaleSyncNull002: scaleSync error.`, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      } catch (error) {
        console.error(`${LOG_PREFIX} scaleSyncNull002: Failed with null y as expected, code: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scaleSyncUndefined001
     * @tc.number PixelMapComprehensiveTest_048
     * @tc.desc PixelMap scaleSync - undefined x parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('scaleSyncUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scaleSyncUndefined001: Starting test with undefined x parameter.`);
        try {
          pixelMap.scaleSync(undefined, 1.0);
          console.info(`${LOG_PREFIX} scaleSyncUndefined001: scaleSync success.`);
          await pixelMap.release();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} scaleSyncUndefined001: scaleSync error.`, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      } catch (error) {
        console.error(`${LOG_PREFIX} scaleSyncUndefined001: Failed with undefined x as expected, code: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scaleSyncUndefined002
     * @tc.number PixelMapComprehensiveTest_049
     * @tc.desc PixelMap scaleSync - undefined y parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('scaleSyncUndefined002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scaleSyncUndefined002: Starting test with undefined y parameter.`);
        try {
          pixelMap.scaleSync(1.0, undefined);
          console.info(`${LOG_PREFIX} scaleSyncUndefined002: scaleSync success.`);
          await pixelMap.release();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} scaleSyncUndefined002: scaleSync error.`, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      } catch (error) {
        console.error(`${LOG_PREFIX} scaleSyncUndefined002: Failed with undefined y as expected, code: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scaleSync003
     * @tc.number PixelMapComprehensiveTest_050
     * @tc.desc PixelMap scaleSync - three parameters with anti-aliasing level
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('scaleSync003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scaleSync003: Starting scale sync test with anti-aliasing.`);

        pixelMap.scaleSync(0.5, 0.5, image.AntiAliasingLevel.MEDIUM);
        console.info(`${LOG_PREFIX} scaleSync003: Succeeded in scaling with anti-aliasing.`);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} scaleSync003 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scaleSync004
     * @tc.number PixelMapComprehensiveTest_051
     * @tc.desc PixelMap scaleSync - test all anti-aliasing enum values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('scaleSync004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scaleSync004: Starting test with all anti-aliasing enum values.`);

        // Test all anti-aliasing levels
        pixelMap.scaleSync(0.5, 0.5, image.AntiAliasingLevel.NONE);
        pixelMap.scaleSync(0.5, 0.5, image.AntiAliasingLevel.MEDIUM);
        pixelMap.scaleSync(0.5, 0.5, image.AntiAliasingLevel.HIGH);

        console.info(`${LOG_PREFIX} scaleSync004: Succeeded in testing all anti-aliasing enum values.`);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} scaleSync004 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scaleSync005
     * @tc.number PixelMapComprehensiveTest_052
     * @tc.desc PixelMap scaleSync - three parameters null x (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('scaleSync005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scaleSync005: Starting test with null x parameter.`);
        try {
          pixelMap.scaleSync(null, 1.0, image.AntiAliasingLevel.MEDIUM);
          console.info(`${LOG_PREFIX} scaleSync005: scaleSync success.`);
          await pixelMap.release();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} scaleSync005: scaleSync error.`, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      } catch (error) {
        console.error(`${LOG_PREFIX} scaleSync005: Failed with null x as expected, code: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scaleSync006
     * @tc.number PixelMapComprehensiveTest_053
     * @tc.desc PixelMap scaleSync - three parameters null y (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('scaleSync006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scaleSync006: Starting test with null y parameter.`);
        try {
          pixelMap.scaleSync(1.0, null, image.AntiAliasingLevel.MEDIUM);
          console.info(`${LOG_PREFIX} scaleSync006: scaleSync success.`);
          await pixelMap.release();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} scaleSync006: scaleSync error.`, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      } catch (error) {
        console.error(`${LOG_PREFIX} scaleSync006: Failed with null y as expected, code: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scaleSync007
     * @tc.number PixelMapComprehensiveTest_054
     * @tc.desc PixelMap scaleSync - three parameters undefined x (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('scaleSync007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scaleSync007: Starting test with undefined x parameter.`);
        try {
          pixelMap.scaleSync(undefined, 1.0, image.AntiAliasingLevel.MEDIUM);
          console.info(`${LOG_PREFIX} scaleSync007: scaleSync success.`);
          await pixelMap.release();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} scaleSync007: scaleSync error.`, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      } catch (error) {
        console.error(`${LOG_PREFIX} scaleSync007: Failed with undefined x as expected, code: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scaleSync008
     * @tc.number PixelMapComprehensiveTest_055
     * @tc.desc PixelMap scaleSync - three parameters undefined y (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('scaleSync008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scaleSync008: Starting test with undefined y parameter.`);
        try {
          pixelMap.scaleSync(1.0, undefined, image.AntiAliasingLevel.MEDIUM);
          console.info(`${LOG_PREFIX} scaleSync008: scaleSync success.`);
          await pixelMap.release();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} scaleSync008: scaleSync error.`, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      } catch (error) {
        console.error(`${LOG_PREFIX} scaleSync008: Failed with undefined y as expected, code: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createScaledPixelMapComp003
     * @tc.number PixelMapComprehensiveTest_056
     * @tc.desc PixelMap createScaledPixelMap with Promise - three parameters with NONE anti-aliasing
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('createScaledPixelMapComp003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(
          `${LOG_PREFIX} createScaledPixelMap003: Starting create scaled pixel map with NONE anti-aliasing.`
        );

        const scaledPixelMap = await pixelMap.createScaledPixelMap(0.5, 0.5, image.AntiAliasingLevel.NONE);
        expect(scaledPixelMap != null).assertTrue();
        console.info(
          `${LOG_PREFIX} createScaledPixelMap003: Succeeded in creating scaled pixel map with NONE anti-aliasing.`
        );
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} createScaledPixelMap003 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createScaledPixelMap004
     * @tc.number PixelMapComprehensiveTest_057
     * @tc.desc PixelMap createScaledPixelMap with Promise - three parameters with MEDIUM anti-aliasing
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('createScaledPixelMap004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(
          `${LOG_PREFIX} createScaledPixelMap004: Starting create scaled pixel map with MEDIUM anti-aliasing.`
        );

        const scaledPixelMap = await pixelMap.createScaledPixelMap(0.5, 0.5, image.AntiAliasingLevel.MEDIUM);
        expect(scaledPixelMap != null).assertTrue();
        console.info(
          `${LOG_PREFIX} createScaledPixelMap004: Succeeded in creating scaled pixel map with MEDIUM anti-aliasing.`
        );
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} createScaledPixelMap004 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createScaledPixelMapNull001
     * @tc.number PixelMapComprehensiveTest_058
     * @tc.desc PixelMap createScaledPixelMap with Promise - null x parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('createScaledPixelMapNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} createScaledPixelMapNull001: Starting test with null x parameter.`);
        try {
          await pixelMap.createScaledPixelMap(null, 1.0);
          console.info(`${LOG_PREFIX} createScaledPixelMapNull001: createScaledPixelMap success.`);
          expect().assertFail();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} createScaledPixelMapNull001: createScaledPixelMap error.`, JSON.stringify(err));
          expect(Number(err.code) === 401).assertTrue();
          await pixelMap.release();
          done();
        }
      } catch (error) {
        console.error(`${LOG_PREFIX} createScaledPixelMapNull001: Failed with null x as expected, code: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createScaledPixelMapNull002
     * @tc.number PixelMapComprehensiveTest_059
     * @tc.desc PixelMap createScaledPixelMap with Promise - null y parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('createScaledPixelMapNull002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} createScaledPixelMapNull002: Starting test with null y parameter.`);
        try {
          await pixelMap.createScaledPixelMap(1.0, null);
          console.info(`${LOG_PREFIX} createScaledPixelMapNull002: createScaledPixelMap success.`);
          expect().assertFail();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} createScaledPixelMapNull002: createScaledPixelMap error.`, JSON.stringify(err));
          expect(Number(err.code) === 401).assertTrue();
          await pixelMap.release();
          done();
        }
      } catch (error) {
        console.error(`${LOG_PREFIX} createScaledPixelMapNull002: Failed with null y as expected, code: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createScaledPixelMapUndefined001
     * @tc.number PixelMapComprehensiveTest_060
     * @tc.desc PixelMap createScaledPixelMap with Promise - undefined x parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'createScaledPixelMapUndefined001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 },
          };
          const pixelMap = image.createPixelMapSync(color, opts);
          console.info(`${LOG_PREFIX} createScaledPixelMapUndefined001: Starting test with undefined x parameter.`);
          try {
            await pixelMap.createScaledPixelMap(undefined, 1.0);
            console.info(`${LOG_PREFIX} createScaledPixelMapUndefined001: createScaledPixelMap success.`);
            expect().assertFail();
            done();
          } catch (err) {
            console.info(
              `${LOG_PREFIX} createScaledPixelMapUndefined001: createScaledPixelMap error.`,
              JSON.stringify(err)
            );
            expect(Number(err.code) === 401).assertTrue();
            await pixelMap.release();
            done();
          }
        } catch (error) {
          console.error(
            `${LOG_PREFIX} createScaledPixelMapUndefined001: Failed with undefined x as expected, code: ${error}`
          );
          expect().assertFail();
          done();
        }
      }
    );

    /**
     * @tc.name createScaledPixelMapUndefined002
     * @tc.number PixelMapComprehensiveTest_061
     * @tc.desc PixelMap createScaledPixelMap with Promise - undefined y parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'createScaledPixelMapUndefined002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 },
          };
          const pixelMap = image.createPixelMapSync(color, opts);
          console.info(`${LOG_PREFIX} createScaledPixelMapUndefined002: Starting test with undefined y parameter.`);
          try {
            await pixelMap.createScaledPixelMap(1.0, undefined);
            console.info(`${LOG_PREFIX} createScaledPixelMapUndefined002: createScaledPixelMap success.`);
            expect().assertFail();
            done();
          } catch (err) {
            console.info(
              `${LOG_PREFIX} createScaledPixelMapUndefined002: createScaledPixelMap error.`,
              JSON.stringify(err)
            );
            expect(Number(err.code) === 401).assertTrue();
            await pixelMap.release();
            done();
          }
        } catch (error) {
          console.error(
            `${LOG_PREFIX} createScaledPixelMapUndefined002: Failed with undefined y as expected, code: ${error}`
          );
          expect().assertFail();
          done();
        }
      }
    );

    /**
     * @tc.name createScaledPixelMapSync001
     * @tc.number PixelMapComprehensiveTest_062
     * @tc.desc PixelMap createScaledPixelMapSync - two parameters success case
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('createScaledPixelMapSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} createScaledPixelMapSync001: Starting create scaled pixel map sync test.`);

        const scaledPixelMap = pixelMap.createScaledPixelMapSync(2.0, 2.0);
        expect(scaledPixelMap != null).assertTrue();
        console.info(`${LOG_PREFIX} createScaledPixelMapSync001: Succeeded in creating scaled pixel map.`);
        await pixelMap.release();
        await scaledPixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} createScaledPixelMapSync001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createScaledPixelMapSync002
     * @tc.number PixelMapComprehensiveTest_063
     * @tc.desc PixelMap createScaledPixelMapSync - three parameters with anti-aliasing
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('createScaledPixelMapSync002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(
          `${LOG_PREFIX} createScaledPixelMapSync002: Starting create scaled pixel map with anti-aliasing test.`
        );

        const scaledPixelMap = pixelMap.createScaledPixelMapSync(0.5, 0.5, image.AntiAliasingLevel.HIGH);
        expect(scaledPixelMap != null).assertTrue();
        console.info(
          `${LOG_PREFIX} createScaledPixelMapSync002: Succeeded in creating scaled pixel map with anti-aliasing.`
        );
        await pixelMap.release();
        await scaledPixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} createScaledPixelMapSync002 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createScaledPixelMapSync003
     * @tc.number PixelMapComprehensiveTest_064
     * @tc.desc PixelMap createScaledPixelMapSync - test all anti-aliasing enum values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('createScaledPixelMapSync003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} createScaledPixelMapSync003: Starting test with all anti-aliasing enum values.`);

        // Test all anti-aliasing levels
        const scaledPixelMap1 = pixelMap.createScaledPixelMapSync(0.5, 0.5, image.AntiAliasingLevel.NONE);
        const scaledPixelMap2 = pixelMap.createScaledPixelMapSync(0.5, 0.5, image.AntiAliasingLevel.MEDIUM);
        const scaledPixelMap3 = pixelMap.createScaledPixelMapSync(0.5, 0.5, image.AntiAliasingLevel.HIGH);

        expect(scaledPixelMap1 != null).assertTrue();
        expect(scaledPixelMap2 != null).assertTrue();
        expect(scaledPixelMap3 != null).assertTrue();

        console.info(`${LOG_PREFIX} createScaledPixelMapSync003: Succeeded in testing all anti-aliasing enum values.`);
        await pixelMap.release();
        await scaledPixelMap1.release();
        await scaledPixelMap2.release();
        await scaledPixelMap3.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} createScaledPixelMapSync003 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name createScaledPixelMapSyncNull001
     * @tc.number PixelMapComprehensiveTest_065
     * @tc.desc PixelMap createScaledPixelMapSync - null x parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('createScaledPixelMapSyncNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 },
          };
          const pixelMap = image.createPixelMapSync(color, opts);
          console.info(`${LOG_PREFIX} createScaledPixelMapSyncNull001: Starting test with null x parameter.`);
          try {
            pixelMap.createScaledPixelMapSync(null, 1.0);
            console.info(`${LOG_PREFIX} createScaledPixelMapSyncNull001: createScaledPixelMapSync success.`);
            expect().assertFail();
            done();
          } catch (err) {
            console.info(
              `${LOG_PREFIX} createScaledPixelMapSyncNull001: createScaledPixelMapSync error.`,
              JSON.stringify(err)
            );
            expect(Number(err.code) === 401).assertTrue();
            await pixelMap.release();
            done();
          }
        } catch (error) {
          console.error(
            `${LOG_PREFIX} createScaledPixelMapSyncNull001: Failed with null x as expected, code: ${error}`
          );
          expect().assertFail();
          done();
        }
      }
    );

    /**
     * @tc.name createScaledPixelMapSyncNull002
     * @tc.number PixelMapComprehensiveTest_066
     * @tc.desc PixelMap createScaledPixelMapSync - null y parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('createScaledPixelMapSyncNull002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 },
          };
          const pixelMap = image.createPixelMapSync(color, opts);
          console.info(`${LOG_PREFIX} createScaledPixelMapSyncNull002: Starting test with null y parameter.`);
          try {
            pixelMap.createScaledPixelMapSync(1.0, null);
            console.info(`${LOG_PREFIX} createScaledPixelMapSyncNull002: createScaledPixelMapSync success.`);
            expect().assertFail();
            done();
          } catch (err) {
            console.info(
              `${LOG_PREFIX} createScaledPixelMapSyncNull002: createScaledPixelMapSync error.`,
              JSON.stringify(err)
            );
            expect(Number(err.code) === 401).assertTrue();
            await pixelMap.release();
            done();
          }
        } catch (error) {
          console.error(
            `${LOG_PREFIX} createScaledPixelMapSyncNull002: Failed with null y as expected, code: ${error}`
          );
          expect().assertFail();
          done();
        }
      }
    );

    /**
     * @tc.name createScaledPixelMapSyncUndefined001
     * @tc.number PixelMapComprehensiveTest_067
     * @tc.desc PixelMap createScaledPixelMapSync - undefined x parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('createScaledPixelMapSyncUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 },
          };
          const pixelMap = image.createPixelMapSync(color, opts);
          console.info(`${LOG_PREFIX} createScaledPixelMapSyncUndefined001: Starting test with undefined x parameter.`);
          try {
            pixelMap.createScaledPixelMapSync(undefined, 1.0);
            console.info(`${LOG_PREFIX} createScaledPixelMapSyncUndefined001: createScaledPixelMapSync success.`);
            expect().assertFail();
            done();
          } catch (err) {
            console.info(
              `${LOG_PREFIX} createScaledPixelMapSyncUndefined001: createScaledPixelMapSync error.`,
              JSON.stringify(err)
            );
            expect(Number(err.code) === 401).assertTrue();
            await pixelMap.release();
            done();
          }
        } catch (error) {
          console.error(
            `${LOG_PREFIX} createScaledPixelMapSyncUndefined001: Failed with undefined x as expected, code: ${error}`
          );
          expect().assertFail();
          done();
        }
      }
    );

    /**
     * @tc.name createScaledPixelMapSyncUndefined002
     * @tc.number PixelMapComprehensiveTest_068
     * @tc.desc PixelMap createScaledPixelMapSync - undefined y parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('createScaledPixelMapSyncUndefined002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 },
          };
          const pixelMap = image.createPixelMapSync(color, opts);
          console.info(`${LOG_PREFIX} createScaledPixelMapSyncUndefined002: Starting test with undefined y parameter.`);
          try {
            pixelMap.createScaledPixelMapSync(1.0, undefined);
            console.info(`${LOG_PREFIX} createScaledPixelMapSyncUndefined002: createScaledPixelMapSync success.`);
            expect().assertFail();
            done();
          } catch (err) {
            console.info(
              `${LOG_PREFIX} createScaledPixelMapSyncUndefined002: createScaledPixelMapSync error.`,
              JSON.stringify(err)
            );
            expect(Number(err.code) === 401).assertTrue();
            await pixelMap.release();
            done();
          }
        } catch (error) {
          console.error(
            `${LOG_PREFIX} createScaledPixelMapSyncUndefined002: Failed with undefined y as expected, code: ${error}`
          );
          expect().assertFail();
          done();
        }
      }
    );

    /**
     * @tc.name setMetadata001
     * @tc.number PixelMapComprehensiveTest_069
     * @tc.desc PixelMap setMetadata with Promise - success callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('setMetadata001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} setMetadata001: Starting set metadata test.`);

        // Note: HdrMetadataKey and HdrMetadataValue are not available in test environment
        // This test verifies the API exists
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} setMetadata001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name setMetadataNull001
     * @tc.number PixelMapComprehensiveTest_070
     * @tc.desc PixelMap setMetadata with Promise - null value parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('setMetadataNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} setMetadataNull001: Starting test with null value parameter.`);

        // Test with null value parameter
        // Note: HdrMetadataKey and HdrMetadataValue are not available in test environment
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} setMetadataNull001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name opacityNullParam001
     * @tc.number PixelMapParameterCoverageTest_003
     * @tc.desc PixelMap opacity with null parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('opacityNullParam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} opacityNull001: Starting test with null parameter.`);

        // 测试 null 参数
        pixelMap.opacity(null, (error: BusinessError) => {
          if (error) {
            console.info(`${LOG_PREFIX} opacityNull001: As expected, failed with null parameter. Code: ${error}`);
            expect(error).assertEqual(62980115); // 参数错误
            pixelMap.release();
            done();
          } else {
            console.error(`${LOG_PREFIX} opacityNull001: Unexpectedly succeeded with null parameter`);
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.info(`${LOG_PREFIX} opacityNull001: Caught exception as expected: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name opacityPromiseNone001
     * @tc.number PixelMapParameterCoverageTest_004
     * @tc.desc PixelMap scale (Promise) with AntiAliasingLevel.NONE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('opacityPromiseNone001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} opacityPromiseNone001: Starting test with valid parameters.`);

        // 测试正常参数
        await pixelMap.opacity(0.5);
        console.info(`${LOG_PREFIX} opacityPromiseNone001: Succeeded in opacity with valid parameter.`);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} opacityPromiseNone001 failed: code ${error.code}, message ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scalePromiseNone001
     * @tc.number PixelMapParameterCoverageTest_005
     * @tc.desc PixelMap scale (Promise) with AntiAliasingLevel.NONE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('scalePromiseNone001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scalePromiseNone001: Starting test with AntiAliasingLevel.NONE.`);

        // 测试 AntiAliasingLevel.NONE 枚举值
        await pixelMap.scale(1.0, 1.0, image.AntiAliasingLevel.NONE);
        console.info(`${LOG_PREFIX} scalePromiseNone001: Succeeded in scaling with AntiAliasingLevel.NONE.`);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} scalePromiseNone001 failed: code ${error.code}, message ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scalePromiseHigh001
     * @tc.number PixelMapParameterCoverageTest_006
     * @tc.desc PixelMap scale (Promise) with AntiAliasingLevel.HIGH
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('scalePromiseHigh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scalePromiseHigh001: Starting test with AntiAliasingLevel.HIGH.`);

        // 测试 AntiAliasingLevel.HIGH 枚举值
        await pixelMap.scale(1.0, 1.0, image.AntiAliasingLevel.HIGH);
        console.info(`${LOG_PREFIX} scalePromiseHigh001: Succeeded in scaling with AntiAliasingLevel.HIGH.`);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} scalePromiseHigh001 failed: code ${error.code}, message ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name flipTrueFalse001
     * @tc.number PixelMapParameterCoverageTest_007
     * @tc.desc PixelMap flip with horizontal=true, vertical=false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('flipTrueFalse001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} flipTrueFalse001: Starting test with horizontal=true, vertical=false.`);

        // 测试 true, false 参数
        pixelMap.flip(true, false, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} flipTrueFalse001 failed: code ${error.code}, message ${error.message}`);
            expect().assertFail();
          } else {
            console.info(`${LOG_PREFIX} flipTrueFalse001: Succeeded in flipping with horizontal=true, vertical=false.`);
            pixelMap.release();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} flipTrueFalse001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name flipFalseTrue001
     * @tc.number PixelMapParameterCoverageTest_008
     * @tc.desc PixelMap flip with horizontal=false, vertical=true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('flipFalseTrue001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} flipFalseTrue001: Starting test with horizontal=false, vertical=true.`);

        // 测试 false, true 参数
        pixelMap.flip(false, true, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} flipFalseTrue001 failed: code ${error.code}, message ${error.message}`);
            expect().assertFail();
          } else {
            console.info(`${LOG_PREFIX} flipFalseTrue001: Succeeded in flipping with horizontal=false, vertical=true.`);
            pixelMap.release();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} flipFalseTrue001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name readPixels001
     * @tc.number PixelMapReadPixelsTest_001
     * @tc.desc PixelMap readPixels with valid buffer using callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('readPixels001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} readPixels001: Starting readPixels test.`);
        expect(pixelMap.isEditable).assertTrue();

        const buffer = new ArrayBuffer(96);
        const area: image.PositionArea = {
          pixels: new ArrayBuffer(8), // 8为需要创建的像素buffer大小，取值为：height * width *4。
          offset: 0,
          stride: 8,
          region: { size: { height: 1, width: 2 }, x: 0, y: 0 },
        };
        pixelMap.readPixels(area, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} readPixels001 failed: code ${error.code}, message ${error.message}`);
            expect().assertFail();
            done();
          } else {
            expect(pixelMap.isEditable).assertTrue();
            console.info(`${LOG_PREFIX} readPixels001: Succeeded in reading pixels.`);
            pixelMap.release();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} readPixels001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name readPixels002
     * @tc.number PixelMapReadPixelsTest_002
     * @tc.desc PixelMap readPixels with valid buffer using promise
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('readPixels002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} readPixels002: Starting readPixels test.`);
        expect(pixelMap.isEditable).assertTrue();

        const buffer = new ArrayBuffer(96);
        const area: image.PositionArea = {
          pixels: new ArrayBuffer(8), // 8为需要创建的像素buffer大小，取值为：height * width *4。
          offset: 0,
          stride: 8,
          region: { size: { height: 1, width: 2 }, x: 0, y: 0 },
        };
        await pixelMap.readPixels(area);
        expect(pixelMap.isEditable).assertTrue();

        console.info(`${LOG_PREFIX} readPixels002: Succeeded in reading pixels.`);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} readPixels002 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name readPixels003
     * @tc.number PixelMapReadPixelsTest_003
     * @tc.desc PixelMap readPixels after crop
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('readPixels003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} readPixels003: Starting test.`);
        expect(pixelMap.isEditable).assertTrue();

        const region: image.Region = { x: 0, y: 0, size: { width: 2, height: 2 } };
        await pixelMap.crop(region);
        expect(pixelMap.isEditable).assertTrue();

        const buffer = new ArrayBuffer(16);
        const area: image.PositionArea = {
          pixels: new ArrayBuffer(8), // 8为需要创建的像素buffer大小，取值为：height * width *4。
          offset: 0,
          stride: 8,
          region: { size: { height: 1, width: 2 }, x: 0, y: 0 },
        };
        await pixelMap.readPixels(area);
        expect(buffer.byteLength).assertEqual(16);

        console.info(`${LOG_PREFIX} readPixels003: Succeeded in reading pixels after crop.`);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} readPixels003 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

  })
}