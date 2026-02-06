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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from "../../../hypium/index";
import drawing from '@ohos.graphics.drawing';
import { BusinessError } from '@ohos.base';

export default function drawingTsPathTest() {
  describe('DrawingTsPathTest', () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_0300
     * @tc.name      : testPathArcToNormalStatic
     * @tc.desc      : testPathArcToNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testPathArcToNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testPathArcToNormalStatic';
      try {
        let path = new drawing.Path();
        path.arcTo(10, 15, 10, 10, 0, 360);
        path.arcTo(10.2, 15.3, 10.4, 10.5, 10.3, 60.3);
        path.arcTo(-10, -15, 10, 10, 90, 180);
        path.arcTo(10, 15, -10, -10, 90, 180);
        path.arcTo(10, 15, 10, 10, -90, 180);
        path.arcTo(10, 15, 10, 10, 90, -180);
        console.info(msg + 'arcTo successed');
      } catch (e: BusinessError) {
        console.info(msg + `arcTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_0303
     * @tc.name      : testPathArcToMultipleCallsStatic
     * @tc.desc      : testPathArcToMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathArcToMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg = 'testPathArcToMultipleCallsStatic';
      try {
        let path = new drawing.Path();
        for (let index = 0; index < 20; index++) {
          path.arcTo(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
            Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
            Math.random() * Number.MAX_VALUE);
        }
        console.info(msg + 'arcTo successed');
      } catch (e: BusinessError) {
        console.info(msg + `arcTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_0700
     * @tc.name      : testPathResetNormalStatic
     * @tc.desc      : testPathResetNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testPathResetNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testPathResetNormalStatic';
      try {
        let path = new drawing.Path();
        path.reset();
        console.info(msg + 'reset successed');
      } catch (e: BusinessError) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_0701
     * @tc.name      : testPathResetMultipleCallsStatic
     * @tc.desc      : testPathResetMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathResetMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg = 'testPathResetMultipleCallsStatic';
      let path = new drawing.Path();
      try {
        for (let index = 0; index < 20; index++) {
          // path.cubicTo(10, 10, 10, 10, 15, 15);
          path.reset();
        }
        // path.close()
        console.info(msg + 'reset successed');
      } catch (e: BusinessError) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      // try {
      //   path.cubicTo(10, 10, 10, 10, 15, 15);
      //   for (let index = 0; index < 20; index++) {
      //     path.reset();
      //   }
      //   path.close()
      //   console.info(msg + 'reset successed');
      // } catch (e: BusinessError) {
      //   console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
      //   expect().assertFail()
      // }
    })
  })
}