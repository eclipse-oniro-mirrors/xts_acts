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

export default function dynamicLoadHar() {
  describe('HarTest', () => {
    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAR_0100
     * @tc.name      : testConstantExpressionsHar01
     * @tc.desc      : Test constant expression loading har.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testConstantExpressionsHar01', 0, () => {
      const caseName: string = "testConstantExpressionsHar01";
      import('har').then(m => {
        expect(m.add(3, 2)).assertEqual(5);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAR_0200
     * @tc.name      : testConstantExpressionsHar02
     * @tc.desc      : Test constant expression loading har.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testConstantExpressionsHar02', 0, () => {
      const caseName: string = "testConstantExpressionsHar02";
      import('har/src/main/ets/testAdd').then(m => {
        expect(m.add(3, 2)).assertEqual(5);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAR_0300
     * @tc.name      : testConstantExpressionsHar03
     * @tc.desc      : Test constant expression loading har.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testConstantExpressionsHar03', 0, () => {
      const caseName: string = "testConstantExpressionsHar03";
      import('@test/loadHar').then(m => {
        expect(m.add(3, 2)).assertEqual(5);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAR_0400
     * @tc.name      : testConstantExpressionsHar04
     * @tc.desc      : Test constant expression loading har.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testConstantExpressionsHar04', 0, () => {
      const caseName: string = "testConstantExpressionsHar04";
      import('@test/loadHar/src/main/ets/getHarNameTest').then(m => {
        expect(m.getHarName()).assertEqual('loadHar');
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAR_0500
     * @tc.name      : testConstantExpressionsOhpm01
     * @tc.desc      : Test constant expression loading ohpm.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("testConstantExpressionsOhpm01", 0, () => {
      const caseName: string = "testConstantExpressionsOhpm02";
      const str = "12345678901234567890";
      const assertNum: number = -1420514932;
      import('long').then(m => {
        let value = m.default.fromString(str);
        expect(value.high).assertEqual(assertNum);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAR_0700
     * @tc.name      : testConstantExpressionsOhpm03
     * @tc.desc      : Test constant expression loading ohpm.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("testConstantExpressionsOhpm03", 0, () => {
      const caseName: string = "testConstantExpressionsOhpm03";
      import('@ohos/hypium').then(m => {
        m.expect(true).assertTrue();
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAR_0800
     * @tc.name      : testConstantExpressionsOhpm04
     * @tc.desc      : Test constant expression loading ohpm.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("testConstantExpressionsOhpm04", 0, () => {
      const caseName: string = "testConstantExpressionsOhpm04";
      import('@ohos/hypium/src/main/Constant').then((m: ESObject) => {
        expect(m.TAG).assertEqual('[Hypium]');
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAR_0900
     * @tc.name      : testVariableExpressionsHar01
     * @tc.desc      : Test variable expression loading har.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testVariableExpressionsHar01', 0, () => {
      const caseName: string = "testVariableExpressionsHar01";
      let libname = 'har';
      import(libname).then((m: ESObject) => {
        expect(m.add(3, 2)).assertEqual(5);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAR_1000
     * @tc.name      : testVariableExpressionsHar02
     * @tc.desc      : Test variable expression loading har.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testVariableExpressionsHar02', 0, () => {
      const caseName: string = "testVariableExpressionsHar02";
      let libname = 'har/src/main/ets/testAdd';
      import(libname).then((m: ESObject) => {
        expect(m.add(3, 2)).assertEqual(5);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAR_1100
     * @tc.name      : testVariableExpressionsHar03
     * @tc.desc      : Test variable expression loading har.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testVariableExpressionsHar03', 0, () => {
      const caseName: string = "testVariableExpressionsHar03";
      let libname = '@test/loadHar';
      import(libname).then((m: ESObject) => {
        expect(m.add(3, 2)).assertEqual(5);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAR_1200
     * @tc.name      : testVariableExpressionsHar04
     * @tc.desc      : Test variable expression loading har.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testVariableExpressionsHar04', 0, () => {
      const caseName: string = "testVariableExpressionsHar04";
      let libname = '@test/loadHar/src/main/ets/getHarNameTest';
      import(libname).then((m: ESObject) => {
        expect(m.getHarName()).assertEqual('loadHar');
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAR_1300
     * @tc.name      : testVariableExpressionsOhpm01
     * @tc.desc      : Test variable expression loading ohpm.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("testVariableExpressionsOhpm01", 0, () => {
      const caseName: string = "testVariableExpressionsOhpm01";
      let libname = '@ohos/hypium';
      import(libname).then((m: ESObject) => {
        m.expect(true).assertTrue();
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAR_1400
     * @tc.name      : testVariableExpressionsOhpm02
     * @tc.desc      : Test variable expression loading ohpm.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("testVariableExpressionsOhpm02", 0, () => {
      const caseName: string = "testVariableExpressionsOhpm02";
      let libname = '@ohos/hypium/src/main/Constant';
      import(libname).then((m: ESObject) => {
        expect(m.TAG).assertEqual('[Hypium]');
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })
  })
}