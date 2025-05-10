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

export default function dynamicLoadHap() {
  describe('HapTest', () => {
    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAP_0100
     * @tc.name      : testConstantExpressions01
     * @tc.desc      : Use constant expressions in this project's HAP for dynamic loading,
     *                 using relative paths to load files from ./xxx.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testConstantExpressions01', 0, () => {
      const caseName: string = "testConstantExpressions01";
      import('./testAdd').then(m => {
        expect(m.add(3, 2)).assertEqual(5);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAP_0200
     * @tc.name      : testConstantExpressions02
     * @tc.desc      : Use constant expressions in this project's HAP for dynamic loading,
     *                 using relative paths to load files from ../xxx.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testConstantExpressions02', 0, () => {
      const caseName: string = "testConstantExpressions02";
      import('../testSubtract').then(m => {
        expect(m.subtract(3, 2)).assertEqual(1);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAP_0300
     * @tc.name      : testConstantExpressions03
     * @tc.desc      : Use constant expressions in this project's HAP for dynamic loading,
     *                 using relative paths to load the folder ./xxx.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testConstantExpressions03', 0, () => {
      const caseName: string = "testConstantExpressions03";
      import('./fileTest').then(m => {
        expect(m.multiply(3, 2)).assertEqual(6);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAP_0400
     * @tc.name      : testConstantExpressions04
     * @tc.desc      : Use constant expressions in this project's HAP for dynamic loading,
     *                 using relative paths to load files with Chinese names.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testConstantExpressions04', 0, () => {
      const caseName: string = "testConstantExpressions04";
      import('./fileTest/中文').then(m => {
        expect(m.getInfo()).assertEqual("CN");
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAP_0600
     * @tc.name      : testVariableExpressions01
     * @tc.desc      : Use variable expressions in this project's HAP for dynamic loading,
     *                 using relative paths to load files from ./xxx.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testVariableExpressions01', 0, () => {
      const caseName: string = "testVariableExpressions01";
      let libname = './testAdd';
      import(libname).then((m: ESObject) => {
        expect(m.add(3, 2)).assertEqual(5);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAP_0700
     * @tc.name      : testVariableExpressions02
     * @tc.desc      : Use variable expressions in this project's HAP for dynamic loading,
     *                 using relative paths to load files from ../xxx.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testVariableExpressions02', 0, () => {
      const caseName: string = "testVariableExpressions02";
      let libname = '../testSubtract';
      import(libname).then((m: ESObject) => {
        expect(m.subtract(3, 2)).assertEqual(1);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAP_0800
     * @tc.name      : testVariableExpressions03
     * @tc.desc      : Use variable expressions in this project's HAP for dynamic loading,
     *                 using relative paths to load the folder ./xxx.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testVariableExpressions03', 0, () => {
      const caseName: string = "testVariableExpressions03";
      let libname = './fileTest';
      import(libname).then((m: ESObject) => {
        expect(m.multiply(3, 2)).assertEqual(6);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAP_0900
     * @tc.name      : testVariableExpressions04
     * @tc.desc      : Use variable expressions in this project's HAP for dynamic loading,
     *                 using relative paths to load files with Chinese names.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testVariableExpressions04', 0, () => {
      const caseName: string = "testVariableExpressions04";
      let libname = './fileTest/中文';
      import(libname).then((m: ESObject) => {
        expect(m.getInfo()).assertEqual("CN");
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAP_1000
     * @tc.name      : testNativeSoConstantExpressions01
     * @tc.desc      : Use constant expressions in this project's HAP for dynamic loading
     *                 to load files from absolute paths.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testNativeSoConstantExpressions01', 0, () => {
      const caseName: string = "testNativeSoConstantExpressions01";
      let res: string = '';
      import('@ohos.hilog').then(m => {
        try {
          m.default.info(0x0000, "testTag", "dexter log: call ohos.hilog");
          res = 'success';
        } catch (e) {
          console.error(`${caseName} import catch error: ${JSON.stringify(e)}`);
          res = 'failed';
        }
        expect(res).assertEqual('success');
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAP_1100
     * @tc.name      : testNativeSoConstantExpressions02
     * @tc.desc      : Use constant expressions in this project's HAP for dynamic loading
     *                 to load files from absolute paths.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testNativeSoConstantExpressions02', 0, () => {
      const caseName: string = "testNativeSoConstantExpressions02";
      let res: string = '';
      import('@system.app').then(m => {
        if (m.default.getInfo != undefined) {
          res = 'success';
        }
        expect(res).assertEqual('success');
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAP_1200
     * @tc.name      : testNativeSoConstantExpressions03
     * @tc.desc      : Use constant expressions in this project's HAP for dynamic loading
     *                 to load files from absolute paths.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testNativeSoConstantExpressions03', 0, () => {
      const caseName: string = "testNativeSoConstantExpressions03";
      import('libentry.so').then(m => {
        expect(m.default.add(3, 2)).assertEqual(5);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAP_1300
     * @tc.name      : testNativeSoVariableExpressions01
     * @tc.desc      : Use constant expressions in this project's HAP for dynamic loading
     *                 to load files from absolute paths.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testNativeSoVariableExpressions01', 0, () => {
      const caseName: string = "testNativeSoVariableExpressions01";
      let res: string = '';
      let libname = '@ohos.hilog';
      import(libname).then((m: ESObject) => {
        m.default.info(0x0000, "testTag", "dexter log: call ohos.hilog");
        res = 'success';
        expect(res).assertEqual('success');
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAP_1400
     * @tc.name      : testNativeSoVariableExpressions02
     * @tc.desc      : Use constant expressions in this project's HAP for dynamic loading
     *                 to load files from absolute paths.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testNativeSoVariableExpressions02', 0, () => {
      const caseName: string = "testNativeSoVariableExpressions02";
      let res: string = '';
      let libname = '@system.app';
      import(libname).then((m: ESObject) => {
        if (m.default.getInfo != undefined) {
          res = 'success';
        }
        expect(res).assertEqual('success');
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAP_1500
     * @tc.name      : testNativeSoVariableExpressions03
     * @tc.desc      : Use constant expressions in this project's HAP for dynamic loading
     *                 to load files from absolute paths.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testNativeSoVariableExpressions03', 0, async () => {
      const caseName: string = "testNativeSoVariableExpressions03";
      let libname = 'libentry.so';
      try {
        let m: ESObject = await import(libname);
        console.error(`${caseName} m: ${JSON.stringify(m)}`);
        expect(m.default.add(3, 2)).assertEqual(5);
      } catch (error) {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAP_1600
     * @tc.name      : testJsonConstantExpressions01
     * @tc.desc      : Use constant expressions in this project's HAP for dynamic loading
     *                 to load files from absolute paths.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testJsonConstantExpressions01', 0, () => {
      const caseName: string = "testJsonConstantExpressions01";
      import('./fileTest/1.json').then(m => {
        expect(m.default.name).assertEqual('testJson');
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect().assertFail();
      })
    })
  })
}