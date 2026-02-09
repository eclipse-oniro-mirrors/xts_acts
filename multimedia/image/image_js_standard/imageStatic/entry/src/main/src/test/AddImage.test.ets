/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import image from "@ohos.multimedia.image";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, DEFAULT, Hypium, Level } from '../../../hypium/index';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';
import { initialize } from './AbilityContextHelper.test';
import resourceManager from '@ohos.resourceManager';
import hilog from '@ohos.hilog';

export default function addImage() {
  describe("addImage", () => {
    const RGBA_8888 = image.PixelMapFormat.RGBA_8888;
    let incSouce: image.ImageSource | undefined;
    let filesDir: string | undefined | null;

    beforeAll(async () => {
      await initialize();
      filesDir = Hypium.get('filesDir') as string | undefined | null;
      console.info("beforeAll case");
    });
    beforeEach(() => {
      console.info("beforeEach case");
    });
    afterEach(async () => {
      console.info("afterEach case");
      if (incSouce != undefined) {
        try {
          await incSouce!.release();
        } catch (error) {
          console.info("incSouce release faile :" + error);
        }
      }
    });
    afterAll(async () => {
      console.info("afterAll case");
    });

    const getBuffer = (fileName: string) => {
      const filePath = filesDir + '/' + fileName;
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize)
      fs.readSync(file.fd, bufferRead)
      return bufferRead;
    }

    const createIncrementalSourcePromise = async (
      done: () => void,
      testNum: string,
      type: string,
      opts?: image.SourceOptions | undefined
    ) => {
      let testimagebuffer = getBuffer("test.png");
      console.info(`${testNum} 0001 ` + testimagebuffer.byteLength);
      let bufferSize = testimagebuffer.byteLength;
      let offset: int = 0;
      if (type == "sourceOpts" && opts != undefined) {
        console.info(`${testNum} have sourceopts`);
        incSouce = image.createIncrementalSource(new ArrayBuffer(1), opts);
      } else {
        console.info(`${testNum} no sourceopts`);
        incSouce = image.createIncrementalSource(new ArrayBuffer(1));
      }
      let ret: boolean;
      let isFinished: boolean = false;
      while (offset < testimagebuffer.byteLength) {
        let oneStep = testimagebuffer.slice(offset, offset + bufferSize);
        console.info(`${testNum} 0002 ` + oneStep.byteLength);
        if (oneStep.byteLength < bufferSize) {
          isFinished = true;
        }
        try {
          if (incSouce == undefined) {
            console.info(`${testNum} createIncrementalSource failed`);
            ret = false;
            expect(false).assertTrue();
            done();
          } else {
            await incSouce!.updateData(oneStep, isFinished, 0, oneStep.byteLength as int);
            offset = offset + oneStep.byteLength as int;
            console.info(`${testNum} 0003 ` + offset);
            ret = true;
          }
        } catch (error) {
          console.info(`${testNum} updateData failed`);
          expect(false).assertTrue();
          ret = false;
        }
      }
      if (ret && incSouce != undefined) {
        console.info(`${testNum} updateData success `);
        let decodingOptions: image.DecodingOptions = {
          sampleSize: 1
        };
        incSouce!.createPixelMap(decodingOptions, (err: BusinessError | null, pixelmap) => {
          if (err && err.code) {
            console.info(`${testNum} createPixelMap err: ` + err);
            expect(false).assertTrue();
            done();
          }
          console.info(`${testNum} 0004` + pixelmap);
          expect(pixelmap != undefined).assertTrue();
          done();
        });
      } else {
        expect(false).assertTrue();
        done();
      }
    }

    const createIncrementalSourceCb = async (
      done: () => void,
      testNum: string,
      type: string,
      opts: image.SourceOptions | undefined
    ) => {
      let testimagebuffer = getBuffer("test.png");
      console.info(`${testNum} 0001 ` + testimagebuffer.byteLength);
      let bufferSize = testimagebuffer.byteLength;
      let offset = 0;
      if (type == "sourceOpts" && opts != undefined) {
        incSouce = image.createIncrementalSource(new ArrayBuffer(1), opts);
      } else {
        incSouce = image.createIncrementalSource(new ArrayBuffer(1));
      }
      let ret: boolean;
      let isFinished: boolean = false;
      while (offset < testimagebuffer.byteLength) {
        let oneStep = testimagebuffer.slice(offset, offset + bufferSize);
        console.info(`${testNum} 0002 ` + oneStep.byteLength);
        if (oneStep.byteLength < bufferSize) {
          isFinished = true;
        }
        if (incSouce == undefined) {
          console.info(`${testNum} createIncrementalSource failed`);
          ret = false;
          expect(false).assertTrue();
          done();
        } else {
          ret = await new Promise<boolean>((res) => {
            incSouce!.updateData(oneStep, isFinished, 0, oneStep.byteLength as int, (err: BusinessError | null) => {
              if (err && err.code) {
                res(false);
              } else {
                res(true);
              }
            });
          });
        }
        if (!ret) {
          console.info(`${testNum} updateData failed`);
          expect(ret).assertTrue();
          break;
        }
        offset = offset + oneStep.byteLength as int;
        console.info(`${testNum} 0003 ` + offset);
      }
      if (ret && incSouce != undefined) {
        console.info(`${testNum} updateData success `);
        let decodingOptions: image.DecodingOptions = {
          sampleSize: 1
        };
        incSouce!.createPixelMap(decodingOptions, (err: BusinessError | null, pixelmap) => {
          if (err && err.code) {
            console.info(`${testNum} createPixelMap err: ` + err);
            expect(false).assertTrue();
            done();
          }
          console.info(`${testNum} 0004` + pixelmap);
          expect(pixelmap != undefined).assertTrue();
          done();
        });
      } else {
        expect(false).assertTrue();
        done();
      }
    }
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_PROMISE_STATIC_0100
     * @tc.desc   createIncrementalSource-updateData-png-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_PROMISE_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let sourceSize: image.Size ={ height: 4, width: 6 };
      let opts: image.SourceOptions = {
        sourceDensity: 240,
        sourcePixelFormat: RGBA_8888,
        sourceSize
      };
      await createIncrementalSourcePromise(done,
        "SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_PROMISE_STATIC_0100", "noSourceOpts", undefined);
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_PROMISE_STATIC_0200
     * @tc.desc   createIncrementalSource-updateData-png-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_PROMISE_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let sourceSize: image.Size ={ height: 4, width: 6 };
      let opts: image.SourceOptions = {
        sourceDensity: 240,
        sourcePixelFormat: RGBA_8888,
        sourceSize
      };
      await createIncrementalSourcePromise(done,
        "SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_PROMISE_STATIC_0200", "sourceOpts", opts);
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_CALLBACK_STATIC_0100
     * @tc.desc   createIncrementalSource-updateData-png-callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_CALLBACK_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let sourceSize: image.Size ={ height: 4, width: 6 };
      let opts: image.SourceOptions = {
        sourceDensity: 240,
        sourcePixelFormat: RGBA_8888,
        sourceSize
      };
      await createIncrementalSourceCb(done, "SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_CALLBACK_STATIC_0100",
        "noSourceOpts", undefined);
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_CALLBACK_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_CALLBACK_STATIC_0200
     * @tc.desc   createIncrementalSource-updateData-png-callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_CALLBACK_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let sourceSize: image.Size ={ height: 4, width: 6 };
      let opts: image.SourceOptions = {
        sourceDensity: 240,
        sourcePixelFormat: RGBA_8888,
        sourceSize
      };
      await createIncrementalSourceCb(done, "SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_CALLBACK_STATIC_0200",
        "sourceOpts", opts);
    });
  });
}
