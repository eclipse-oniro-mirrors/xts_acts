/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base';
import image from '@ohos.multimedia.image';

export default function graphicImagePixelMapAPI23() {
  describe('graphicImagePixelMapAPI23', ()=> {
    console.log('describe graphicImagePixelMapAPI23 start!!!')
    beforeAll(async ()=> {
    })

    /**
     * @tc.name   graphicImagePixelMapAPI23_0100
     * @tc.number graphicImagePixelMapAPI23_0100
     * @tc.desc   image pixelMap createPixelMapFromSurfaceWithTransformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("graphicImagePixelMapAPI23_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      image.createPixelMapFromSurfaceWithTransformation('111111', true)
      .then((pixelMap: image.PixelMap) => {
        console.info('www data graphicImagePixelMapAPI23_0100 PixelMap created successfully.');
        expect().assertFail();
        done();
      }).catch((e: Error) => {
        console.error(`www data graphicImagePixelMapAPI23_0100 Failed to create PixelMap. Code: ${e}`);
        expect(Number(e) == 7600104).assertTrue();
        done();
      });
    });

    /**
     * @tc.name   graphicImagePixelMapAPI23_0200
     * @tc.number graphicImagePixelMapAPI23_0200
     * @tc.desc   image pixelMap createPixelMapFromSurfaceWithTransformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("graphicImagePixelMapAPI23_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      image.createPixelMapFromSurfaceWithTransformation(null, true)
      .then((pixelMap: image.PixelMap) => {
        console.info('www data graphicImagePixelMapAPI23_0200 PixelMap created successfully.');
        expect().assertFail();
        done();
      }).catch((e: Error) => {
        console.error(`www data graphicImagePixelMapAPI23_0200 Failed to create PixelMap. Code: ${e}`);
        expect(Number(e) == 7600206).assertTrue();
        done();
      });
    });

    /**
     * @tc.name   graphicImagePixelMapAPI23_0300
     * @tc.number graphicImagePixelMapAPI23_0300
     * @tc.desc   image pixelMap createPixelMapFromSurfaceWithTransformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("graphicImagePixelMapAPI23_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      image.createPixelMapFromSurfaceWithTransformation('', true)
      .then((pixelMap: image.PixelMap) => {
        console.info('www data graphicImagePixelMapAPI23_0300 PixelMap created successfully.');
        expect().assertFail();
        done();
      }).catch((e: Error) => {
        console.error(`www data graphicImagePixelMapAPI23_0300 Failed to create PixelMap. Code: ${e}`);
        expect(Number(e) == 7600206).assertTrue();
        done();
      });
    });

    /**
     * @tc.name   graphicImagePixelMapAPI23_0400
     * @tc.number graphicImagePixelMapAPI23_0400
     * @tc.desc   image pixelMap createPixelMapFromSurfaceWithTransformationSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("graphicImagePixelMapAPI23_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      try {
        const pixelMap: image.PixelMap = image.createPixelMapFromSurfaceWithTransformationSync('111111', true);
        console.info('www data graphicImagePixelMapAPI23_0400 PixelMap created successfully.');
        expect().assertFail();
        done();
      } catch (e) {
        const error = e as BusinessError;
        console.error(`www data graphicImagePixelMapAPI23_0400 Failed to create PixelMap. 
        Code: ${error.code}, message: ${error.message}`);
        expect(Number(error.code) == 7600104).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   graphicImagePixelMapAPI23_0500
     * @tc.number graphicImagePixelMapAPI23_0500
     * @tc.desc   image pixelMap createPixelMapFromSurfaceWithTransformationSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("graphicImagePixelMapAPI23_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      try {
        const pixelMap: image.PixelMap = image.createPixelMapFromSurfaceWithTransformationSync(null, true);
        console.info('www data graphicImagePixelMapAPI23_0500 PixelMap created successfully.');
        expect().assertFail();
        done();
      } catch (e) {
        const error = e as BusinessError;
        console.error(`www data graphicImagePixelMapAPI23_0500 Failed to create PixelMap. 
        Code: ${error.code}, message: ${error.message}`);
        expect(Number(error.code) == 7600206).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   graphicImagePixelMapAPI23_0600
     * @tc.number graphicImagePixelMapAPI23_0600
     * @tc.desc   image pixelMap createPixelMapFromSurfaceWithTransformationSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("graphicImagePixelMapAPI23_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      try {
        const pixelMap: image.PixelMap = image.createPixelMapFromSurfaceWithTransformationSync('', true);
        console.info('www data graphicImagePixelMapAPI23_0600 PixelMap created successfully.');
        expect().assertFail();
        done();
      } catch (e) {
        const error = e as BusinessError;
        console.error(`www data graphicImagePixelMapAPI23_0600 Failed to create PixelMap. 
        Code: ${error.code}, message: ${error.message}`);
        expect(Number(error.code) == 7600206).assertTrue();
        done();
      }
    });

  })
}