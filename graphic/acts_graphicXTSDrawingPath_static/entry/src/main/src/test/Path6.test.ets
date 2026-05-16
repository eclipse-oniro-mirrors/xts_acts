/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from "../../../hypium/index";
import drawing from '@ohos.graphics.drawing';
import image from '@ohos.multimedia.image';
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';

export default function drawingTsPath6Test() {
  describe('DrawingTsPath6Test', () => {
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_4200
     * @tc.name      testPathIsInverseFillTypeNormal1Static
     * @tc.desc      testPathIsInverseFillTypeNormal1Static
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testPathIsInverseFillTypeNormal1Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathIsInverseFillTypeNormal1Static';
      let path: drawing.Path = new drawing.Path();
      try {
        let result = path.isInverseFillType();
        expect(result).assertEqual(false);
        console.info(msg + 'isInverseFillType successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `isInverseFillType errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_4201
     * @tc.name      testPathIsInverseFillTypeNormal2Static
     * @tc.desc      testPathIsInverseFillTypeNormal2Static
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level0
     */
    it('testPathIsInverseFillTypeNormal2Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIsInverseFillTypeNormal2Static';
      let path: drawing.Path = new drawing.Path();
      try {
        path.setFillType(drawing.PathFillType.WINDING);
        let result= path.isInverseFillType()
        expect(result).assertEqual(false);
        console.info(msg + 'isInverseFillType 1 successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `isInverseFillType 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        path.setFillType(drawing.PathFillType.INVERSE_WINDING);
        let result = path.isInverseFillType()
        expect(result).assertEqual(true);
        console.info(msg + 'isInverseFillType 2 successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `isInverseFillType 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        path.setFillType(drawing.PathFillType.EVEN_ODD);
        let result= path.isInverseFillType()
        expect(result).assertEqual(false);
        console.info(msg + 'isInverseFillType 3 successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `isInverseFillType 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        path.setFillType(drawing.PathFillType.INVERSE_EVEN_ODD);
        let result= path.isInverseFillType()
        expect(result).assertEqual(true);
        console.info(msg + 'isInverseFillType 4 successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `isInverseFillType 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_4202
     * @tc.name      testPathIsInverseFillTypeMultipleCallsStatic
     * @tc.desc      testPathIsInverseFillTypeMultipleCallsStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level3
     */
    it('testPathIsInverseFillTypeMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathIsInverseFillTypeMultipleCallsStatic';
      let path: drawing.Path = new drawing.Path();
      try {
        for (let i = 0; i < 20; i += 1) {
          path.setFillType(drawing.PathFillType.WINDING);
          let result = path.isInverseFillType()
          expect(result).assertEqual(false);
          console.info(msg + " isInverseFillType -----result:  " + result + " step is: " + i);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `isInverseFillType  errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_4300
     * @tc.name      testPathToggleInverseFillTypeNormal1Static
     * @tc.desc      testPathToggleInverseFillTypeNormal1Static
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testPathToggleInverseFillTypeNormal1Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathToggleInverseFillTypeNormal1Static';
      let path: drawing.Path = new drawing.Path();
      try {
        path.toggleInverseFillType();
        let result = path.isInverseFillType();
        expect(result).assertEqual(true);
        console.info(msg + 'toggleInverseFillType successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `toggleInverseFillType errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_4301
     * @tc.name      testPathToggleInverseFillTypeNormal2Static
     * @tc.desc      testPathToggleInverseFillTypeNormal2Static
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level0
     */
    it('testPathToggleInverseFillTypeNormal2Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathToggleInverseFillTypeNormal2Static';
      let path: drawing.Path = new drawing.Path();
      try {
        path.setFillType(drawing.PathFillType.WINDING);
        path.toggleInverseFillType();
        let result= path.isInverseFillType()
        expect(result).assertEqual(true);
        console.info(msg + 'toggleInverseFillType 1 successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `toggleInverseFillType 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        path.setFillType(drawing.PathFillType.INVERSE_WINDING);
        path.toggleInverseFillType();
        let result= path.isInverseFillType()
        expect(result).assertEqual(false);
        console.info(msg + 'toggleInverseFillType 2 successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `toggleInverseFillType 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        path.setFillType(drawing.PathFillType.EVEN_ODD);
        path.toggleInverseFillType();
        let result= path.isInverseFillType()
        expect(result).assertEqual(true);
        console.info(msg + 'toggleInverseFillType 3 successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `toggleInverseFillType 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        path.setFillType(drawing.PathFillType.INVERSE_EVEN_ODD);
        path.toggleInverseFillType();
        let result= path.isInverseFillType()
        expect(result).assertEqual(false);
        console.info(msg + 'toggleInverseFillType 4 successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `toggleInverseFillType 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_4302
     * @tc.name      testPathToggleInverseFillTypeMultipleCallsStatic
     * @tc.desc      testPathToggleInverseFillTypeMultipleCallsStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level3
     */
    it('testPathToggleInverseFillTypeMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathToggleInverseFillTypeMultipleCallsStatic';
      let path: drawing.Path = new drawing.Path();
      path.setFillType(drawing.PathFillType.WINDING);
      try {
        for (let i = 0; i < 20; i += 1) {
          path.toggleInverseFillType();
          console.info(msg + " toggleInverseFillType 1-----" + " step is: " + i);
        }
        let result = path.isInverseFillType()
        expect(result).assertEqual(false);
        console.info(msg + " toggleInverseFillType 1-----result:  " + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `toggleInverseFillType 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        for (let i = 0; i < 19; i += 1) {
          path.toggleInverseFillType();
          console.info(msg + " toggleInverseFillType 2-----" + " step is: " + i);
        }
        let result = path.isInverseFillType()
        expect(result).assertEqual(true);
        console.info(msg + " toggleInverseFillType 2-----result:  " + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `toggleInverseFillType 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      path.setFillType(drawing.PathFillType.INVERSE_EVEN_ODD);
      try {
        for (let i = 0; i < 20; i += 1) {
          path.toggleInverseFillType();
          let result = path.isInverseFillType()
          console.info(msg + " toggleInverseFillType 3-----result:  " + result + " step is: " + i);
          if (i % 2 === 0) {
            expect(result).assertEqual(false);
          } else {
            expect(result).assertEqual(true);
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `toggleInverseFillType 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
  })
}