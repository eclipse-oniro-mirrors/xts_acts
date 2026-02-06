/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';

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
     * @tc.name   testLatticeCreateImageLatticeNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_LATTICE_0100
     * @tc.desc   Test for testLatticeCreateImageLatticeNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLatticeCreateImageLatticeNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testLatticeCreateImageLatticeNormal';

      try {
        drawing.Lattice.createImageLattice([ 80, 150 ], [ 80, 150 ], 2, 2, null, null, null);
        console.info(msg + ' createImageLattice successed');
      } catch( e ) {
        console.info(msg + ` createImageLattice1 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        drawing.Lattice.createImageLattice([ 310, 320, 340, 360, 400 ], [ 10, 20, 40, 60, 100 ], 5, 5, null, null, null);
        console.info(msg + ' createImageLattice successed');
      } catch( e ) {
        console.info(msg + ` createImageLattice2 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        drawing.Lattice.createImageLattice([ 200, 300 ], [ 200, 300 ], 0, 2, null, null, null);
        console.info(msg + ' createImageLattice(null) succeeded');
      } catch( e ) {
        console.info(msg + ` createImageLattice(null)3 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.Lattice.createImageLattice([ 200, 300 ], [ 200, 300 ], 2, 0, null, null, null);
        console.info(msg + ' createImageLattice(null) succeeded');
      } catch( e ) {
        console.info(msg + ` createImageLattice(null)4 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.Lattice.createImageLattice([ 0 ], [ 0 ], 0, 0, null, null, null);
        console.info(msg + ' createImageLattice(null) succeeded');
      } catch( e ) {
        console.info(msg + ` createImageLattice(null)5 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2, {
          left : 200, top : 200, right : 200, bottom : 200
        }, null, null);
        console.info(msg + ' createImageLattice successed');
      } catch( e ) {
        console.info(msg + ` createImageLattice6 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2, {
          left : 1000, top : 1000, right : 1000, bottom : 1000
        }, null, null);
        console.info(msg + ' createImageLattice successed');
      } catch( e ) {
        console.info(msg + ` createImageLattice7 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2, {
          left : 2000, top : 2000, right : 2000, bottom : 2000
        }, null, null);
        console.info(msg + ' createImageLattice successed');
      } catch( e ) {
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
      } catch( e ) {
        console.info(msg + ` createImageLattice9 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2, null,
          [ drawing.RectType.DEFAULT, drawing.RectType.TRANSPARENT, drawing.RectType.DEFAULT, drawing.RectType.TRANSPARENT,
            drawing.RectType.DEFAULT, drawing.RectType.TRANSPARENT, drawing.RectType.DEFAULT, drawing.RectType.TRANSPARENT,
            drawing.RectType.DEFAULT ], null);
        console.info(msg + ' createImageLattice successed');
      } catch( e ) {
        console.info(msg + ` createImageLattice10 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2, null, [
          drawing.RectType.DEFAULT, drawing.RectType.DEFAULT, drawing.RectType.DEFAULT,
          drawing.RectType.DEFAULT, drawing.RectType.DEFAULT, drawing.RectType.DEFAULT,
          drawing.RectType.DEFAULT, drawing.RectType.DEFAULT, drawing.RectType.DEFAULT ], null);
        console.info(msg + ' createImageLattice successed');
      } catch( e ) {
        console.info(msg + ` createImageLattice11 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2, null, undefined, null);
        console.info(msg + ' createImageLattice successed');
      } catch( e ) {
        console.info(msg + ` createImageLattice12 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        drawing.Lattice.createImageLattice([ 80, 150 ], [ 80, 150 ], 2, 2);
        console.info(msg + ' 11 createImageLattice successed');
      } catch( e ) {
        console.info(msg + ` 11 createImageLattice1 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testLatticeCreateImageLatticeAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_LATTICE_0101
     * @tc.desc   Test for testLatticeCreateImageLatticeAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLatticeCreateImageLatticeAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testLatticeCreateImageLatticeAbnormal';

      try {
        drawing.Lattice.createImageLattice([ 100.8, 200 ], [ 100.3, 200 ], 2, 2, null, null, null);
        console.info(msg + ' createImageLattice successed');
      } catch( e ) {
        console.info(msg + ` createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        drawing.Lattice.createImageLattice([ 10, 50, 90, 110, 150, 180 ], [ 10, 50, 90, 110, 150, 180 ], 6, 6, null, null, null);
        console.info(msg + ' createImageLattice(null) succeeded');
      } catch( e ) {
        console.info(msg + ` createImageLattice(null) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.Lattice.createImageLattice([ 0, 100, 200 ], [ 0, 100, 200 ], 2, 3, null, null, null);
        console.info(msg + ' createImageLattice(null) succeeded');
      } catch( e ) {
        console.info(msg + ` createImageLattice(null) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.Lattice.createImageLattice([ 10, 80, 150 ], [ 10, 80, 150 ], 3, 4, null, null, null);
        console.info(msg + ' createImageLattice(null) succeeded');
      } catch( e ) {
        console.info(msg + ` createImageLattice(null) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.Lattice.createImageLattice([], [], - 1, - 1, null, null, null);
        console.info(msg + ' createImageLattice(null) succeeded');
      } catch( e ) {
        console.info(msg + ` createImageLattice(null) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2, {
          left : 2000, top : 2000, right : 2000, bottom : 2000
        }, null, null);
        console.info(msg + ' createImageLattice successed');
      } catch( e ) {
        console.info(msg + ` createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2, {
          left : 400.2, top : 400.4, right : 400.2, bottom : 400.4
        }, null, null);
        console.info(msg + ' createImageLattice successed');
      } catch( e ) {
        console.info(msg + ` createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2, {
          left : 200.5, top : 400.5, right : 200.5, bottom : 400.5
        }, null, null);
        console.info(msg + ' createImageLattice successed');
      } catch( e ) {
        console.info(msg + ` createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        const color: common2D.Color = {
          alpha : 0,
          red : 0,
          green : 0,
          blue : 0,
        }
        drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2, null, [ 5 ], [ color ]);
        console.info(msg + ' createImageLattice(null) succeeded');
      } catch( e ) {
        console.info(msg + ` createImageLattice(null) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        const fRect1: Array<drawing.RectType> = [
          9, 9, 9,
          9, 9, 9,
          9, 9, 9
        ]
        drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2, null, fRect1, null);
        console.info(msg + ' createImageLattice(null) succeeded');
      } catch( e ) {
        console.info(msg + ` createImageLattice(null) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        const fRect2: Array<drawing.RectType> = [
          6, 6, 6,
          6, 6, 6,
          6, 6, 6
        ]
        drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2, null, fRect2, null);
        console.info(msg + ' createImageLattice(null) succeeded');
      } catch( e ) {
        console.info(msg + ` createImageLattice(null) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        const fRect3: Array<drawing.RectType> = [
          9, 9, 9, 9,
          9, 9, 9, 9,
          9, 9, 9, 9,
          9, 9, 9, 9
        ]
        drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2, null, fRect3, null);
        console.info(msg + ' createImageLattice(null) succeeded');
      } catch( e ) {
        console.info(msg + ` createImageLattice(null) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        const fRect4: Array<drawing.RectType> = [
          6, 6, 6, 6,
          6, 6, 6, 6,
          6, 6, 6, 6,
          6, 6, 6, 6
        ]
        drawing.Lattice.createImageLattice([ 200, 400 ], [ 200, 400 ], 2, 2, null, fRect4, null);
        console.info(msg + ' createImageLattice(null) succeeded');
      } catch( e ) {
        console.info(msg + ` createImageLattice(null) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
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
      } catch( e ) {
        console.info(msg + ` createImageLattice(null) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testLatticeCreateImageLatticeNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_LATTICE_0102
     * @tc.desc   Test for testLatticeCreateImageLatticeNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLatticeCreateImageLatticeNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testLatticeCreateImageLatticeNull';
      const fBounds: common2D.Rect = {
        left : 200, right : 200, top : 200, bottom : 200
      }
      const color: common2D.Color = {
        alpha : 255,
        red : 0,
        green : 0,
        blue : 255
      }

      try {
        drawing.Lattice.createImageLattice([ null ], [ 1, 2, 4 ], 3, 3, fBounds, [ drawing.RectType.TRANSPARENT ], [ color ]);
        console.info(msg + ' createImageLattice succeeded');
      } catch( e ) {
        console.info(msg + ` createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.Lattice.createImageLattice([ 1, 2, 4 ], null, 3, 3, fBounds, [ drawing.RectType.DEFAULT ], [ color ]);
        console.info(msg + ' createImageLattice succeeded');
      } catch( e ) {
        console.info(msg + ` createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.Lattice.createImageLattice([ 1, 2, 4 ], [ 1, 2, 4 ], null, 3, fBounds, [ drawing.RectType.FIXEDCOLOR ], [ color ]);
        console.info(msg + ' createImageLattice succeeded');
      } catch( e ) {
        console.info(msg + ` createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.Lattice.createImageLattice([ 1, 2, 4 ], [ 1, 2, 4 ], 3, null, fBounds, [ drawing.RectType.TRANSPARENT ], [ color ]);
        console.info(msg + ' createImageLattice succeeded');
      } catch( e ) {
        console.info(msg + ` createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testLatticeCreateImageLatticeCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_LATTICE_0103
     * @tc.desc   Test for testLatticeCreateImageLatticeCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLatticeCreateImageLatticeCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testLatticeCreateImageLatticeCalls';

      for ( let i = 0 ; i < 1000 ; i ++ ) {
        try {
          drawing.Lattice.createImageLattice([ 1, 50, 200 ], [ 1, 50, 200 ], 3, 3, null, null, null);
          console.info(msg + ' createImageLattice succeeded');
        } catch( e ) {
          console.info(msg + ` createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect(e.code).assertEqual(401);
        }
      }
    });
    /**
     * @tc.name   testLatticeCreateImageLatticeNull2
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_LATTICE_0104
     * @tc.desc   Test for testLatticeCreateImageLatticeNull2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLatticeCreateImageLatticeNull2', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testLatticeCreateImageLatticeNull2';
      const fBounds: common2D.Rect = {
        left : 200, right : 200, top : 200, bottom : 200
      }
      const color: common2D.Color = {
        alpha : 255,
        red : 0,
        green : 0,
        blue : 255
      }

      try {
        drawing.Lattice.createImageLattice(null, [ 1, 2, 4 ], 3, 3, fBounds, [ drawing.RectType.TRANSPARENT ], [ color ]);
        console.info(msg + ' 1 createImageLattice succeeded');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` 1 createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.Lattice.createImageLattice(undefined, [ 1, 2, 4 ], 3, 3, fBounds, [ drawing.RectType.TRANSPARENT ], [ color ]);
        console.info(msg + ' 2 createImageLattice succeeded');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` 2 createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.Lattice.createImageLattice([ 1, 2, 4 ], null, 3, 3, fBounds, [ drawing.RectType.TRANSPARENT ], [ color ]);
        console.info(msg + ' 3 createImageLattice succeeded');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` 3 createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.Lattice.createImageLattice([ 1, 2, 4 ], undefined, 3, 3, fBounds, [ drawing.RectType.TRANSPARENT ], [ color ]);
        console.info(msg + ' 4 createImageLattice succeeded');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` 4 createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.Lattice.createImageLattice([ 1, 2, 4 ], [ 1, 2, 4 ], null, 3, fBounds, [ drawing.RectType.TRANSPARENT ], [ color ]);
        console.info(msg + ' 5 createImageLattice succeeded');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` 5 createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.Lattice.createImageLattice([ 1, 2, 4 ], [ 1, 2, 4 ], undefined, 3, fBounds, [ drawing.RectType.TRANSPARENT ], [ color ]);
        console.info(msg + ' 6 createImageLattice succeeded');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` 6 createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.Lattice.createImageLattice([ 1, 2, 4 ], [ 1, 2, 4 ], 3, null, fBounds, [ drawing.RectType.TRANSPARENT ], [ color ]);
        console.info(msg + ' 7 createImageLattice succeeded');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` 7 createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.Lattice.createImageLattice([ 1, 2, 4 ], [ 1, 2, 4 ], 3, undefined, fBounds, [ drawing.RectType.TRANSPARENT ], [ color ]);
        console.info(msg + ' 8 createImageLattice succeeded');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` 8 createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.Lattice.createImageLattice([ 1, 2, 4 ], [ 1, 2, 4 ], 3, 3, null, [ drawing.RectType.TRANSPARENT ], [ color ]);
        console.info(msg + ' 9 createImageLattice succeeded');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` 9 createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.Lattice.createImageLattice([ 1, 2, 4 ], [ 1, 2, 4 ], 3, 3, undefined, [ drawing.RectType.TRANSPARENT ], [ color ]);
        console.info(msg + ' 10 createImageLattice succeeded');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` 10 createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.Lattice.createImageLattice([ 1, 2, 4 ], [ 1, 2, 4 ], 3, 3, fBounds, null, [ color ]);
        console.info(msg + ' 11 createImageLattice succeeded');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` 11 createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.Lattice.createImageLattice([ 1, 2, 4 ], [ 1, 2, 4 ], 3, 3, fBounds, undefined, [ color ]);
        console.info(msg + ' 12 createImageLattice succeeded');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` 12 createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.Lattice.createImageLattice([ 1, 2, 4 ], [ 1, 2, 4 ], 3, 3, fBounds, [ drawing.RectType.TRANSPARENT ], null);
        console.info(msg + ' 13 createImageLattice succeeded');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` 13 createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.Lattice.createImageLattice([ 1, 2, 4 ], [ 1, 2, 4 ], 3, 3, fBounds, [ drawing.RectType.TRANSPARENT ], undefined);
        console.info(msg + ' 14 createImageLattice succeeded');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` 14 createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   testLatticeCreateImageLattice2Null
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_LATTICE_0105
     * @tc.desc   Test for testLatticeCreateImageLattice2Null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLatticeCreateImageLattice2Null', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testLatticeCreateImageLattice2Null';
      const fBounds: common2D.Rect = {
        left : 200, right : 200, top : 200, bottom : 200
      }
      let colorArray :Array<number>=[0xffffffff,0x44444444,0x99999999,0xffffffff,0x44444444,0x99999999,0xffffffff,0x44444444,0x99999999,0x44444444,0x99999999,0xffffffff,0x44444444,0x99999999,0xffffffff,0x44444444];
      try {
        drawing.Lattice.createImageLattice(null, [ 1, 2, 4 ], 3, 3, fBounds, [ drawing.RectType.TRANSPARENT ], colorArray);
        console.info(msg + ' 1 createImageLattice succeeded');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` 1 createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.Lattice.createImageLattice(undefined, [ 1, 2, 4 ], 3, 3, fBounds, [ drawing.RectType.TRANSPARENT ], colorArray);
        console.info(msg + ' 2 createImageLattice succeeded');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` 2 createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.Lattice.createImageLattice([ 1, 2, 4 ], null, 3, 3, fBounds, [ drawing.RectType.TRANSPARENT ], colorArray);
        console.info(msg + ' 3 createImageLattice succeeded');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` 3 createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.Lattice.createImageLattice([ 1, 2, 4 ], undefined, 3, 3, fBounds, [ drawing.RectType.TRANSPARENT ], colorArray);
        console.info(msg + ' 4 createImageLattice succeeded');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` 4 createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.Lattice.createImageLattice([ 1, 2, 4 ], [ 1, 2, 4 ], null, 3, fBounds, [ drawing.RectType.TRANSPARENT ], colorArray);
        console.info(msg + ' 5 createImageLattice succeeded');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` 5 createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.Lattice.createImageLattice([ 1, 2, 4 ], [ 1, 2, 4 ], undefined, 3, fBounds, [ drawing.RectType.TRANSPARENT ], colorArray);
        console.info(msg + ' 6 createImageLattice succeeded');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` 6 createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.Lattice.createImageLattice([ 1, 2, 4 ], [ 1, 2, 4 ], 3, null, fBounds, [ drawing.RectType.TRANSPARENT ], colorArray);
        console.info(msg + ' 7 createImageLattice succeeded');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` 7 createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.Lattice.createImageLattice([ 1, 2, 4 ], [ 1, 2, 4 ], 3, undefined, fBounds, [ drawing.RectType.TRANSPARENT ], colorArray);
        console.info(msg + ' 8 createImageLattice succeeded');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` 8 createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.Lattice.createImageLattice([ 1, 2, 4 ], [ 1, 2, 4 ], 3, 3, null, [ drawing.RectType.TRANSPARENT ], colorArray);
        console.info(msg + ' 9 createImageLattice succeeded');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` 9 createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.Lattice.createImageLattice([ 1, 2, 4 ], [ 1, 2, 4 ], 3, 3, undefined, [ drawing.RectType.TRANSPARENT ], colorArray);
        console.info(msg + ' 10 createImageLattice succeeded');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` 10 createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.Lattice.createImageLattice([ 1, 2, 4 ], [ 1, 2, 4 ], 3, 3, fBounds, null, colorArray);
        console.info(msg + ' 11 createImageLattice succeeded');
      } catch( e ) {
        console.info(msg + ` 11 createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.Lattice.createImageLattice([ 1, 2, 4 ], [ 1, 2, 4 ], 3, 3, fBounds, undefined, colorArray);
        console.info(msg + ' 12 createImageLattice succeeded');
      } catch( e ) {
        console.info(msg + ` 12 createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.Lattice.createImageLattice([ 1, 2, 4 ], [ 1, 2, 4 ], 3, 3, fBounds, [ drawing.RectType.TRANSPARENT ], null);
        console.info(msg + ' 13 createImageLattice succeeded');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` 13 createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.Lattice.createImageLattice([ 1, 2, 4 ], [ 1, 2, 4 ], 3, 3, fBounds, [ drawing.RectType.TRANSPARENT ], undefined);
        console.info(msg + ' 14 createImageLattice succeeded');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` 14 createImageLattice errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });
  });
}