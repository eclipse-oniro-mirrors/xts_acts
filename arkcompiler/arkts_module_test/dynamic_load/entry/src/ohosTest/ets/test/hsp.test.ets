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

import { describe, it, expect } from "@ohos/hypium"
import { BusinessError } from "@kit.BasicServicesKit";

export default function dynamicLoadHsp() {
  describe('HspTest', () => {
    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HSP_0100
     * @tc.name      : testConstantExpressionsHsp01
     * @tc.desc      : Test constant expression loading hsp.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testConstantExpressionsHsp01', 0, () => {
      const caseName: string = "testConstantExpressionsHsp01";
      import('hsp').then(m => {
        expect(m.add(3, 2)).assertEqual(5);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HSP_0200
     * @tc.name      : testConstantExpressionsHsp02
     * @tc.desc      : Test constant expression loading hsp.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testConstantExpressionsHsp02', 0, () => {
      const caseName: string = "testConstantExpressionsHsp02";
      import('hsp/src/main/ets/utils/Calc').then(m => {
        expect(m.add(3, 2)).assertEqual(5);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HSP_0300
     * @tc.name      : testConstantExpressionsHsp03
     * @tc.desc      : Test constant expression loading hsp.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testConstantExpressionsHsp03', 0, () => {
      const caseName: string = "testConstantExpressionsHsp03";
      import('@test/loadHsp').then(m => {
        expect(m.add(3, 2)).assertEqual(5);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HSP_0400
     * @tc.name      : testConstantExpressionsHsp04
     * @tc.desc      : Test constant expression loading hsp.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testConstantExpressionsHsp04', 0, () => {
      const caseName: string = "testConstantExpressionsHsp04";
      import('@test/loadHsp/src/main/ets/utils/Calc').then(m => {
        expect(m.add(3, 2)).assertEqual(5);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HSP_0500
     * @tc.name      : testVariableExpressionsHsp01
     * @tc.desc      : Test variable expression loading hsp.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testVariableExpressionsHsp01', 0, () => {
      const caseName: string = "testVariableExpressionsHsp01";
      let libname = 'hsp';
      import(libname).then((m: ESObject) => {
        expect(m.add(3, 2)).assertEqual(5);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HSP_0600
     * @tc.name      : testVariableExpressionsHsp02
     * @tc.desc      : Test variable expression loading hsp.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testVariableExpressionsHsp02', 0, () => {
      const caseName: string = "testVariableExpressionsHsp02";
      let libname = 'hsp/src/main/ets/utils/Calc';
      import(libname).then((m: ESObject) => {
        expect(m.add(3, 2)).assertEqual(5);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HSP_0700
     * @tc.name      : testVariableExpressionsHsp03
     * @tc.desc      : Test variable expression loading hsp.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testVariableExpressionsHsp03', 0, () => {
      const caseName: string = "testVariableExpressionsHsp03";
      let libname = '@test/loadHsp';
      import(libname).then((m: ESObject) => {
        expect(m.add(3, 2)).assertEqual(5);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HSP_0800
     * @tc.name      : testVariableExpressionsHsp04
     * @tc.desc      : Test variable expression loading hsp.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testVariableExpressionsHsp04', 0, () => {
      const caseName: string = "testVariableExpressionsHsp04";
      let libname = '@test/loadHsp/src/main/ets/utils/Calc';
      import(libname).then((m: ESObject) => {
        expect(m.add(3, 2)).assertEqual(5);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })
  })
}