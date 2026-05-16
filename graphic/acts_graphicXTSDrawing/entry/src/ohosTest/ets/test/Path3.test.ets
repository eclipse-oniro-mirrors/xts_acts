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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level} from '@ohos/hypium';
import drawing from '@ohos.graphics.drawing';
import { getEnumCount } from './utils';
import common2D from '@ohos.graphics.common2D';

export default function drawingTsPath3Test() {
  describe('DrawingTsPath3Test', () => {
    const DEFAULT = 0;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {

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
     * @tc.name   testPathSetFillTypeNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1600
     * @tc.desc   testPathSetFillTypeNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathSetFillTypeNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathSetFillTypeNormal';
      let path = new drawing.Path();

      try {
        path.setFillType(drawing.PathFillType.WINDING);
        path.setFillType(drawing.PathFillType.EVEN_ODD);
        path.setFillType(drawing.PathFillType.INVERSE_WINDING);
        path.setFillType(drawing.PathFillType.INVERSE_EVEN_ODD);
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathSetFillTypeMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1601
     * @tc.desc   testPathSetFillTypeMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathSetFillTypeMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathSetFillTypeMultipleCalls';

      try {
        let path = new drawing.Path();
        for (let i = 0; i < 20; i += 1) {
          const randomEnum = Math.floor(getEnumCount(drawing.PathFillType) * Math.random())
          path.setFillType(randomEnum);
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathSetFillTypeToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1602
     * @tc.desc   testPathSetFillTypeToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathSetFillTypeToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathSetFillTypeToNull';
      const path = new drawing.Path();

      try {
        path.setFillType(null);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.setFillType(undefined);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })


    /**
     * @tc.name   testPathSetFillTypeAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1604
     * @tc.desc   testPathSetFillTypeAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathSetFillTypeAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathSetFillTypeAbnormal';
      const path = new drawing.Path();

      try {
        path.setFillType(10);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

    })


    /**
     * @tc.name   testPathGetBoundsNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1700
     * @tc.desc   testPathGetBoundsNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathGetBoundsNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathGetBoundsNormal';
      try {
        let rect: common2D.Rect = {
          left: 0, top: 0, right: 0, bottom: 0
        };
        const path = new drawing.Path();
        path.lineTo(50, 40)
        rect = path.getBounds();
        console.info(msg + " 1 test rect.left: " + rect.left);
        console.info(msg + " 1 test rect.top: " + rect.top);
        console.info(msg + " 1 test rect.right: " + rect.right);
        console.info(msg + " 1 test rect.bottom: " + rect.bottom);
        expect(rect.left == 0).assertTrue();
        expect(rect.top == 0).assertTrue();
        expect(rect.right == 50).assertTrue();
        expect(rect.bottom == 40).assertTrue();
        path.addRect({
          left: 10, right: 400, top: 100, bottom: 300
        }, drawing.PathDirection.CLOCKWISE);
        rect = path.getBounds();
        console.info(msg + " 2 test rect.left: " + rect.left);
        console.info(msg + " 2 test rect.top: " + rect.top);
        console.info(msg + " 2 test rect.right: " + rect.right);
        console.info(msg + " 2 test rect.bottom: " + rect.bottom);
        expect(rect.left == 0).assertTrue();
        expect(rect.top == 0).assertTrue();
        expect(rect.right == 400).assertTrue();
        expect(rect.bottom == 300).assertTrue();
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathGetBoundsMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1701
     * @tc.desc   testPathGetBoundsMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathGetBoundsMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathGetBoundsMultipleCalls';
      try {
        const path = new drawing.Path();
        for (let i = 0; i < 20; i += 1) {
          const rect = path.getBounds()
        }
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathGetLengthNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1800
     * @tc.desc   testPathGetLengthNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathGetLengthNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathGetLengthNormal';

      try {
        let path = new drawing.Path();
        let len = path.getLength(false);
        expect(len).assertEqual(0);

        path.moveTo(0, 0);
        path.arcTo(20, 20, 180, 180, 180, 90);
        len = path.getLength(false);
        expect(len).assertEqual(227.4411163330078);

        len = path.getLength(true);
        expect(len).assertEqual(329.4215087890625);

        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathGetLengthMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1801
     * @tc.desc   testPathGetLengthMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathGetLengthMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathGetLengthMultipleCalls';

      try {
        let path = new drawing.Path();
        for (let i = 0; i < 20; i += 1) {
          let len = path.getLength(true);
          expect(len).assertEqual(0);
        }

        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathGetLengthToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1802
     * @tc.desc   testPathGetLengthToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathGetLengthToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathGetLengthToNull';

      try {
        let path = new drawing.Path();
        path.getLength(null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let path = new drawing.Path();
        path.getLength(undefined);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })


    /**
     * @tc.name   testPathGetPositionAndTangentNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1900
     * @tc.desc   testPathGetPositionAndTangentNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathGetPositionAndTangentNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathGetPositionAndTangentNormal';

      try {
        let path = new drawing.Path();
        let distance = path.getPositionAndTangent(false, 100, {
          x: 20, y: 20
        }, {
          x: 200, y: 200
        });
        expect(distance).assertEqual(false);
        path.moveTo(0, 0);
        path.lineTo(100, 100);
        distance = path.getPositionAndTangent(true, 30.1, {
          x: 20.1, y: 20.1
        }, {
          x: 200.1, y: 200.1
        });
        expect(distance).assertEqual(true);
        distance = path.getPositionAndTangent(true, 80, {
          x: -20.1, y: -20.1
        }, {
          x: 200.1, y: 200.1
        });
        expect(distance).assertEqual(true);
        distance = path.getPositionAndTangent(true, 100, {
          x: 200.1, y: 200.1
        }, {
          x: -200.1, y: -200.1
        })
        expect(distance).assertEqual(true);
        distance = path.getPositionAndTangent(true, -1, {
          x: 200.1, y: 200.1
        }, {
          x: 600.1, y: 600.1
        })
        expect(distance).assertEqual(true);
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathGetPositionAndTangentMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1901
     * @tc.desc   testPathGetPositionAndTangentMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathGetPositionAndTangentMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathGetPositionAndTangentMultipleCalls';

      try {
        let path = new drawing.Path();
        for (let i = 0; i < 20; i += 1) {
          let distance = path.getPositionAndTangent(false, 100, {
            x: 20, y: 20
          }, {
            x: 200, y: 200
          });
        }
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathGetPositionAndTangentToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1902
     * @tc.desc   testPathGetPositionAndTangentToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathGetPositionAndTangentToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathGetPositionAndTangentToNull';
      const path = new drawing.Path();

      try {
        path.getPositionAndTangent(null, 100, {
          x: 20, y: 20
        }, {
          x: 200, y: 200
        });
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.getPositionAndTangent(false, null, {
          x: 20, y: 20
        }, {
          x: 200, y: 200
        });
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.getPositionAndTangent(false, 100, null, {
          x: 200, y: 200
        });
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.getPositionAndTangent(false, 100, {
          x: 20, y: 20
        }, null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.getPositionAndTangent(undefined, 100, {
          x: 20, y: 20
        }, {
          x: 200, y: 200
        });
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.getPositionAndTangent(false, undefined, {
          x: 20, y: 20
        }, {
          x: 200, y: 200
        });
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.getPositionAndTangent(false, 100, undefined, {
          x: 200, y: 200
        });
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.getPositionAndTangent(false, 100, {
          x: 20, y: 20
        }, undefined);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })


    /**
     * @tc.name   testPathConstructorNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2000
     * @tc.desc   testPathConstructorNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathConstructorNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathConstructorNormal';

      try {
        let path: drawing.Path = new drawing.Path();
        let newPath = new drawing.Path(path);

        path.arcTo(0, 0, 100, 100, 0, 180);
        path.close();
        newPath = new drawing.Path(path);

        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathConstructorMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2001
     * @tc.desc   testPathConstructorMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathConstructorMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathConstructorMultipleCalls';

      try {
        for (let i = 0; i < 20; i += 1) {
          let path = new drawing.Path();
          let newPath = new drawing.Path(path);
        }
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testPathIsClosedNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2100
     * @tc.desc   testPathIsClosedNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIsClosedNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIsClosedNormal';

      try {
        let path: drawing.Path = new drawing.Path();
        let close = path.isClosed();
        expect(close).assertEqual(false);

        path.moveTo(0, 0);
        path.lineTo(0, 100);
        path.lineTo(200, 350);
        close = path.isClosed();
        expect(close).assertEqual(false);

        path.close();
        close = path.isClosed();
        expect(close).assertEqual(true);

      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathIsClosedMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2101
     * @tc.desc   testPathIsClosedMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathIsClosedMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathIsClosedMultipleCalls';
      const path = new drawing.Path();

      try {
        for (let i = 0; i < 20; i += 1) {
          let close = path.isClosed();
          expect(close).assertEqual(false);
        }
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathBuildFromSVGStringNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2200
     * @tc.desc   testPathBuildFromSVGStringNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathBuildFromSVGStringNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathBuildFromSVGStringNormal';
      const path = new drawing.Path();

      try {
        path.buildFromSvgString('');
        let svgStr: string = "M150 100 L75 300 L225 300 Z";
        let flag = path.buildFromSvgString(svgStr);
        expect(flag).assertTrue();

        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        let svgStr2: string = "11111111";
        let flag2 = path.buildFromSvgString(svgStr2);
        expect(flag2).assertEqual(false);
        console.info(msg + 'test 11111111 successes');
      } catch (e) {
        console.info(msg + `test 11111111 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathBuildFromSVGStringMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2201
     * @tc.desc   testPathBuildFromSVGStringMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathBuildFromSVGStringMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathBuildFromSVGStringMultipleCalls';
      const path = new drawing.Path();

      try {
        for (let i = 0; i < 20; i += 1) {
          let svgStr: string = "M150 100 L75 300 L225 300 Z";
          let flag = path.buildFromSvgString(svgStr);
          expect(flag).assertTrue();
        }
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathBuildFromSVGStringToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2202
     * @tc.desc   testPathBuildFromSVGStringToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathBuildFromSVGStringToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathBuildFromSVGStringToNull';
      const path = new drawing.Path();

      try {
        path.buildFromSvgString(null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.buildFromSvgString(undefined);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

    })
    /**
     * @tc.name   testPathGetSegmentNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_001
     * @tc.desc   testPathGetSegmentNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathGetSegmentNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathGetSegmentNormal';
      let path = new drawing.Path();
      try {
        path.moveTo(0, 0);
        path.lineTo(0, 700);
        path.lineTo(700, 0);
        console.info(msg + 'lineTo successes');
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }
      let dstPath: drawing.Path = new drawing.Path();
      try {
        let result: boolean;
        result = path.getSegment(true, 10.0, 20.0, true, dstPath)
        console.info(msg + " getSegment-----result:  "+ path.getSegment(true, 10.0, 20.0, true, dstPath));
        expect(result).assertEqual(true);
      } catch (e) {
        console.info(msg + `test getSegment . errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }
      try {
        let result: boolean;
        result = path.getSegment(false, 10.0, 20.0, true, dstPath)
        console.info(msg + " 1 getSegment-----result:  "+ result);
        expect(result).assertEqual(true);
      } catch (e) {
        console.info(msg + `1 test getSegment . errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }
      try {
        let result2: boolean;
        result2 = path.getSegment(true, 20.0, 10.0, true, dstPath)
        console.info(msg + " getSegment 2 -----result2:  "+ result2);
        expect(result2).assertEqual(false);
      } catch (e) {
        console.info(msg + `test getSegment 2. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }
      try {
        let result3: boolean;
        result3 = path.getSegment(true, 20.0, 10.0, false, dstPath)
        console.info(msg + " getSegment 3 -----result2:  "+ result3);
        expect(result3).assertEqual(false);
      } catch (e) {
        console.info(msg + `test getSegment 3. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPathGetSegmentAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_002
     * @tc.desc   testPathGetSegmentAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathGetSegmentAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathGetSegmentAbnormal';
      let path = new drawing.Path();
      try {
        path.moveTo(0, 0);
        path.lineTo(0, 700);
        path.lineTo(700, 0);
        console.info(msg + 'lineTo successes');
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }
      let dstPath: drawing.Path = new drawing.Path();
      try {
        path.getSegment(true, 10.0, 20.0, true, undefined)
        console.info(msg + `test getSegment error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test getSegment . errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
      try {
        path.getSegment(true, 10.0, 20.0, true, null)
        console.info(msg + `test 1 getSegment error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test 1 getSegment . errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
      try {
        path.getSegment(true, undefined, 20.0, true, dstPath)
        console.info(msg + `test 2 getSegment error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test 2 getSegment . errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
      try {
        path.getSegment(true, null, 20.0, true, dstPath)
        console.info(msg + `test 3 getSegment error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test 3 getSegment . errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
      try {
        path.getSegment(true, 10.0, null, true, dstPath)
        console.info(msg + `test 4 getSegment error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test 4 getSegment . errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
      try {
        path.getSegment(true, 10.0, undefined, true, dstPath)
        console.info(msg + `test 5 getSegment error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test 5 getSegment . errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })
  })
}