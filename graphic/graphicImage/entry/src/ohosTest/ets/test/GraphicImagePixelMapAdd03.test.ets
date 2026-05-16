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
const LOG_PREFIX: string = '[www data graphicImagePixelMapAdd03]';

export default function graphicImagePixelMapAdd03() {
  describe('graphicImagePixelMapAdd03', ()=> {
    beforeAll(async (done:Function)=> {
      console.info("imagePixelMapTest beforeEach start");
      done();
    });

    /**
     * @tc.name writePixels001
     * @tc.number PixelMapWritePixelsTest_001
     * @tc.desc PixelMap writePixels with valid region and buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('writePixels001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} writePixels001: Starting writePixels test.`, pixelMap.isEditable);
        expect(pixelMap.isEditable).assertTrue();

        const buffer = new ArrayBuffer(96);
        const area: image.PositionArea = {
          pixels: new ArrayBuffer(8), // 8为需要创建的像素buffer大小，取值为：height * width *4。
          offset: 0,
          stride: 8,
          region: { size: { height: 4, width: 4 }, x: 0, y: 0 },
        };
        pixelMap.writePixels(area, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} writePixels001 failed: code ${error}`);
            expect(error).assertEqual(62980115);
            pixelMap?.release();
            done();
          } else {
            console.info(`${LOG_PREFIX} writePixels001: Succeeded in writing pixels.`);
            expect().assertFail();
            pixelMap?.release();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} writePixels001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name writePixels002
     * @tc.number PixelMapWritePixelsTest_002
     * @tc.desc PixelMap writePixels with partial region
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('writePixels002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} writePixels002: Starting test.`);
        expect(pixelMap.isEditable).assertTrue();

        const buffer = new ArrayBuffer(16);
        const area: image.PositionArea = {
          pixels: new ArrayBuffer(8), // 8为需要创建的像素buffer大小，取值为：height * width *4。
          offset: 0,
          stride: 8,
          region: { size: { height: 2, width: 2 }, x: 0, y: 0 },
        };
        const region: image.Region = { x: 0, y: 0, size: { width: 2, height: 2 } };
        pixelMap.writePixels(area, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} writePixels002 failed: code ${error}`);
            expect(error).assertEqual(62980115);
            pixelMap?.release();
            done();
          } else {
            console.info(`${LOG_PREFIX} writePixels002: Succeeded in writing pixels.`);
            expect().assertFail();
            pixelMap?.release();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} writePixels002 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name writeBufferToPixels001
     * @tc.number PixelMapWriteBufferToPixelsTest_001
     * @tc.desc PixelMap writeBufferToPixels with AsyncCallback - success callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('writeBufferToPixels001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);

        const srcBuffer: ArrayBuffer = new ArrayBuffer(pixelMap.getPixelBytesNumber());
        pixelMap.readPixelsToBufferSync(srcBuffer);

        // Clear the buffer and write back
        const writeBuffer: ArrayBuffer = new ArrayBuffer(pixelMap.getPixelBytesNumber());
        pixelMap.writeBufferToPixels(srcBuffer, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} writeBufferToPixels001 failed: code ${error.code}, message ${error.message}`);
            expect().assertFail();
            pixelMap?.release();
          } else {
            expect(writeBuffer != null).assertTrue();
            console.info(`${LOG_PREFIX} writeBufferToPixels001: Succeeded in writing buffer to pixels.`);
            pixelMap?.release();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} writeBufferToPixels001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name writeBufferToPixelsInvalidSize001
     * @tc.number PixelMapWriteBufferToPixelsTest_004
     * @tc.desc PixelMap writeBufferToPixels with AsyncCallback - invalid buffer size (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('writeBufferToPixelsInvalidSize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 },
          };
          const pixelMap = image.createPixelMapSync(color, opts);
          console.info(`${LOG_PREFIX} writeBufferToPixelsInvalidSize001: Starting test with invalid buffer size.`);

          // Test with incorrect buffer size
          const srcBuffer: ArrayBuffer = new ArrayBuffer(10); // Too small
          pixelMap.writeBufferToPixels(srcBuffer, (error: BusinessError) => {
            if (error) {
              console.error(
                `${LOG_PREFIX} writeBufferToPixelsInvalidSize001: Failed with invalid buffer size as expected, code: `
                  + `${error}`
              );
              expect(error).assertEqual(62980115); // Parameter error
              pixelMap?.release();
              done();
            } else {
              expect().assertFail(); // Should not succeed with invalid buffer size
              pixelMap?.release();
              done();
            }
          });
        } catch (error) {
          console.error(`${LOG_PREFIX} writeBufferToPixelsInvalidSize001: Unexpected error: ${error}`);
          expect().assertFail();
          done();
        }
    });

    /**
     * @tc.name translate001
     * @tc.number PixelMapTranslateTest_001
     * @tc.desc PixelMap translate with valid parameters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('translate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
            done();
          } else {
            pixelMap?.release();
            console.info(`${LOG_PREFIX} translate001: Succeeded in translating.`);
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
     * @tc.name translateNull001
     * @tc.number PixelMapTranslateTest_002
     * @tc.desc PixelMap translate with null x parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('translateNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} translateNull001: Starting test with null x parameter.`);

        pixelMap.translate(null, 20, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} translateNull001: Failed with null x as expected, code: ${error}`);
            expect(error).assertEqual(62980115); // Parameter error
            pixelMap?.release();
            done();
          } else {
            console.info(`${LOG_PREFIX} translateNull001: success `);
            expect().assertFail(); // Should not succeed with null parameter
            pixelMap?.release();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} translateNull001: Unexpected error: ${error}`);
        expect().assertFail(); // Parameter error
        done();
      }
    });

    /**
     * @tc.name translateNull002
     * @tc.number PixelMapTranslateTest_003
     * @tc.desc PixelMap translate with null y parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('translateNull002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
            expect(error).assertEqual(62980115); // Parameter error
            pixelMap?.release();
            done();
          } else {
            expect().assertFail(); // Should not succeed with null parameter
            pixelMap?.release();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} translateNull002: Unexpected error: ${error}`);
        expect().assertFail(); // Parameter error
        done();
      }
    });

    /**
     * @tc.name translateUndefined001
     * @tc.number PixelMapTranslateTest_004
     * @tc.desc PixelMap translate with undefined x parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('translateUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} translateUndefined001: Starting test with undefined x parameter.`);

        pixelMap.translate(undefined, 20, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} translateUndefined001: Failed with undefined x as expected, code: ${error}`);
            expect(error).assertEqual(62980115); // Parameter error
            pixelMap?.release();
            done();
          } else {
            expect().assertFail(); // Should not succeed with undefined parameter
            pixelMap?.release();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} translateUndefined001: Unexpected error: ${error}`);
        expect().assertFail(); // Parameter error
        done();
      }
    });

    /**
     * @tc.name translateUndefined002
     * @tc.number PixelMapTranslateTest_005
     * @tc.desc PixelMap translate with undefined y parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('translateUndefined002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
            expect(error).assertEqual(62980115); // Parameter error
            pixelMap?.release();
            done();
          } else {
            expect().assertFail(); // Should not succeed with undefined parameter
            pixelMap?.release();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} translateUndefined002: Unexpected error: ${error}`);
        expect().assertFail(); // Parameter error
        done();
      }
    });

    /**
     * @tc.name translateString001
     * @tc.number PixelMapTranslateTest_006
     * @tc.desc PixelMap translate with string x parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('translateString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} translateString001: Starting test with string x parameter.`);

        pixelMap.translate(10, 20, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} translateString001: Failed with string x as expected, code: ${error}`);
            expect().assertFail(); // Parameter error
            done();
          } else {
            console.error(`${LOG_PREFIX} translateString001: success`);
            pixelMap?.release();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} translateString001: Unexpected error: ${error}`);
        expect().assertFail(); // Parameter error
        done();
      }
    });

    /**
     * @tc.name translateString002
     * @tc.number PixelMapTranslateTest_007
     * @tc.desc PixelMap translate with string y parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('translateString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} translateString002: Starting test with string y parameter.`);

        pixelMap.translate(10, 20, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} translateString002: Failed with string y as expected, code: ${error}`);
            expect().assertFail(); // Parameter error
            done();
          } else {
            console.error(`${LOG_PREFIX} translateString002: success`);
            pixelMap?.release();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} translateString002: Unexpected error: ${error}`);
        expect().assertFail(); // Parameter error
        done();
      }
    });

    /**
     * @tc.name translatePromise001
     * @tc.number PixelMapTranslateTest_008
     * @tc.desc PixelMap translate with Promise - valid parameters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('translatePromise001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} translatePromise001: Starting translate test with Promise.`);

        await pixelMap.translate(5, 15);
        console.info(`${LOG_PREFIX} translatePromise001: Succeeded in translating.`);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} translatePromise001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name translatePromiseNull001
     * @tc.number PixelMapTranslateTest_009
     * @tc.desc PixelMap translate with Promise - null x parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('translatePromiseNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} translatePromiseNull001: Starting test with null x parameter.`);
        try {
          await pixelMap.translate(null, 20);
          expect().assertFail(); // Should not reach here
          done();
        } catch(err){
          expect(err).assertEqual(62980115);
          await pixelMap.release();
          done();
        }
      } catch (error) {
        console.error(`${LOG_PREFIX} translatePromiseNull001: Failed with null x as expected, code: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name translatePromiseNull002
     * @tc.number PixelMapTranslateTest_010
     * @tc.desc PixelMap translate with Promise - null y parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('translatePromiseNull002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} translatePromiseNull002: Starting test with null y parameter.`);
        try {
          await pixelMap.translate(10, null);
          expect().assertFail(); // Should not reach here
          done();
        } catch(err){
          expect(err).assertEqual(62980115);
          await pixelMap.release();
          done();
        }
      } catch (error) {
        console.error(`${LOG_PREFIX} translatePromiseNull002: Failed with null y as expected, code: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name translatePromiseUndefined001
     * @tc.number PixelMapTranslateTest_011
     * @tc.desc PixelMap translate with Promise - undefined x parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('translatePromiseUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} translatePromiseUndefined001: Starting test with undefined x parameter.`);
        try {
          await pixelMap.translate(undefined, 20);
          expect().assertFail(); // Should not reach here
          done();
        } catch(err){
          expect(err).assertEqual(62980115);
          await pixelMap.release();
          done();
        }
      } catch (error) {
        console.error(
          `${LOG_PREFIX} translatePromiseUndefined001: Failed with undefined x as expected, code: ${error}`
        );
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name translatePromiseUndefined002
     * @tc.number PixelMapTranslateTest_012
     * @tc.desc PixelMap translate with Promise - undefined y parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('translatePromiseUndefined002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} translatePromiseUndefined002: Starting test with undefined y parameter.`);
        try {
          await pixelMap.translate(10, undefined);
          expect().assertFail(); // Should not reach here
          done();
        } catch(err){
          expect(err).assertEqual(62980115);
          await pixelMap.release();
          done();
        }
      } catch (error) {
        console.error(
          `${LOG_PREFIX} translatePromiseUndefined002: Failed with undefined y as expected, code: ${error}`
        );
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name translateSync001
     * @tc.number PixelMapTranslateTest_013
     * @tc.desc PixelMap translateSync - valid parameters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('translateSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} translateSync001: Starting translateSync test.`);

        pixelMap.translateSync(30, 40);
        console.info(`${LOG_PREFIX} translateSync001: Succeeded in translating.`);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} translateSync001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name translateSyncNull001
     * @tc.number PixelMapTranslateTest_014
     * @tc.desc PixelMap translateSync - null x parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('translateSyncNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} translateSyncNull001: Starting test with null x parameter.`);

        pixelMap.translateSync(null, 20);
        console.info(`${LOG_PREFIX} translateSyncNull001: success.`);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} translateSyncNull001: Failed with null x as expected, code: ${error}`);
        expect().assertFail(); // Parameter error
        done();
      }
    });

    /**
     * @tc.name translateSyncNull002
     * @tc.number PixelMapTranslateTest_015
     * @tc.desc PixelMap translateSync - null y parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('translateSyncNull002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} translateSyncNull002: Starting test with null y parameter.`);

        pixelMap.translateSync(10, null);
        console.info(`${LOG_PREFIX} translateSyncNull002: success.`);
        await pixelMap.release();
        done();
      } catch (error) {
        expect().assertFail(); // Parameter error
        console.error(`${LOG_PREFIX} translateSyncNull002: Failed with null y as expected, code: ${error.code}`);
        done();
      }
    });

    /**
     * @tc.name translateBoundary001
     * @tc.number PixelMapTranslateTest_016
     * @tc.desc PixelMap translate with boundary values (negative coordinates)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('translateBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} translateBoundary001: Starting test with negative coordinates.`);

        await pixelMap.translate(-10, -20);
        console.info(`${LOG_PREFIX} translateBoundary001: Succeeded in translating with negative coordinates.`);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} translateBoundary001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name translateBoundary002
     * @tc.number PixelMapTranslateTest_017
     * @tc.desc PixelMap translate with boundary values (zero coordinates)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('translateBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} translateBoundary002: Starting test with zero coordinates.`);

        await pixelMap.translate(0, 0);
        console.info(`${LOG_PREFIX} translateBoundary002: Succeeded in translating with zero coordinates.`);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} translateBoundary002 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scale001
     * @tc.number PixelMapScaleTest_001
     * @tc.desc PixelMap scale with valid parameters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('scale001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
            pixelMap?.release();
            console.info(`${LOG_PREFIX} scale001: Succeeded in scaling.`);
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
     * @tc.name scaleNull001
     * @tc.number PixelMapScaleTest_002
     * @tc.desc PixelMap scale with null x parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('scaleNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scaleNull001: Starting test with null x parameter.`);

        const nullX: number | null = null;
        pixelMap.scale(nullX, 2.0, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} scaleNull001: Failed with null x as expected, code: ${error}`);
            expect(error).assertEqual(62980115); // Parameter error
            pixelMap?.release();
            done();
          } else {
            expect().assertFail(); // Should not succeed with null parameter
            pixelMap?.release();
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
     * @tc.name scaleNull002
     * @tc.number PixelMapScaleTest_003
     * @tc.desc PixelMap scale with null y parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('scaleNull002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scaleNull002: Starting test with null y parameter.`);

        const nullY: number | null = null;
        pixelMap.scale(2.0, nullY, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} scaleNull002: Failed with null y as expected, code: ${error}`);
            expect(error).assertEqual(62980115);
            pixelMap?.release();
            done();
          } else {
            expect().assertFail(); // Should not succeed with null parameter
            pixelMap?.release();
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
     * @tc.name scaleUndefined001
     * @tc.number PixelMapScaleTest_004
     * @tc.desc PixelMap scale with undefined x parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('scaleUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scaleUndefined001: Starting test with undefined x parameter.`);

        const undefinedX: number | undefined = undefined;
        pixelMap.scale(undefinedX, 2.0, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} scaleUndefined001: Failed with undefined x as expected, code: ${error}`);
            expect(error).assertEqual(62980115);
            pixelMap?.release();
            done();
          } else {
            expect().assertFail(); // Should not succeed with undefined parameter
            pixelMap?.release();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} scaleUndefined001: Unexpected error: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scaleUndefined002
     * @tc.number PixelMapScaleTest_005
     * @tc.desc PixelMap scale with undefined y parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('scaleUndefined002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scaleUndefined002: Starting test with undefined y parameter.`);

        const undefinedY: number | undefined = undefined;
        pixelMap.scale(2.0, undefinedY, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} scaleUndefined002: Failed with undefined y as expected, code: ${error}`);
            expect(error).assertEqual(62980115);
            pixelMap?.release();
            done();
          } else {
            expect().assertFail(); // Should not succeed with undefined parameter
            pixelMap?.release();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} scaleUndefined002: Unexpected error: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scaleNegative001
     * @tc.number PixelMapScaleTest_006
     * @tc.desc PixelMap scale with negative x parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('scaleNegative001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scaleNegative001: Starting test with negative x parameter.`);

        pixelMap.scale(-1.0, 2.0, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} scaleNegative001: Failed with negative x as expected, code: ${error}`);
            expect().assertFail(); // Should not succeed with negative value
            done();
          } else {
            console.info(`${LOG_PREFIX} scaleNegative001: success`);
            pixelMap?.release();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} scaleNegative001: Unexpected error: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scaleNegative002
     * @tc.number PixelMapScaleTest_007
     * @tc.desc PixelMap scale with negative y parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('scaleNegative002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scaleNegative002: Starting test with negative y parameter.`);

        pixelMap.scale(2.0, -1.0, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} scaleNegative002: Failed with negative y as expected, code: ${error.code}`);
            expect().assertFail(); // Should not succeed with negative value
            done();
          } else {
            console.info(`${LOG_PREFIX} scaleNegative002: success`);
            pixelMap?.release();
            done();
          }
        });
      } catch (error) {
        expect(error.code).assertEqual(401); // Parameter error
        console.error(`${LOG_PREFIX} scaleNegative002: Unexpected error: ${error}`);
        done();
      }
    });

    /**
     * @tc.name scaleZero001
     * @tc.number PixelMapScaleTest_008
     * @tc.desc PixelMap scale with zero x parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('scaleZero001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scaleZero001: Starting test with zero x parameter.`);

        pixelMap.scale(0.0, 2.0, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} scaleZero001: Failed with zero x as expected, code: ${error}`);
            expect().assertFail(); // Parameter error
            done();
          } else {
            console.info(`${LOG_PREFIX} scaleZero001: success`);
            pixelMap?.release();
            done();
          }
        });
      } catch (error) {
        expect(error.code).assertEqual(401); // Parameter error
        console.error(`${LOG_PREFIX} scaleZero001: Unexpected error: ${error}`);
        done();
      }
    });

    /**
     * @tc.name scaleZero002
     * @tc.number PixelMapScaleTest_009
     * @tc.desc PixelMap scale with zero y parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('scaleZero002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scaleZero002: Starting test with zero y parameter.`);

        pixelMap.scale(2.0, 0.0, (error: BusinessError) => {
          if (error) {
            console.error(`${LOG_PREFIX} scaleZero002: Failed with zero y as expected, code: ${error}`);
            expect().assertFail(); // Parameter error
            done();
          } else {
            console.info(`${LOG_PREFIX} scaleZero001: success`);
            pixelMap?.release();
            done();
          }
        });
      } catch (error) {
        expect(error.code).assertEqual(401); // Parameter error
        console.error(`${LOG_PREFIX} scaleZero002: Unexpected error: ${error}`);
        done();
      }
    });

    /**
     * @tc.name scalePromise001
     * @tc.number PixelMapScaleTest_010
     * @tc.desc PixelMap scale with Promise - valid parameters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('scalePromise001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scalePromise001: Starting scale test with Promise.`);

        await pixelMap.scale(1.5, 1.5);
        console.info(`${LOG_PREFIX} scalePromise001: Succeeded in scaling.`);
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} scalePromise001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scalePromiseNull001
     * @tc.number PixelMapScaleTest_011
     * @tc.desc PixelMap scale with Promise - null x parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('scalePromiseNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scalePromiseNull001: Starting test with null x parameter.`);
        const nullX: number | null = null;
        try {
          await pixelMap.scale(nullX, 2.0);
          expect().assertFail(); // Should not reach here
          done();
        }catch(err){
          expect(err).assertEqual(62980115);
          await pixelMap.release();
          done();
        }
      } catch (error) {
        console.error(`${LOG_PREFIX} scalePromiseNull001: Failed with null x as expected, code: ${error}`);
        expect().assertFail(); // Parameter error
        done();
      }
    });

    /**
     * @tc.name scalePromiseNull002
     * @tc.number PixelMapScaleTest_012
     * @tc.desc PixelMap scale with Promise - null y parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('scalePromiseNull002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scalePromiseNull002: Starting test with null y parameter.`);
        const nullY: number | null = null;
        try {
          await pixelMap.scale(2.0, nullY);
          expect().assertFail(); // Should not reach here
          done();
        }catch(err){
          expect(err).assertEqual(62980115);
          await pixelMap.release();
          done();
        }
      } catch (error) {
        console.error(`${LOG_PREFIX} scalePromiseNull002: Failed with null y as expected, code: ${error.code}`);
        expect().assertFail(); // Parameter error
        done();
      }
    });

    /**
     * @tc.name scaleSync001
     * @tc.number PixelMapScaleTest_013
     * @tc.desc PixelMap scaleSync - valid parameters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('scaleSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scaleSync001: Starting scaleSync test.`);

        pixelMap.scaleSync(0.5, 0.5);
        console.info(`${LOG_PREFIX} scaleSync001: Succeeded in scaling.`);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} scaleSync001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name scaleSyncNull001
     * @tc.number PixelMapScaleTest_014
     * @tc.desc PixelMap scaleSync - null x parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('scaleSyncNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scaleSyncNull001: Starting test with null x parameter.`);
        const nullXSync: number | null = null;
        pixelMap.scaleSync(nullXSync, 2.0);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} scaleSyncNull001: Failed with null x as expected, code: ${error}`);
        expect().assertFail(); // Parameter error
        done();
      }
    });

    /**
     * @tc.name scaleSyncNull002
     * @tc.number PixelMapScaleTest_015
     * @tc.desc PixelMap scaleSync - null y parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('scaleSyncNull002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} scaleSyncNull002: Starting test with null y parameter.`);

        const nullYSync: number | null = null;
        pixelMap.scaleSync(2.0, nullYSync);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} scaleSyncNull002: Failed with null y as expected, code: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name rotate001
     * @tc.number PixelMapRotateTest_001
     * @tc.desc PixelMap rotate with 0 degrees
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('rotate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} rotate001: Starting rotate test.`, pixelMap.isEditable);
        expect(pixelMap.isEditable).assertTrue();

        const result = await pixelMap.rotate(0);
        console.info(`${LOG_PREFIX} rotate001: Starting rotate result test.`, result);
        expect(result === undefined).assertTrue();
        expect(pixelMap.isEditable).assertTrue();

        console.info(`${LOG_PREFIX} rotate001: Succeeded in rotating.`);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} rotate001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name rotate002
     * @tc.number PixelMapRotateTest_002
     * @tc.desc PixelMap rotate with 90 degrees
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('rotate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} rotate002: Starting rotate test.`);
        expect(pixelMap.isEditable).assertTrue();

        const result = await pixelMap.rotate(90);
        expect(result === undefined).assertTrue();
        expect(pixelMap.isEditable).assertTrue();

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
     * @tc.name rotate003
     * @tc.number PixelMapRotateTest_003
     * @tc.desc PixelMap rotate with 180 degrees
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('rotate003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} rotate003: Starting rotate test.`);
        expect(pixelMap.isEditable).assertTrue();

        const result = await pixelMap.rotate(180);
        expect(result === undefined).assertTrue();
        expect(pixelMap.isEditable).assertTrue();

        console.info(`${LOG_PREFIX} rotate003: Succeeded in rotating.`);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} rotate003 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name rotate004
     * @tc.number PixelMapRotateTest_004
     * @tc.desc PixelMap rotate with 270 degrees
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('rotate004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} rotate004: Starting rotate test.`);
        expect(pixelMap.isEditable).assertTrue();

        const result = await pixelMap.rotate(270);
        expect(result === undefined).assertTrue();
        expect(pixelMap.isEditable).assertTrue();

        console.info(`${LOG_PREFIX} rotate004: Succeeded in rotating.`);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} rotate004 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name rotate005
     * @tc.number PixelMapRotateTest_005
     * @tc.desc PixelMap rotate with 360 degrees
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('rotate005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} rotate005: Starting rotate test.`);
        expect(pixelMap.isEditable).assertTrue();

        const result = await pixelMap.rotate(360);
        expect(result === undefined).assertTrue();
        expect(pixelMap.isEditable).assertTrue();

        console.info(`${LOG_PREFIX} rotate005: Succeeded in rotating.`);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} rotate005 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name rotate006
     * @tc.number PixelMapRotateTest_006
     * @tc.desc PixelMap rotate with 45 degrees
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('rotate006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} rotate006: Starting rotate test.`);
        expect(pixelMap.isEditable).assertTrue();

        const result = await pixelMap.rotate(45);
        expect(result === undefined).assertTrue();
        expect(pixelMap.isEditable).assertTrue();

        console.info(`${LOG_PREFIX} rotate006: Succeeded in rotating.`);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} rotate006 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name rotate007
     * @tc.number PixelMapRotateTest_007
     * @tc.desc PixelMap rotate with negative 90 degrees
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('rotate007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} rotate007: Starting rotate test.`);
        expect(pixelMap.isEditable).assertTrue();

        const result = await pixelMap.rotate(-90);
        expect(result === undefined).assertTrue();
        expect(pixelMap.isEditable).assertTrue();

        console.info(`${LOG_PREFIX} rotate007: Succeeded in rotating.`);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} rotate007 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name rotate008
     * @tc.number PixelMapRotateTest_008
     * @tc.desc PixelMap rotate multiple times
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('rotate008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} rotate008: Starting multiple rotate test.`);
        expect(pixelMap.isEditable).assertTrue();

        await pixelMap.rotate(90);
        expect(pixelMap.isEditable).assertTrue();
        await pixelMap.rotate(90);
        expect(pixelMap.isEditable).assertTrue();
        await pixelMap.rotate(90);
        expect(pixelMap.isEditable).assertTrue();
        await pixelMap.rotate(90);
        expect(pixelMap.isEditable).assertTrue();

        console.info(`${LOG_PREFIX} rotate008: Succeeded in multiple rotations.`);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} rotate008 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name rotate009
     * @tc.number PixelMapRotateTest_009
     * @tc.desc PixelMap rotate after crop
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('rotate009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 4 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} rotate009: Starting rotate after crop test.`);
        expect(pixelMap.isEditable).assertTrue();

        const region: image.Region = { x: 0, y: 0, size: { width: 2, height: 4 } };
        await pixelMap.crop(region);
        expect(pixelMap.isEditable).assertTrue();

        const result = await pixelMap.rotate(90);
        expect(result === undefined).assertTrue();
        expect(pixelMap.isEditable).assertTrue();

        console.info(`${LOG_PREFIX} rotate009: Succeeded in rotating after crop.`);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} rotate009 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name readPixelsToBufferPromise001
     * @tc.number PixelMapReadPixelsToBufferTest_001
     * @tc.desc PixelMap readPixelsToBuffer with Promise - success callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('readPixelsToBufferPromise001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96); // 96 is the required pixel buffer size: height * width * 4.
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);

        const readBuffer: ArrayBuffer = new ArrayBuffer(pixelMap.getPixelBytesNumber());
        await pixelMap.readPixelsToBuffer(readBuffer);

        expect(readBuffer != null).assertTrue();
        expect(readBuffer.byteLength).assertEqual(pixelMap.getPixelBytesNumber());
        console.info(`${LOG_PREFIX} readPixelsToBufferPromise001: Succeeded in reading image pixel data.`);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} readPixelsToBufferPromise001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name readPixelsToBufferCallback001
     * @tc.number PixelMapReadPixelsToBufferTest_002
     * @tc.desc PixelMap readPixelsToBuffer with AsyncCallback - success callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('readPixelsToBufferCallback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96); // 96 is the required pixel buffer size: height * width * 4.
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);

        const readBuffer: ArrayBuffer = new ArrayBuffer(pixelMap.getPixelBytesNumber());
        pixelMap.readPixelsToBuffer(readBuffer, (error: BusinessError) => {
          if (error) {
            console.error(
              `${LOG_PREFIX} readPixelsToBufferCallback001 failed: code ${error.code}, message ${error.message}`
            );
            expect().assertFail();
            done();
          } else {
            expect(readBuffer != null).assertTrue();
            expect(readBuffer.byteLength).assertEqual(pixelMap.getPixelBytesNumber());
            console.info(`${LOG_PREFIX} readPixelsToBufferCallback001: Succeeded in reading image pixel data.`);
            pixelMap.release();
            done();
          }
        });
      } catch (error) {
        console.error(`${LOG_PREFIX} readPixelsToBufferCallback001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name readPixelsToBufferPromiseNull001
     * @tc.number PixelMapReadPixelsToBufferTest_003
     * @tc.desc PixelMap readPixelsToBuffer with Promise - null parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'readPixelsToBufferPromiseNull001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          const color: ArrayBuffer = new ArrayBuffer(96); // 96 is the required pixel buffer size: height * width * 4.
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 },
          };
          const pixelMap = image.createPixelMapSync(color, opts);
          console.info(`${LOG_PREFIX} readPixelsToBufferPromiseNull001: Starting test with null parameter.`);

          // Test with null parameter
          await pixelMap.readPixelsToBuffer(null);
          await pixelMap.release();
          done();
        } catch (error) {
          // Expected to fail with null parameter
          console.error(
            `${LOG_PREFIX} readPixelsToBufferPromiseNull001: Failed with null parameter as expected, code: ${error}`
          );
          expect().assertFail(); // Parameter error
          done();
        }
      }
    );

    /**
     * @tc.name readPixelsToBufferPromiseUndefined001
     * @tc.number PixelMapReadPixelsToBufferTest_005
     * @tc.desc PixelMap readPixelsToBuffer with Promise - undefined parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'readPixelsToBufferPromiseUndefined001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          const color: ArrayBuffer = new ArrayBuffer(96); // 96 is the required pixel buffer size: height * width * 4.
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 },
          };
          const pixelMap = image.createPixelMapSync(color, opts);
          console.info(`${LOG_PREFIX} readPixelsToBufferPromiseUndefined001: Starting test with undefined parameter.`);

          // Test with undefined parameter
          await pixelMap.readPixelsToBuffer(undefined);
          await pixelMap.release();
          done();
        } catch (error) {
          // Expected to fail with undefined parameter
          console.error(
            `${LOG_PREFIX} readPixelsToBufferPromiseUndefined001: Failed with undefined parameter as expected, code: `
              + `${error}`
          );
          expect().assertFail(); // Parameter error
          done();
        }
      }
    );

    /**
     * @tc.name readPixelsToBufferPromiseInvalidSize001
     * @tc.number PixelMapReadPixelsToBufferTest_007
     * @tc.desc PixelMap readPixelsToBuffer with Promise - invalid buffer size (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'readPixelsToBufferPromiseInvalidSize001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          const color: ArrayBuffer = new ArrayBuffer(96); // 96 is the required pixel buffer size: height * width * 4.
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 },
          };
          const pixelMap = image.createPixelMapSync(color, opts);
          console.info(
            `${LOG_PREFIX} readPixelsToBufferPromiseInvalidSize001: Starting test with invalid buffer size.`
          );

          // Test with incorrect buffer size
          const readBuffer: ArrayBuffer = new ArrayBuffer(10); // Too small
          try {
            await pixelMap.readPixelsToBuffer(readBuffer);
            expect().assertFail();
            done();
          } catch(err){
            expect(err).assertEqual(62980115);
            await pixelMap?.release();
            done();
          }
        } catch (error) {
          // Expected to fail with incorrect buffer size
          console.error(
            `${LOG_PREFIX} readPixelsToBufferPromiseInvalidSize001: Failed with invalid buffer size as expected, code: `
              + `${error}`
          );
          expect().assertFail();
          done();
        }
      }
    );

    /**
     * @tc.name readPixelsToBufferSync001
     * @tc.number PixelMapReadPixelsToBufferTest_008
     * @tc.desc PixelMap readPixelsToBufferSync - success case
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('readPixelsToBufferSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96); // 96 is the required pixel buffer size: height * width * 4.
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);

        const readBuffer: ArrayBuffer = new ArrayBuffer(pixelMap.getPixelBytesNumber());
        pixelMap.readPixelsToBufferSync(readBuffer);

        expect(readBuffer != null).assertTrue();
        expect(readBuffer.byteLength).assertEqual(pixelMap.getPixelBytesNumber());
        console.info(`${LOG_PREFIX} readPixelsToBufferSync001: Succeeded in reading image pixel data.`);
        await pixelMap.release();
        done();
      } catch (error) {
        console.error(`${LOG_PREFIX} readPixelsToBufferSync001 failed: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name readPixelsToBufferSyncNull001
     * @tc.number PixelMapReadPixelsToBufferTest_009
     * @tc.desc PixelMap readPixelsToBufferSync - null parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('readPixelsToBufferSyncNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(96); // 96 is the required pixel buffer size: height * width * 4.
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
        };
        const pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} readPixelsToBufferSyncNull001: Starting test with null parameter.`);

        // Test with null parameter
        pixelMap.readPixelsToBufferSync(null);
        await pixelMap.release();
        done();
      } catch (error) {
        // Expected to fail with null parameter
        console.error(
          `${LOG_PREFIX} readPixelsToBufferSyncNull001: Failed with null parameter as expected, code: ${error.code}`
        );
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name readPixelsToBufferSyncUndefined001
     * @tc.number PixelMapReadPixelsToBufferTest_010
     * @tc.desc PixelMap readPixelsToBufferSync - undefined parameter (should fail)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('readPixelsToBufferSyncUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          const color: ArrayBuffer = new ArrayBuffer(96); // 96 is the required pixel buffer size: height * width * 4.
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 },
          };
          const pixelMap = image.createPixelMapSync(color, opts);
          console.info(`${LOG_PREFIX} readPixelsToBufferSyncUndefined001: Starting test with undefined parameter.`);

          // Test with undefined parameter
          pixelMap.readPixelsToBufferSync(undefined);
          await pixelMap.release();
          done();
        } catch (error) {
          // Expected to fail with undefined parameter
          console.error(
            `${LOG_PREFIX} readPixelsToBufferSyncUndefined001: Failed with undefined parameter as expected, code: `
              + `${error.code}`
          );
          expect().assertFail();
          done();
        }
    });

    /**
     * @tc.name readPixelsToBufferDifferentFormats001
     * @tc.number PixelMapReadPixelsToBufferTest_011
     * @tc.desc PixelMap readPixelsToBuffer with different pixel formats
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('readPixelsToBufferDifferentFormats001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const color: ArrayBuffer = new ArrayBuffer(96); // 96 is the required pixel buffer size: height * width * 4.
          console.info(
            `${LOG_PREFIX} readPixelsToBufferDifferentFormats001: Starting test with different pixel formats.`
          );

          // Test with BGRA_8888 format
          const opts1: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.BGRA_8888,
            size: { height: 4, width: 6 },
          };
          const pixelMap1 = image.createPixelMapSync(color, opts1);
          const readBuffer1: ArrayBuffer = new ArrayBuffer(pixelMap1.getPixelBytesNumber());
          await pixelMap1.readPixelsToBuffer(readBuffer1);
          expect(readBuffer1 != null).assertTrue();
          expect(readBuffer1.byteLength).assertEqual(pixelMap1.getPixelBytesNumber());

          // Test with RGB_565 format
          const opts2: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGB_565,
            size: { height: 4, width: 6 },
          };
          const pixelMap2 = image.createPixelMapSync(color, opts2);
          const readBuffer2: ArrayBuffer = new ArrayBuffer(pixelMap2.getPixelBytesNumber());
          await pixelMap2.readPixelsToBuffer(readBuffer2);
          expect(readBuffer2 != null).assertTrue();
          expect(readBuffer2.byteLength).assertEqual(pixelMap2.getPixelBytesNumber());

          console.info(
            `${LOG_PREFIX} readPixelsToBufferDifferentFormats001: Succeeded in testing different pixel formats`
          );
          await pixelMap1.release();
          await pixelMap2.release();
          done();
        } catch (error) {
          console.error(`${LOG_PREFIX} readPixelsToBufferDifferentFormats001 failed: ${error}`);
          expect().assertFail();
          done();
        }
    });

    
  })
}