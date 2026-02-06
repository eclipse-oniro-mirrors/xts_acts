/**
 * Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium"
import { BusinessError } from "@kit.BasicServicesKit";

export default function dynamicLoadHap() {
  describe('HapTest', () => {
    /**
     * @tc.name   testConstantExpressions01
     * @tc.number SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAP_0100
     * @tc.desc   Use constant expressions in this project's HAP for dynamic loading,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConstantExpressions01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = "testConstantExpressions01";
      import('./TestAdd.test').then(m => {
        expect(m.add(3, 2)).assertEqual(5);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.name   testConstantExpressions02
     * @tc.number SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAP_0200
     * @tc.desc   Use constant expressions in this project's HAP for dynamic loading,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConstantExpressions02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = "testConstantExpressions02";
      import('../TestSubtract.test').then(m => {
        expect(m.subtract(3, 2)).assertEqual(1);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.name   testConstantExpressions03
     * @tc.number SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAP_0300
     * @tc.desc   Use constant expressions in this project's HAP for dynamic loading,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConstantExpressions03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = "testConstantExpressions03";
      import('./fileTest/Index.test').then(m => {
        expect(m.multiply(3, 2)).assertEqual(6);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.name   testConstantExpressions04
     * @tc.number SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAP_0400
     * @tc.desc   Use constant expressions in this project's HAP for dynamic loading,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConstantExpressions04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = "testConstantExpressions04";
      import('./fileTest/Chinese.test').then(m => {
        expect(m.getInfo()).assertEqual("CN");
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.name   testVariableExpressions01
     * @tc.number SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAP_0600
     * @tc.desc   Use variable expressions in this project's HAP for dynamic loading,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVariableExpressions01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = "testVariableExpressions01";
      let libname = './TestAdd.test';
      import(libname).then((m: ESObject) => {
        expect(m.add(3, 2)).assertEqual(5);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.name   testVariableExpressions02
     * @tc.number SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAP_0700
     * @tc.desc   Use variable expressions in this project's HAP for dynamic loading,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVariableExpressions02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = "testVariableExpressions02";
      let libname = '../TestSubtract.test';
      import(libname).then((m: ESObject) => {
        expect(m.subtract(3, 2)).assertEqual(1);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.name   testVariableExpressions03
     * @tc.number SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAP_0800
     * @tc.desc   Use variable expressions in this project's HAP for dynamic loading,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVariableExpressions03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = "testVariableExpressions03";
      let libname = './fileTest/Index.test';
      import(libname).then((m: ESObject) => {
        expect(m.multiply(3, 2)).assertEqual(6);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.name   testVariableExpressions04
     * @tc.number SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAP_0900
     * @tc.desc   Use variable expressions in this project's HAP for dynamic loading,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVariableExpressions04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = "testVariableExpressions04";
      let libname = './fileTest/Chinese.test';
      import(libname).then((m: ESObject) => {
        expect(m.getInfo()).assertEqual("CN");
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.name   testNativeSoConstantExpressions01
     * @tc.number SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAP_1000
     * @tc.desc   Use constant expressions in this project's HAP for dynamic loading
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeSoConstantExpressions01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
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
     * @tc.name   testNativeSoConstantExpressions02
     * @tc.number SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAP_1100
     * @tc.desc   Use constant expressions in this project's HAP for dynamic loading
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeSoConstantExpressions02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
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
     * @tc.name   testNativeSoConstantExpressions03
     * @tc.number SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAP_1200
     * @tc.desc   Use constant expressions in this project's HAP for dynamic loading
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeSoConstantExpressions03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = "testNativeSoConstantExpressions03";
      import('libentry.so').then(m => {
        expect(m.default.add(3, 2)).assertEqual(5);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.name   testNativeSoVariableExpressions01
     * @tc.number SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAP_1300
     * @tc.desc   Use constant expressions in this project's HAP for dynamic loading
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeSoVariableExpressions01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
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
     * @tc.name   testNativeSoVariableExpressions02
     * @tc.number SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAP_1400
     * @tc.desc   Use constant expressions in this project's HAP for dynamic loading
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeSoVariableExpressions02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
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
     * @tc.name   testNativeSoVariableExpressions03
     * @tc.number SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAP_1500
     * @tc.desc   Use constant expressions in this project's HAP for dynamic loading
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeSoVariableExpressions03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
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
     * @tc.name   testJsonConstantExpressions01
     * @tc.number SUB_COMPILER_RUNTIME_DYNAMIC_LOAD_HAP_1600
     * @tc.desc   Use constant expressions in this project's HAP for dynamic loading
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testJsonConstantExpressions01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = "testJsonConstantExpressions01";
      import('./fileTest/1.json').then(m => {
        expect(m.default.name).assertEqual('testJson');
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${JSON.stringify(error)}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.name   testDynamicDeregisterSingle01
     * @tc.number SUB_COMPILER_RUNTIME_DYNAMIC_DEREGISTER_HAP_0100
     * @tc.desc   Use constant expressions in this project's HAP for dynamic loading,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDynamicDeregisterSingle01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = "testDynamicDeregisterSingle01";
      import('../test/fileTest/singleA').then(m => {
        expect(m.singleA).assertEqual("singleA");
        markModuleCollectable(m);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.name   testDynamicDeregisterSingle02
     * @tc.number SUB_COMPILER_RUNTIME_DYNAMIC_DEREGISTER_HAP_0200
     * @tc.desc   Use constant expressions in this project's HAP for dynamic loading,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDynamicDeregisterSingle02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = "testDynamicDeregisterSingle02";
      import('../test/fileTest/singleB').then(m => {
        expect(m.funB()).assertEqual("funB");
        markModuleCollectable(m);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.name   testDynamicDeregisterSingle03
     * @tc.number SUB_COMPILER_RUNTIME_DYNAMIC_DEREGISTER_HAP_0300
     * @tc.desc   Use constant expressions in this project's HAP for dynamic loading,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDynamicDeregisterSingle03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = "testDynamicDeregisterSingle03";
      import('../test/fileTest/singleC').then(m => {
        let test = new m.SingleC();
        expect(test.a).assertEqual(1);
        expect(test.funC()).assertEqual('func');
        expect(m.SingleC.b).assertEqual('b0');
        markModuleCollectable(m);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.name   testDynamicDeregisterMulti01
     * @tc.number SUB_COMPILER_RUNTIME_DYNAMIC_DEREGISTER_HAP_0400
     * @tc.desc   Use constant expressions in this project's HAP for dynamic loading,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDynamicDeregisterMulti01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = "testDynamicDeregisterMulti01";
      import('../test/fileTest/multiB').then(m => {
        expect(m.multiB()).assertEqual('funBsing');
        markModuleCollectable(m);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.name   testDynamicDeregisterMulti02
     * @tc.number SUB_COMPILER_RUNTIME_DYNAMIC_DEREGISTER_HAP_0500
     * @tc.desc   Use constant expressions in this project's HAP for dynamic loading,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDynamicDeregisterMulti02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = "testDynamicDeregisterMulti02";
      import('../test/fileTest/multiC').then(m => {
        let test = new m.default()
        expect(test.mulFunc()).assertEqual('funBsing');
        markModuleCollectable(m);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.name   testDynamicDeregisterMulti03
     * @tc.number SUB_COMPILER_RUNTIME_DYNAMIC_DEREGISTER_HAP_0600
     * @tc.desc   Use constant expressions in this project's HAP for dynamic loading,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDynamicDeregisterMulti03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = "testDynamicDeregisterMulti03";
      import('../test/fileTest/multiD').then(m => {
        expect(m.multiD()).assertEqual('funBb0');
        markModuleCollectable(m);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.name   testDynamicDeregisterCircular01
     * @tc.number SUB_COMPILER_RUNTIME_DYNAMIC_DEREGISTER_HAP_0700
     * @tc.desc   Use constant expressions in this project's HAP for dynamic loading,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDynamicDeregisterCircular01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = "testDynamicDeregisterCircular01";
      import('../test/fileTest/circularB').then(m => {
        let test = new m.TestB;
        expect(test.fun()).assertEqual('testb');
        markModuleCollectable(m);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.name   testDynamicDeregisterCircular02
     * @tc.number SUB_COMPILER_RUNTIME_DYNAMIC_DEREGISTER_HAP_0800
     * @tc.desc   Use constant expressions in this project's HAP for dynamic loading,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDynamicDeregisterCircular02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = "testDynamicDeregisterCircular02";
      import('../test/fileTest/circularC').then(m => {
        expect(m.testC()).assertEqual(3);
        markModuleCollectable(m);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   testDynamicDeregisterDynamic01
     * @tc.number SUB_COMPILER_RUNTIME_DYNAMIC_DEREGISTER_HAP_0900
     * @tc.desc   Use constant expressions in this project's HAP for dynamic loading,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDynamicDeregisterDynamic01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = "testDynamicDeregisterDynamic01";
      import('../test/fileTest/dynamicC').then(m => {
        expect(m.fun()).assertEqual(5);
        markModuleCollectable(m);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   testDynamicDeregisterMuiliLoad01
     * @tc.number SUB_COMPILER_RUNTIME_DYNAMIC_DEREGISTER_HAP_1000
     * @tc.desc   Use constant expressions in this project's HAP for dynamic loading,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDynamicDeregisterMuiliLoad01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = "testDynamicDeregisterMuiliLoad01";
      import('../test/fileTest/multiLoadC').then(m => {
        expect(m.multiLoadC).assertEqual("multiLoadBmultiLoadA");
        markModuleCollectable(m);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   testDynamicDeregisterMuiliLoad02
     * @tc.number SUB_COMPILER_RUNTIME_DYNAMIC_DEREGISTER_HAP_1100
     * @tc.desc   Use constant expressions in this project's HAP for dynamic loading,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDynamicDeregisterMuiliLoad02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = "testDynamicDeregisterMuiliLoad02";
      import('../test/fileTest/multiLoadE').then(m => {
        expect(m.multiLoadE).assertEqual(11);
        markModuleCollectable(m);
      }).catch((error: BusinessError) => {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      })
    })
  })
}