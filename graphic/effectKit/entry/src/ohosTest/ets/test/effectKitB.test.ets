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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import image from '@ohos.multimedia.image';
import effectKit from '@ohos.effectKit';
import { testPng, testJpg } from '../model/testImg';
import { BusinessError } from '@ohos.base';

export default function effectKitBTest(context, windowStage) {
  describe('effectKitBTest', () => {
    console.log('describe effectKitBTest start!!!');

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICEFFECTKIT_JS_API_0010
     * @tc.name      : testGetTopProportionColors
     * @tc.desc      : Read the first color value of the image. The number is specified by colorCount. The result is written into the Color array and returned in synchronization mode.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetTopProportionColors', 0, (done: Function) => {
      let msgStr = 'testGetTopProportionColors'
      console.log(msgStr + ' begin');
      const color = new ArrayBuffer(96);
      let opts : image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {
          height: 4,
          width: 6
        }
      }
      image.createPixelMap(color, opts).then((pixelMap) => {
        console.info(msgStr + ' Succeed in createPixelMap. ');
        try{
          effectKit.createColorPicker(pixelMap, (error, colorPicker) => {
            if (error) {
              console.error(msgStr + ' Failed to create color picker. ' + JSON.stringify(error));
            } else {
              console.info(msgStr + ' Succeed in creating color picker.');
              try{
                  let colors = colorPicker.getTopProportionColors(2);
                  console.info(msgStr + ' Succeed in getTopProportionColors.');
                  expect(true).assertTrue()
                  done()
              }catch(err){
                  console.info(msgStr + ' Succeed in getTopProportionColors. ' + JSON.stringify(err));
                  expect().assertFail()
                  done()
              }
            }
          })

        }catch(err){
          console.info(msgStr + ' Failed in creating color picker. ' + JSON.stringify(err));
          expect().assertFail()
          done()
        }
      }).catch(err => {
        console.info(msgStr + ' Failed in createPixelMap. ' + JSON.stringify(err));
        expect().assertFail()
        done()
      })
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICEFFECTKIT_JS_API_0010
     * @tc.name      : testInvert
     * @tc.desc      : Read the first color value of the image. The number is specified by colorCount. The result is written into the Color array and returned in synchronization mode.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testInvert', 0, (done: Function) => {
      let msgStr = 'testInvert'
      console.log(msgStr + ' begin');
      const color = new ArrayBuffer(96);
      let opts : image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {
          height: 4,
          width: 6
        }
      };
      image.createPixelMap(color, opts).then((pixelMap) => {
        console.info(msgStr + ' Succeed in createPixelMap. ');
        try{
          let headFilter = effectKit.createEffect(pixelMap);
          console.info(msgStr + ' Succeed in createEffect. ');
          if (headFilter != null) {
            try{
              headFilter.invert();
              console.info(msgStr + ' Succeed in invert. ');
              expect(true).assertTrue()
              done()
            }catch(err){
              console.info(msgStr + ' Failed in invert. ' + JSON.stringify(err));
              expect().assertFail()
              done()
            }
          }else{
            console.log(msgStr + ' headFilter = null. ')
            expect().assertFail()
            done()
          }
        }catch(err){
          console.info(msgStr + ' Failed in createEffect. ' + JSON.stringify(err));
          expect().assertFail()
          done()
        }
      }).catch(err => {
        console.info(msgStr + ' Failed in createPixelMap. ' + JSON.stringify(err));
        expect().assertFail()
        done()
      })
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICEFFECTKIT_JS_API_0010
     * @tc.name      : testSetColorMatrix
     * @tc.desc      : Read the first color value of the image. The number is specified by colorCount. The result is written into the Color array and returned in synchronization mode.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetColorMatrix', 0, (done: Function) => {
      let msgStr = 'testSetColorMatrix'
      console.log(msgStr + ' begin');
      const color = new ArrayBuffer(96);
      let opts : image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {
          height: 4,
          width: 6
        }
      };
      image.createPixelMap(color, opts).then((pixelMap) => {
        console.info(msgStr + ' Succeed in createPixelMap. ');
        try{
          let colorMatrix:Array<number> = [
            0.2126,0.7152,0.0722,0,0,
            0.2126,0.7152,0.0722,0,0,
            0.2126,0.7152,0.0722,0,0,
            0,0,0,1,0
          ];
          let headFilter = effectKit.createEffect(pixelMap);
          console.info(msgStr + ' Succeed in createEffect. ');
          if (headFilter != null) {
            try{
              headFilter.setColorMatrix(colorMatrix);
              console.info(msgStr + ' Succeed in setColorMatrix. ');
              expect(true).assertTrue()
              done()
            }catch(err){
              console.info(msgStr + ' Failed in setColorMatrix. ' + JSON.stringify(err));
              expect().assertFail()
              done()
            }
          }else{
            console.log(msgStr + ' headFilter = null. ')
            expect().assertFail()
            done()
          }
        }catch(err){
          console.info(msgStr + ' Failed in createEffect. ' + JSON.stringify(err));
          expect().assertFail()
          done()
        }
      }).catch(err => {
        console.info(msgStr + ' Failed in createPixelMap. ' + JSON.stringify(err));
        expect().assertFail()
        done()
      })
    })


  })
}