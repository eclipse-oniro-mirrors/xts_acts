/**
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { describe, it, expect ,TestType, Size, Level } from "@ohos/hypium"
import {
  hspAdd,
  hspSubtract,
  hspMultiply,
  hspGetCNInfo,
  harAdd,
  harSubtract,
  harMultiply,
  harGetCNInfo,
  npmRes
} from "hsp"

export default function staticLoadHsp() {
  describe('HspTest', () => {

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_STATIC_LOAD_HSP_0100
     * @tc.name      : testStaticLoadHsp01
     * @tc.desc      : Test static loading of the source HSP, invoking the files exported with relative paths ./xxx.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testStaticLoadHsp01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = "testStaticLoadHsp01";
      try {
        expect(hspAdd(3, 2)).assertEqual(5);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_STATIC_LOAD_HSP_0200
     * @tc.name      : testStaticLoadHsp02
     * @tc.desc      : Test static loading of the source HSP, invoking the files exported with relative paths ../xxx.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testStaticLoadHsp02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = "testStaticLoadHsp02";
      try {
        expect(hspSubtract(3, 2)).assertEqual(1);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_STATIC_LOAD_HSP_0300
     * @tc.name      : testStaticLoadHsp03
     * @tc.desc      : Test static loading of the source HSP, invoking the folders exported with relative paths.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testStaticLoadHsp03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = "testStaticLoadHsp03";
      try {
        expect(hspMultiply(3, 2)).assertEqual(6);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_STATIC_LOAD_HSP_0400
     * @tc.name      : testStaticLoadHsp04
     * @tc.desc      : Test static loading of the source HSP, accessing the exported files with Chinese names.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("testStaticLoadHsp04", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = "testStaticLoadHsp04";
      try {
        expect(hspGetCNInfo()).assertEqual("CN");
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_STATIC_LOAD_HSP_0500
     * @tc.name      : testStaticLoadHsp05
     * @tc.desc      : Test static loading of the source HAR, invoking the files exported with relative paths ./xxx.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("testStaticLoadHsp05", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = "testStaticLoadHsp05";
      try {
        expect(harAdd(3, 2)).assertEqual(5);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_STATIC_LOAD_HSP_0600
     * @tc.name      : testStaticLoadHsp06
     * @tc.desc      : Test static loading of the source HAR, invoking the files exported with relative paths ../xxx.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("testStaticLoadHsp06", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = "testStaticLoadHsp06";
      try {
        expect(harSubtract(3, 2)).assertEqual(1);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_STATIC_LOAD_HSP_0700
     * @tc.name      : testStaticLoadHsp07
     * @tc.desc      : Test static loading of the source HAR, invoking the folders exported with relative paths.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("testStaticLoadHsp07", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = "testStaticLoadHsp07";
      try {
        expect(harMultiply(3, 2)).assertEqual(6);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_STATIC_LOAD_HSP_0800
     * @tc.name      : testStaticLoadHsp08
     * @tc.desc      : Test static loading of the source HAR, accessing the exported files with Chinese names.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("testStaticLoadHsp08", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = "testStaticLoadHsp08";
      try {
        expect(harGetCNInfo()).assertEqual("CN");
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_STATIC_LOAD_HSP_0900
     * @tc.name      : testStaticLoadHsp09
     * @tc.desc      : Load the ohpm package.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("testStaticLoadHsp09", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = "testStaticLoadHsp09";
      try {
        expect(npmRes).assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })
  })
}