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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1600
     * @tc.name      : testPathSetFillTypeNormal
     * @tc.desc      : testPathSetFillTypeNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1601
     * @tc.name      : testPathSetFillTypeMultipleCalls
     * @tc.desc      : testPathSetFillTypeMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1602
     * @tc.name      : testPathSetFillTypeToNull
     * @tc.desc      : testPathSetFillTypeToNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1604
     * @tc.name      : testPathSetFillTypeAbnormal
     * @tc.desc      : testPathSetFillTypeAbnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1700
     * @tc.name      : testPathGetBoundsNormal
     * @tc.desc      : testPathGetBoundsNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
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

        path.addRect({
          left: 10, right: 400, top: 100, bottom: 300
        }, drawing.PathDirection.CLOCKWISE);
        rect = path.getBounds();

        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1701
     * @tc.name      : testPathGetBoundsMultipleCalls
     * @tc.desc      : testPathGetBoundsMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1800
     * @tc.name      : testPathGetLengthNormal
     * @tc.desc      : testPathGetLengthNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1801
     * @tc.name      : testPathGetLengthMultipleCalls
     * @tc.desc      : testPathGetLengthMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1802
     * @tc.name      : testPathGetLengthToNull
     * @tc.desc      : testPathGetLengthToNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1900
     * @tc.name      : testPathGetPositionAndTangentNormal
     * @tc.desc      : testPathGetPositionAndTangentNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1901
     * @tc.name      : testPathGetPositionAndTangentMultipleCalls
     * @tc.desc      : testPathGetPositionAndTangentMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1902
     * @tc.name      : testPathGetPositionAndTangentToNull
     * @tc.desc      : testPathGetPositionAndTangentToNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2000
     * @tc.name      : testPathConstructorNormal
     * @tc.desc      : testPathConstructorNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2001
     * @tc.name      : testPathConstructorMultipleCalls
     * @tc.desc      : testPathConstructorMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2100
     * @tc.name      : testPathIsClosedNormal
     * @tc.desc      : testPathIsClosedNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2101
     * @tc.name      : testPathIsClosedMultipleCalls
     * @tc.desc      : testPathIsClosedMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2200
     * @tc.name      : testPathBuildFromSVGStringNormal
     * @tc.desc      : testPathBuildFromSVGStringNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2201
     * @tc.name      : testPathBuildFromSVGStringMultipleCalls
     * @tc.desc      : testPathBuildFromSVGStringMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2202
     * @tc.name      : testPathBuildFromSVGStringToNull
     * @tc.desc      : testPathBuildFromSVGStringToNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_001
     * @tc.name      : testPathGetSegmentNormal
     * @tc.desc      : testPathGetSegmentNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
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
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_002
     * @tc.name      : testPathGetSegmentAbnormal
     * @tc.desc      : testPathGetSegmentAbnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
    })
  })
}