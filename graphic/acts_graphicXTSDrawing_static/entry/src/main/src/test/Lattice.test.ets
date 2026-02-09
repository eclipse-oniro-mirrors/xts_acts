/*
 * Copyright (C) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';

export default function latticeTest() {
  describe('DrawingTsLatticeTest', () => {
    const DEFAULT = 0;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async() => {

    })
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
     * @tc.name   testLatticeCreateImageLatticeNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_LATTICE_STATIC_0100
     * @tc.desc   Test for testLatticeCreateImageLatticeNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLatticeCreateImageLatticeNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg = 'testLatticeCreateImageLatticeNormalStatic';

      try {
        let lattice = drawing.Lattice.createImageLattice([ 80, 150 ], [ 80, 150 ], 2, 2, null, null, null);
        console.info(msg + ' createImageLattice successed');
        if(lattice == undefined){
          console.info(msg + ' 1 test failed');
          expect().assertFail();
        }
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice1 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let lattice = drawing.Lattice.createImageLattice([ 310, 320, 340, 360, 400 ], [ 10, 20, 40, 60, 100 ], 5, 5, null, null, null);
        console.info(msg + ' createImageLattice successed');
        if(lattice == undefined){
          console.info(msg + ' 2 test failed');
          expect().assertFail();
        }
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice2 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let lattice = drawing.Lattice.createImageLattice([ 200, 300 ], [ 200, 300 ], 0, 2, null, null, null);
        console.info(msg + ' createImageLattice(null) succeeded');
        if(lattice == undefined){
          console.info(msg + ' 3 test failed');
          expect().assertFail();
        }
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice(null)3 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.Lattice.createImageLattice([ 200, 300 ], [ 200, 300 ], 2, 0, null, null, null);
        console.info(msg + ' createImageLattice(null) succeeded');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice(null)4 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.Lattice.createImageLattice([ 0 ], [ 0 ], 0, 0, null, null, null);
        console.info(msg + ' createImageLattice(null) succeeded');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice(null)5 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2, {
          left : 200, top : 200, right : 200, bottom : 200
        }, null, null);
        console.info(msg + ' createImageLattice successed');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice6 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2, {
          left : 1000, top : 1000, right : 1000, bottom : 1000
        }, null, null);
        console.info(msg + ' createImageLattice successed');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice7 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2, {
          left : 2000, top : 2000, right : 2000, bottom : 2000
        }, null, null);
        console.info(msg + ' createImageLattice successed');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice8 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        const color: common2D.Color = {
          alpha : 0,
          red : 0,
          green : 0,
          blue : 128,
        }
        drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2, {
          left : 200, top : 400, right : 200, bottom : 400
        }, [ drawing.RectType.FIXEDCOLOR, drawing.RectType.FIXEDCOLOR, drawing.RectType.FIXEDCOLOR,
          drawing.RectType.FIXEDCOLOR, drawing.RectType.FIXEDCOLOR, drawing.RectType.FIXEDCOLOR,
          drawing.RectType.FIXEDCOLOR, drawing.RectType.FIXEDCOLOR, drawing.RectType.FIXEDCOLOR ],
          [ color, color, color, color, color, color, color, color, color ]);
        console.info(msg + ' createImageLattice successed');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice9 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2, null,
          [ drawing.RectType.DEFAULT, drawing.RectType.TRANSPARENT, drawing.RectType.DEFAULT, drawing.RectType.TRANSPARENT,
            drawing.RectType.DEFAULT, drawing.RectType.TRANSPARENT, drawing.RectType.DEFAULT, drawing.RectType.TRANSPARENT,
            drawing.RectType.DEFAULT ], null);
        console.info(msg + ' createImageLattice successed');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice10 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2, null, [
          drawing.RectType.DEFAULT, drawing.RectType.DEFAULT, drawing.RectType.DEFAULT,
          drawing.RectType.DEFAULT, drawing.RectType.DEFAULT, drawing.RectType.DEFAULT,
          drawing.RectType.DEFAULT, drawing.RectType.DEFAULT, drawing.RectType.DEFAULT ], null);
        console.info(msg + ' createImageLattice successed');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice11 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2, null, undefined, null);
        console.info(msg + ' createImageLattice successed');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice12 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
       let lattice =  drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2);
        expect(lattice != null || lattice != undefined).assertTrue();
        console.info(msg + ' createImageLattgitice 13 successed');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice 13 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testLatticeCreateImageLatticeAbnormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_LATTICE_STATIC_0101
     * @tc.desc   Test for testLatticeCreateImageLatticeAbnormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLatticeCreateImageLatticeAbnormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg = 'testLatticeCreateImageLatticeAbnormalStatic';

      try {
        drawing.Lattice.createImageLattice([ 100, 200 ], [ 100, 200 ], 2, 2, null, null, null);
        console.info(msg + ' createImageLattice successed');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        drawing.Lattice.createImageLattice([ 10, 50, 90, 110, 150, 180 ], [ 10, 50, 90, 110, 150, 180 ], 6, 6, null, null, null);
        console.info(msg + ' createImageLattice(null) succeeded');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice(null) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.Lattice.createImageLattice([ 0, 100, 200 ], [ 0, 100, 200 ], 2, 3, null, null, null);
        console.info(msg + ' createImageLattice(null) succeeded');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice(null) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.Lattice.createImageLattice([ 10, 80, 150 ], [ 10, 80, 150 ], 3, 4, null, null, null);
        console.info(msg + ' createImageLattice(null) succeeded');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice(null) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2, {
          left : 2000, top : 2000, right : 2000, bottom : 2000
        }, null, null);
        console.info(msg + ' createImageLattice successed');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2, {
          left : 400.2, top : 400.4, right : 400.2, bottom : 400.4
        }, null, null);
        console.info(msg + ' createImageLattice successed');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2, {
          left : 200.5, top : 400.5, right : 200.5, bottom : 400.5
        }, null, null);
        console.info(msg + ' createImageLattice successed');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        const color: common2D.Color = {
          alpha : 255,
          red : 255,
          green : 255,
          blue : 255,
        }
        drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2, null, [ drawing.RectType.FIXEDCOLOR ], null);
        console.info(msg + ' createImageLattice(null) succeeded');
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLattice(null) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   testLatticeCreateImageLatticeCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_LATTICE_STATIC_0103
     * @tc.desc   Test for testLatticeCreateImageLatticeCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLatticeCreateImageLatticeCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg = 'testLatticeCreateImageLatticeCallsStatic';

      for ( let i = 0 ; i < 1000 ; i ++ ) {
        try {
          drawing.Lattice.createImageLattice([ 1, 50, 200 ], [ 1, 50, 200 ], 3, 3, null, null, null);
          console.info(msg + ' createImageLattice succeeded');
        } catch( e: BusinessError ) {
          console.info(msg + ` createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect(e.code).assertEqual(401);
        }
      }
    });
    /**
     * @tc.name   testCreateImageLatticeWithArrayIntNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_LATTICE_STATIC_0200
     * @tc.desc   Test for testCreateImageLatticeWithArrayIntNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateImageLatticeWithArrayIntNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testCreateImageLatticeWithArrayIntNormalStatic';
      let xDivs : Array<int> = [1, 2, 4];
      let yDivs : Array<int> = [1, 2, 4];
      let colorArray :Array<int>=[1,2,5,1,5,2,3,1,1,1,2,2,2,2,2,2];
      try {
        let lattice = drawing.Lattice.createImageLatticeWithArrayInt(xDivs, yDivs, 3, 3,null,null,colorArray);
        console.info(msg + ' createImageLatticeWithArrayInt 1 successed');
        if(lattice == undefined){
          console.info(msg + ' 1 test failed');
          expect().assertFail();
        }
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLatticeWithArrayInt 1 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        let lattice = drawing.Lattice.createImageLatticeWithArrayInt(xDivs, yDivs, 3, 3,null,null,null);
        console.info(msg + ' createImageLatticeWithArrayInt 2 successed');
        if(lattice == undefined){
          console.info(msg + ' 2 test failed');
          expect().assertFail();
        }
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLatticeWithArrayInt 2 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let lattice = drawing.Lattice.createImageLatticeWithArrayInt(xDivs, yDivs, 3, 3);
        console.info(msg + ' createImageLatticeWithArrayInt 3 successed');
        if(lattice == undefined){
          console.info(msg + ' 3 test failed');
          expect().assertFail();
        }
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLatticeWithArrayInt 3 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      let xDivs2 : Array<int> = [];
      let yDivs2 : Array<int> = [1, 2, 4, 5, 6];
      try {
        let lattice = drawing.Lattice.createImageLatticeWithArrayInt(xDivs2, yDivs2, 0, 5);
        console.info(msg + ' createImageLatticeWithArrayInt 4 successed');
        if(lattice == undefined){
          console.info(msg + ' 4 test failed');
          expect().assertFail();
        }
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLatticeWithArrayInt 4 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      let xDivs3 : Array<int> = [];
      let yDivs3 : Array<int> = [];
      try {
        let lattice = drawing.Lattice.createImageLatticeWithArrayInt(xDivs3, yDivs3, 0, 0);
        console.info(msg + ' createImageLatticeWithArrayInt 5 successed');
        if(lattice == undefined){
          console.info(msg + ' 5 test failed');
          expect().assertFail();
        }
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLatticeWithArrayInt 5 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      let xDivs4 : Array<int> = [1, 2, 4, 5, 6];
      let yDivs4 : Array<int> = [1, 2, 4, 5, 6];
      try {
        let lattice = drawing.Lattice.createImageLatticeWithArrayInt(xDivs4, yDivs4, 5, 5);
        console.info(msg + ' createImageLatticeWithArrayInt 6 successed');
        if(lattice == undefined){
          console.info(msg + ' 6 test failed');
          expect().assertFail();
        }
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLatticeWithArrayInt 6 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testCreateImageLatticeWithArrayIntAbnormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_LATTICE_STATIC_0201
     * @tc.desc   Test for testCreateImageLatticeWithArrayIntAbnormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateImageLatticeWithArrayIntAbnormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testCreateImageLatticeWithArrayIntAbnormalStatic';
      let xDivs : Array<int> = [1, 2, 4];
      let yDivs : Array<int> = [1, 2, 4];
      let colorArray :Array<int>=[1,2,5,1,5,2,3,1,1,1,2,2,2,2,2,2];
      try {
        let lattice = drawing.Lattice.createImageLatticeWithArrayInt(xDivs, yDivs, 10, 3,null,null,colorArray);
        console.info(msg + ' createImageLatticeWithArrayInt 1 successed');
        expect().assertFail();
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLatticeWithArrayInt 1 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        let lattice = drawing.Lattice.createImageLatticeWithArrayInt(xDivs, yDivs, -5, 3,null,null,null);
        console.info(msg + ' createImageLatticeWithArrayInt 2 successed');
        expect().assertFail();
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLatticeWithArrayInt 2 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let lattice = drawing.Lattice.createImageLatticeWithArrayInt(xDivs, yDivs, 3, -5);
        console.info(msg + ' createImageLatticeWithArrayInt 3 successed');
        expect().assertFail();
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLatticeWithArrayInt 3 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        let lattice = drawing.Lattice.createImageLatticeWithArrayInt(xDivs, yDivs, -10, 10);
        console.info(msg + ' createImageLatticeWithArrayInt 4 successed');
        expect().assertFail();
      } catch( e: BusinessError ) {
        console.info(msg + ` createImageLatticeWithArrayInt 3 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });
  });
}