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

export default function graphicImagePixelMapAPI22() {
  describe('graphicImagePixelMapAPI22', ()=> {
    console.log('describe graphicImagePixelMapAPI22 start!!!')
    beforeAll(async ()=> {
    })

    /**
     * @tc.name   graphicImagePixelMapAPI22_0100
     * @tc.number graphicImagePixelMapAPI22_0100
     * @tc.desc   image pixelMap newAPI22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("graphicImagePixelMapAPI22_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } 
      }
      let pixelMap = image.createPixelMapSync(color, opts);
      if(pixelMap != undefined){
        console.info('www data create pixelMap pass');
        let flag1 = pixelMap.isReleased();
        console.info('www data isReleased', flag1);
        expect(flag1).assertFalse();
        let id1 = pixelMap.getUniqueId();
        console.info('www data getUniqueId', id1);
        expect(id1).assertLargerOrEqual(0);
        pixelMap.release();
        let flag2 = pixelMap.isReleased();
        console.info('www data isReleased', flag2);
        expect(flag2).assertTrue();
        try {
          let id2 = pixelMap.getUniqueId();
          console.info('www data getUniqueId', id2);
          expect().assertFail();
        } catch(err){
          console.info('www data getUniqueId error', err.code);
          expect(Number(err.code) == 7600201).assertTrue();
        }
        done();
      } else {
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   graphicImagePixelMapAPI22_0200
     * @tc.number graphicImagePixelMapAPI22_0200
     * @tc.desc   image pixelMap newAPI22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("graphicImagePixelMapAPI22_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } 
      }
      let region: image.Region = { x: 0, y: 0, size: { height: 1, width: 1 } };
      let pixelMap = image.createPixelMapSync(color, opts);
      try {
        pixelMap.createCroppedAndScaledPixelMapSync(region, 10, 10);
        console.info('www data createCroppedAndScaledPixelMapSync pass 111');
      }catch(err){
        console.info('www data createCroppedAndScaledPixelMapSync error 111', JSON.stringify(err));
        expect().assertFail();
      }
      try {
        pixelMap.createCroppedAndScaledPixelMapSync(region, 10, 10, image.AntiAliasingLevel.NONE);
        console.info('www data createCroppedAndScaledPixelMapSync pass 222');
      }catch(err){
        console.info('www data createCroppedAndScaledPixelMapSync error 222', JSON.stringify(err));
        expect().assertFail();
      }
      try {
        pixelMap.createCroppedAndScaledPixelMapSync(region, 10, 10, image.AntiAliasingLevel.LOW);
        console.info('www data createCroppedAndScaledPixelMapSync pass 333');
      }catch(err){
        console.info('www data createCroppedAndScaledPixelMapSync error 333', JSON.stringify(err));
        expect().assertFail();
      }
      try {
        pixelMap.createCroppedAndScaledPixelMapSync(region, 10, 10, image.AntiAliasingLevel.MEDIUM);
        console.info('www data createCroppedAndScaledPixelMapSync pass 444');
      }catch(err){
        console.info('www data createCroppedAndScaledPixelMapSync error 444', JSON.stringify(err));
        expect().assertFail();
      }
      try {
        pixelMap.createCroppedAndScaledPixelMapSync(region, 10, 10, image.AntiAliasingLevel.HIGH);
        console.info('www data createCroppedAndScaledPixelMapSync pass 555');
      }catch(err){
        console.info('www data createCroppedAndScaledPixelMapSync error 555', JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   graphicImagePixelMapAPI22_0300
     * @tc.number graphicImagePixelMapAPI22_0300
     * @tc.desc   image pixelMap newAPI22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("graphicImagePixelMapAPI22_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } 
      }
      let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
      let pixelMap = image.createPixelMapSync(color, opts);
      try {
        pixelMap.createCroppedAndScaledPixelMapSync(region, 10, 10);
        console.info('www data createCroppedAndScaledPixelMapSync pass');
        expect().assertFail();
      }catch(err){
        console.info('www data createCroppedAndScaledPixelMapSync error', JSON.stringify(err));
        expect(Number(err.code) == 7600204).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   graphicImagePixelMapAPI22_0400
     * @tc.number graphicImagePixelMapAPI22_0400
     * @tc.desc   image pixelMap newAPI22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("graphicImagePixelMapAPI22_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } 
      }
      let region: image.Region = { x: 0, y: 0, size: { height: 1, width: 1 } };
      let pixelMap = image.createPixelMapSync(color, opts);
      pixelMap.release();
      try {
        pixelMap.createCroppedAndScaledPixelMapSync(region, 10, 10);
        console.info('www data createCroppedAndScaledPixelMapSync pass');
        expect().assertFail();
      }catch(err){
        console.info('www data createCroppedAndScaledPixelMapSync error', JSON.stringify(err));
        expect(Number(err.code) == 7600201).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   graphicImagePixelMapAPI22_0500
     * @tc.number graphicImagePixelMapAPI22_0500
     * @tc.desc   image pixelMap newAPI22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("graphicImagePixelMapAPI22_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: 8, size: { height: 4, width: 6 } 
      }
      let region: image.Region = { x: 0, y: 0, size: { height: 1, width: 1 } };
      let pixelMap = image.createPixelMapSync(color, opts);
      try {
        pixelMap.createCroppedAndScaledPixelMapSync(region, 10, 10);
        console.info('www data createCroppedAndScaledPixelMapSync pass');
        expect().assertFail();
      }catch(err){
        console.info('www data createCroppedAndScaledPixelMapSync error', JSON.stringify(err));
        expect(Number(err.code) == 7600205).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   graphicImagePixelMapAPI22_0600
     * @tc.number graphicImagePixelMapAPI22_0600
     * @tc.desc   image pixelMap newAPI22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("graphicImagePixelMapAPI22_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } 
      }
      let region: image.Region = { x: 0, y: 0, size: { height: 1, width: 1 } };
      let pixelMap = image.createPixelMapSync(color, opts);
      await pixelMap.createCroppedAndScaledPixelMap(region, 10, 10).then(()=>{
        console.info('www data createCroppedAndScaledPixelMap pass 111');
      }).catch((err: BusinessError) => {
        console.info('www data createCroppedAndScaledPixelMap error 111', JSON.stringify(err));
        expect().assertFail();
      });
      await pixelMap.createCroppedAndScaledPixelMap(region, 10, 10, image.AntiAliasingLevel.NONE).then(()=>{
        console.info('www data createCroppedAndScaledPixelMap pass 222');
      }).catch((err: BusinessError) => {
        console.info('www data createCroppedAndScaledPixelMap error 222', JSON.stringify(err));
        expect().assertFail();
      });
      await pixelMap.createCroppedAndScaledPixelMap(region, 10, 10, image.AntiAliasingLevel.LOW).then(()=>{
        console.info('www data createCroppedAndScaledPixelMap pass 333');
      }).catch((err: BusinessError) => {
        console.info('www data createCroppedAndScaledPixelMap error 333', JSON.stringify(err));
        expect().assertFail();
      });
      await pixelMap.createCroppedAndScaledPixelMap(region, 10, 10, image.AntiAliasingLevel.MEDIUM).then(()=>{
        console.info('www data createCroppedAndScaledPixelMap pass 444');
      }).catch((err: BusinessError) => {
        console.info('www data createCroppedAndScaledPixelMap error 444', JSON.stringify(err));
        expect().assertFail();
      });
      await pixelMap.createCroppedAndScaledPixelMap(region, 10, 10, image.AntiAliasingLevel.HIGH).then(()=>{
        console.info('www data createCroppedAndScaledPixelMap pass 555');
      }).catch((err: BusinessError) => {
        console.info('www data createCroppedAndScaledPixelMap error 555', JSON.stringify(err));
        expect().assertFail();
      });
      done();
    });

    /**
     * @tc.name   graphicImagePixelMapAPI22_0700
     * @tc.number graphicImagePixelMapAPI22_0700
     * @tc.desc   image pixelMap newAPI22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("graphicImagePixelMapAPI22_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } 
      }
      let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
      let pixelMap = image.createPixelMapSync(color, opts);
      await pixelMap.createCroppedAndScaledPixelMap(region, 10, 10).then(()=>{
        console.info('www data createCroppedAndScaledPixelMap pass');
        expect().assertFail();
      }).catch((err: BusinessError) => {
        console.info('www data createCroppedAndScaledPixelMap error', JSON.stringify(err));
        expect(Number(err.code) == 7600204).assertTrue();
      });
      done();
    });

    /**
     * @tc.name   graphicImagePixelMapAPI22_0800
     * @tc.number graphicImagePixelMapAPI22_0800
     * @tc.desc   image pixelMap newAPI22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("graphicImagePixelMapAPI22_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } 
      }
      let region: image.Region = { x: 0, y: 0, size: { height: 1, width: 1 } };
      let pixelMap = image.createPixelMapSync(color, opts);
      pixelMap.release();
      try {
        await pixelMap.createCroppedAndScaledPixelMap(region, 10, 10).then(()=>{
          console.info('www data createCroppedAndScaledPixelMap pass');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.info('www data createCroppedAndScaledPixelMap error', JSON.stringify(err));
          expect(Number(err.code) == 7600201).assertTrue();
        });
      } catch(err){
        expect(Number(err.code) == 7600201).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   graphicImagePixelMapAPI22_0900
     * @tc.number graphicImagePixelMapAPI22_0900
     * @tc.desc   image pixelMap newAPI22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("graphicImagePixelMapAPI22_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: 8, size: { height: 4, width: 6 } 
      }
      let region: image.Region = { x: 0, y: 0, size: { height: 1, width: 1 } };
      let pixelMap = image.createPixelMapSync(color, opts);
      
      await pixelMap.createCroppedAndScaledPixelMap(region, 10, 10).then(()=>{
        console.info('www data createCroppedAndScaledPixelMap pass');
      }).catch((err: BusinessError) => {
        console.info('www data createCroppedAndScaledPixelMap error', JSON.stringify(err));
        expect(Number(err.code) == 7600205).assertTrue();
      });
      done();
    });

  })
}