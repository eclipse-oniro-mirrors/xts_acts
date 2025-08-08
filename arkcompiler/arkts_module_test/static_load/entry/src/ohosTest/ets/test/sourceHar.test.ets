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
  add1,
  subtract,
  multiply,
  testGetCNInfo,
  addTest,
  getHarName,
  addTest2,
  getHarName2,
  npmRes,
  npmRes2,
  expect2,
  ConstantTAG,
  hspAdd,
  hspAdd2,
  hspSubtract,
  hspSubtract2
} from "har"

export default function staticLoadSourceHar() {
  describe('StaticLoadSourceHarTest', () => {

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_STATIC_LOAD_SOURCE_HAR_0100
     * @tc.name      : testSourceHar01
     * @tc.desc      : Test static loading of the source HAR, invoking the files exported with relative paths ./xxx.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testSourceHar01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = "testSourceHar01";
      try {
        expect(add1(3, 2)).assertEqual(5);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_STATIC_LOAD_SOURCE_HAR_0200
     * @tc.name      : testSourceHar02
     * @tc.desc      : Test static loading of the source HAR, invoking the files exported with relative paths ../xxx.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testSourceHar02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = "testSourceHar02";
      try {
        expect(subtract(3, 2)).assertEqual(1);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_STATIC_LOAD_SOURCE_HAR_0300
     * @tc.name      : testSourceHar03
     * @tc.desc      : Test static loading of the source HAR, invoking the folders exported with relative paths.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testSourceHar03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = "testSourceHar03";
      try {
        expect(multiply(3, 2)).assertEqual(6);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_STATIC_LOAD_SOURCE_HAR_0400
     * @tc.name      : testSourceHar04
     * @tc.desc      : Test static loading of the source HAR, accessing the exported files with Chinese names.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("testSourceHar04", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = "testSourceHar04";
      try {
        expect(testGetCNInfo()).assertEqual("CN");
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_STATIC_LOAD_SOURCE_HAR_0500
     * @tc.name      : testSourceHar05
     * @tc.desc      : Load har, package name xxx.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("testSourceHar05", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = "testSourceHar05";
      try {
        expect(addTest(3, 2)).assertEqual(5);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_STATIC_LOAD_SOURCE_HAR_0600
     * @tc.name      : testSourceHar06
     * @tc.desc      : Load har, two-level package name @xxx/xxx.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("testSourceHar06", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = "testSourceHar07";
      try {
        expect(addTest2(3, 2)).assertEqual(5);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_STATIC_LOAD_SOURCE_HAR_0700
     * @tc.name      : testSourceHar07
     * @tc.desc      : Load har, package name + path xxx/file/xxx.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("testSourceHar07", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = "testSourceHar07";
      try {
        expect(getHarName()).assertEqual("load_har");
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_STATIC_LOAD_SOURCE_HAR_0800
     * @tc.name      : testSourceHar08
     * @tc.desc      : Load har, two-level package name + path @xxx/xxx/file/xxx.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("testSourceHar08", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = "testSourceHar08";
      try {
        expect(getHarName2()).assertEqual("load_har");
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_STATIC_LOAD_SOURCE_HAR_0900
     * @tc.name      : testSourceHar09
     * @tc.desc      : Remote har, package name xxx.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("testSourceHar09", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = "testSourceHar09";
      try {
        expect(npmRes).assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_STATIC_LOAD_SOURCE_HAR_1000
     * @tc.name      : testSourceHar10
     * @tc.desc      : Remote har, two-level package name @xxx/xxx.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("testSourceHar10", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = "testSourceHar10";
      try {
        expect2(true).assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_STATIC_LOAD_SOURCE_HAR_1100
     * @tc.name      : testSourceHar11
     * @tc.desc      : Remote har, package name + path xxx/file/xxx.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("testSourceHar11", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = "testSourceHar11";
      try {
        expect(npmRes2).assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_STATIC_LOAD_SOURCE_HAR_1200
     * @tc.name      : testSourceHar12
     * @tc.desc      : Remote har, two-level package name + path @xxx/xxx/file/xxx.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("testSourceHar12", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = "testSourceHar12";
      try {
        expect(ConstantTAG).assertEqual('[Hypium]');
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_STATIC_LOAD_SOURCE_HAR_1300
     * @tc.name      : testSourceHar13
     * @tc.desc      : The same project HSP, package name xxx.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("testSourceHar13", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = "testSourceHar13";
      try {
        expect(hspAdd(2, 3)).assertEqual(5);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_STATIC_LOAD_SOURCE_HAR_1400
     * @tc.name      : testSourceHar14
     * @tc.desc      : The same project HSP, two-level package name @xxx/xxx.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("testSourceHar14", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = "testSourceHar14";
      try {
        expect(hspAdd2(2, 3)).assertEqual(5);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_STATIC_LOAD_SOURCE_HAR_1500
     * @tc.name      : testSourceHar15
     * @tc.desc      : The same project HSP, package name + path xxx/file/xxx.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("testSourceHar15", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = "testSourceHar15";
      try {
        expect(hspSubtract(3, 2)).assertEqual(1);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_STATIC_LOAD_SOURCE_HAR_1600
     * @tc.name      : testSourceHar16
     * @tc.desc      : The same project HSP, two-level package name + path @xxx/xxx/file/xxx.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("testSourceHar16", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = "testSourceHar16";
      try {
        expect(hspSubtract2(3, 2)).assertEqual(1);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })
  })
}