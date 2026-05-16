/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, afterEach, expect, it, TestType, Level, Size } from '@ohos/hypium'
import { jsLeakWatcher } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@ohos.base'
import common from '@ohos.app.ability.common';

export function asyncSleep(time: number): Promise<Object> {
  return new Promise(resolve => setTimeout(resolve, time));
};

let obj : Object = new Object();

export default function JsLeakWatcherNewTest() {
  describe('JsLeakWatcherNewTest', () => {
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      try {
        let config : Array<string> = [];
        jsLeakWatcher.enableLeakWatcher(false, config, (filepath : Array<string>) => {
          console.log('testJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
      } catch (err) {
        console.error(`testJsLeakWatcher > err code: ${err.code}, err msg: ${err.message}`)
        console.info("testJsLeakWatcher fail!");
      }
    })
    /**
     * @tc.name   testJsLeakWatcher07
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_0700
     * @tc.desc   验证enableLeakWatcher接口正常传参
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testJsLeakWatcher07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_0700 start");
      try {
        jsLeakWatcher.enable(false);
        let leakFilePath:Array<string> = [];
        let config : Array<string> = [];
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0700 leakListFileName: ' + filepath[0]);
          console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0700 heapDumpFileName: ' + filepath[1]);
          leakFilePath = filepath;
        });
        expect(leakFilePath.length == 0).assertTrue();
        jsLeakWatcher.watch(obj, 'test_watch');
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0700 test_' + obj.toString());
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0700 wait start')
        await asyncSleep(35000);
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0700 wait end')
        let checkstr:string = jsLeakWatcher.check();
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0700 checkstr' + checkstr)
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0700 leakListFileName1 check: ' + leakFilePath[0]);
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0700 heapDumpFileName1 check: ' + leakFilePath[1]);
        expect(leakFilePath.length > 0).assertTrue();
        expect(leakFilePath[0]).assertContain(".jsleaklist");
        expect(leakFilePath[1]).assertContain(".rawheap");
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0700 enable success')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcher_Interface_0700 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_0700 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_0700 end");
    })

    /**
     * @tc.name   testJsLeakWatcher08
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_0800
     * @tc.desc   验证enableLeakWatcher接口isEnabled参数传入undefined值返回错误码10801001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsLeakWatcher08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_0800 start");
      try {
        let config : Array<string> = [];
        jsLeakWatcher.enableLeakWatcher(undefined, config, (filepath : Array<string>) => {
          console.log('testJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0800 isEnabled undefined')
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcher_Interface_0800 > err code: ${err.code}, err msg: ${err.message}`)
        expect(err.code == 10801001).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_0800 end");
    })

    /**
     * @tc.name   testJsLeakWatcher09
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_0900
     * @tc.desc   验证enableLeakWatcher接口isEnabled参数传入false值返回正常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsLeakWatcher09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_0900 start");
      try {
        let leakFilePath:Array<string> = [];
        let config : Array<string> = [];
        jsLeakWatcher.enableLeakWatcher(false, config, (filepath : Array<string>) => {
          console.log('testJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testJsLeakWatcher heapDumpFileName: ' + filepath[1]);
          leakFilePath = filepath;
        });
        expect(leakFilePath.length == 0).assertTrue();
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0900 isEnabled false')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcher_Interface_0900 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_0900 end");
    })

    /**
     * @tc.name   testJsLeakWatcher10
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_1000
     * @tc.desc   验证enableLeakWatcher接口config参数传入undefined值返回错误码10801002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsLeakWatcher10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_1000 start");
      try {
        jsLeakWatcher.enableLeakWatcher(true, undefined, (filepath : Array<string>) => {
          console.log('testJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1000 config undefined')
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcher_Interface_1000 > err code: ${err.code}, err msg: ${err.message}`)
        expect(err.code == 10801002).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_1000 end");
    })

    /**
     * @tc.name   testJsLeakWatcher11
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_1100
     * @tc.desc   验证enableLeakWatcher接口callback参数传入undefined值返回错误码10801003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsLeakWatcher11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_1100 start");
      try {
        let config : Array<string> = [];
        jsLeakWatcher.enableLeakWatcher(true, config, undefined);
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1100 callback undefined')
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcher_Interface_1100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(err.code == 10801003).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_1100 end");
    })

    /**
     * @tc.name   testJsLeakWatcher12
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_1200
     * @tc.desc   验证enableLeakWatcher接口config参数传入支持类型和非支持类型混合返回错误码10801002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsLeakWatcher12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_1200 start");
      try {
        let config : Array<string> = ['CustomComponentABC'];
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1200 config error type')
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcher_Interface_1200 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_1200 fail!");
        expect(err.code == 10801002).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_1200 end");
    })

    /**
     * @tc.name   testJsLeakWatcher13
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_1300
     * @tc.desc   验证enableLeakWatcher接口config参数传入支持类型和非支持类型数组返回错误码10801002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsLeakWatcher13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_1300 start");
      try {
        let config : Array<string> = ['CustomComponent', 'ABC'];
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1300 config error type')
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcher_Interface_1300 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_1300 fail!");
        expect(err.code == 10801002).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_1300 end");
    })

    /**
     * @tc.name   testJsLeakWatcher14
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_1400
     * @tc.desc   验证enableLeakWatcher接口isEnabled参数传入true值稳定性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsLeakWatcher14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_1400 start");
      try {
        let config : Array<string> = [];
        for (let i = 1; i <= 100; i++) {
          jsLeakWatcher.enableLeakWatcher(true, config, (filepath: Array<string>) => {
            console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1400 leakListFileName: ' + filepath[0]);
            console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1400 heapDumpFileName: ' + filepath[1]);
          });
          console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1400 ' + i + ' times success')
        }
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1400 success')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcher_Interface_1400 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_1400 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_1400 end");
    })

    /**
     * @tc.name   testJsLeakWatcher15
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_1500
     * @tc.desc   验证enableLeakWatcher接口isEnabled参数传入false值稳定性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsLeakWatcher15', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_1500 start");
      try {
        let config : Array<string> = [];
        for (let i = 1; i <= 100; i++) {
          jsLeakWatcher.enableLeakWatcher(false, config, (filepath: Array<string>) => {
            console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1500 leakListFileName: ' + filepath[0]);
            console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1500 heapDumpFileName: ' + filepath[1]);
          });
          console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1500 ' + i + ' times success')
        }
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1500 success')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcher_Interface_1500 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_1500 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_1500 end");
    })

    /**
     * @tc.name   testJsLeakWatcher16
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_1600
     * @tc.desc   验证enableLeakWatcher接口config参数传入CustomComponent类型正常返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsLeakWatcher16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_1600 start");
      try {
        let leakFilePath:Array<string> = [];
        let config : Array<string> = ['CustomComponent'];
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1600 leakListFileName: ' + filepath[0]);
          console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1600 heapDumpFileName: ' + filepath[1]);
          leakFilePath = filepath
        });
        jsLeakWatcher.watch(obj,'test_watch');
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1600 test_' + obj.toString());
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1600 wait start')
        await asyncSleep(35000);
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1600 wait end')
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1600 leakListFileName check: ' + leakFilePath[0]);
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1600 heapDumpFileName check: ' + leakFilePath[1]);
        expect(leakFilePath[0]).assertContain(".jsleaklist");
        expect(leakFilePath[1]).assertContain(".rawheap");
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1600 enable success');
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcher_Interface_1600 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_1600 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_1600 end");
    })

    /**
     * @tc.name   testJsLeakWatcher17
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_1700
     * @tc.desc   验证enableLeakWatcher接口config参数传入Window类型正常返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsLeakWatcher17', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_1700 start");
      try {
        let leakFilePath:Array<string> = [];
        let config : Array<string> = ['Window'];
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1700 leakListFileName: ' + filepath[0]);
          console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1700 heapDumpFileName: ' + filepath[1]);
          leakFilePath = filepath
        });
        jsLeakWatcher.watch(obj,'test_watch');
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1700 test_' + obj.toString());
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1700 wait start')
        await asyncSleep(35000);
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1700 wait end')
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1700 leakListFileName check: ' + leakFilePath[0]);
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1700 heapDumpFileName check: ' + leakFilePath[1]);
        expect(leakFilePath[0]).assertContain(".jsleaklist");
        expect(leakFilePath[1]).assertContain(".rawheap");
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1700 enable success');
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcher_Interface_1700 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_1700 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_1700 end");
    })

    /**
     * @tc.name   testJsLeakWatcher18
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_1800
     * @tc.desc   验证enableLeakWatcher接口config参数传入NodeContainer类型正常返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsLeakWatcher18', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_1800 start");
      try {
        let leakFilePath:Array<string> = [];
        let config : Array<string> = ['NodeContainer'];
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1800 leakListFileName: ' + filepath[0]);
          console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1800 heapDumpFileName: ' + filepath[1]);
          leakFilePath = filepath
        });
        jsLeakWatcher.watch(obj,'test_watch');
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1800 test_' + obj.toString());
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1800 wait start')
        await asyncSleep(35000);
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1800 wait end')
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1800 leakListFileName check: ' + leakFilePath[0]);
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1800 heapDumpFileName check: ' + leakFilePath[1]);
        expect(leakFilePath[0]).assertContain(".jsleaklist");
        expect(leakFilePath[1]).assertContain(".rawheap");
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1800 enable success');
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcher_Interface_1800 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_1800 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_1800 end");
    })

    /**
     * @tc.name   testJsLeakWatcher19
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_1900
     * @tc.desc   验证enableLeakWatcher接口config参数传入XComponent类型正常返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsLeakWatcher19', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_1900 start");
      try {
        let leakFilePath:Array<string> = [];
        let config : Array<string> = ['XComponent'];
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1900 leakListFileName: ' + filepath[0]);
          console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1900 heapDumpFileName: ' + filepath[1]);
          leakFilePath = filepath
        });
        jsLeakWatcher.watch(obj,'test_watch');
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1900 test_' + obj.toString());
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1900 wait start')
        await asyncSleep(35000);
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1900 wait end')
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1900 leakListFileName check: ' + leakFilePath[0]);
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1900 heapDumpFileName check: ' + leakFilePath[1]);
        expect(leakFilePath[0]).assertContain(".jsleaklist");
        expect(leakFilePath[1]).assertContain(".rawheap");
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1900 enable success');
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcher_Interface_1900 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_1900 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_1900 end");
    })

    /**
     * @tc.name   testJsLeakWatcher20
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_2000
     * @tc.desc   验证enableLeakWatcher接口config参数传入Ability类型正常返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsLeakWatcher20', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_2000 start");
      try {
        let leakFilePath:Array<string> = [];
        let config : Array<string> = ['Ability'];
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_2000 leakListFileName: ' + filepath[0]);
          console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_2000 heapDumpFileName: ' + filepath[1]);
          leakFilePath = filepath
        });
        jsLeakWatcher.watch(obj,'test_watch');
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_2000 test_' + obj.toString());
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_2000 wait start')
        await asyncSleep(35000);
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_2000 wait end')
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_2000 leakListFileName check: ' + leakFilePath[0]);
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_2000 heapDumpFileName check: ' + leakFilePath[1]);
        expect(leakFilePath[0]).assertContain(".jsleaklist");
        expect(leakFilePath[1]).assertContain(".rawheap");
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_2000 enable success');
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcher_Interface_2000 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_2000 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_2000 end");
    })

    /**
     * @tc.name   testJsLeakWatcher21
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_2100
     * @tc.desc   验证enableLeakWatcher接口config参数传入CustomComponent、Window、NodeContainer、XComponent、Ability类型正常返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsLeakWatcher21', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_2100 start");
      try {
        let leakFilePath:Array<string> = [];
        let config : Array<string> = ['CustomComponent', 'Window', 'NodeContainer', 'XComponent', 'Ability'];
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_2100 leakListFileName: ' + filepath[0]);
          console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_2100 heapDumpFileName: ' + filepath[1]);
          leakFilePath = filepath
        });
        jsLeakWatcher.watch(obj,'test_watch');
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_2100 test_' + obj.toString());
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_2100 wait start')
        await asyncSleep(35000);
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_2100 wait end')
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_2100 leakListFileName check: ' + leakFilePath[0]);
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_2100 heapDumpFileName check: ' + leakFilePath[1]);
        expect(leakFilePath[0]).assertContain(".jsleaklist");
        expect(leakFilePath[1]).assertContain(".rawheap");
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_2100 enable success');
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcher_Interface_2100 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_2100 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_2100 end");
    })

    /**
     * @tc.name   testJsLeakWatcher22
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_2200
     * @tc.desc   验证enableLeakWatcher接口config参数传入非支持类型大写字母返回错误码10801002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsLeakWatcher22', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_2200 start");
      try {
        let config : Array<string> = ['ABC'];
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_2200 config error type')
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcher_Interface_2200 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_2200 fail!");
        expect(err.code == 10801002).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_2200 end");
    })

    /**
     * @tc.name   testJsLeakWatcher23
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_2300
     * @tc.desc   验证enableLeakWatcher接口config参数传入非支持类型小写字母返回错误码10801002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsLeakWatcher23', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_2300 start");
      try {
        let config : Array<string> = ['xyz'];
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_2300 config error type')
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcher_Interface_2300 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_2300 fail!");
        expect(err.code == 10801002).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_2300 end");
    })

    /**
     * @tc.name   testJsLeakWatcher24
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_2400
     * @tc.desc   验证enableLeakWatcher接口config参数传入非支持类型数字返回错误码10801002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsLeakWatcher24', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_2400 start");
      try {
        let config : Array<string> = ['123'];
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_2400 config error type')
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcher_Interface_2400 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_2400 fail!");
        expect(err.code == 10801002).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_2400 end");
    })

    /**
     * @tc.name   testJsLeakWatcher25
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_2500
     * @tc.desc   验证enableLeakWatcher接口config参数传入非支持类型特殊字符返回错误码10801002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsLeakWatcher25', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_2500 start");
      try {
        let config : Array<string> = ['$&%'];
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_2500 config error type')
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcher_Interface_2500 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_2500 fail!");
        expect(err.code == 10801002).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_2500 end");
    })

    /**
     * @tc.name   testJsLeakWatcher26
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_2600
     * @tc.desc   验证enableLeakWatcher接口config参数传入非支持类型大小写字母混合返回错误码10801002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsLeakWatcher26', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_2600 start");
      try {
        let config : Array<string> = ['ABCxyz'];
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_2600 config error type')
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcher_Interface_2600 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_2600 fail!");
        expect(err.code == 10801002).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_2600 end");
    })

    /**
     * @tc.name   testJsLeakWatcher27
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_2700
     * @tc.desc   验证enableLeakWatcher接口config参数传入非支持类型大写字母数字混合返回错误码10801002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsLeakWatcher27', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_2700 start");
      try {
        let config : Array<string> = ['ABC123'];
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_2700 config error type')
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcher_Interface_2700 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_2700 fail!");
        expect(err.code == 10801002).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_2700 end");
    })

    /**
     * @tc.name   testJsLeakWatcher28
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_2800
     * @tc.desc   验证enableLeakWatcher接口config参数传入非支持类型大写字母特殊字符混合返回错误码10801002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsLeakWatcher28', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_2800 start");
      try {
        let config : Array<string> = ['ABC$&%'];
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_2800 config error type')
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcher_Interface_2800 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_2800 fail!");
        expect(err.code == 10801002).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_2800 end");
    })

    /**
     * @tc.name   testJsLeakWatcher29
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_2900
     * @tc.desc   验证enableLeakWatcher接口config参数传入非支持类型小写字母数字混合返回错误码10801002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsLeakWatcher29', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_2900 start");
      try {
        let config : Array<string> = ['xyz123'];
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_2900 config error type')
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcher_Interface_2900 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_2900 fail!");
        expect(err.code == 10801002).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_2900 end");
    })

    /**
     * @tc.name   testJsLeakWatcher30
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_3000
     * @tc.desc   验证enableLeakWatcher接口config参数传入非支持类型小写字母特殊字符混合返回错误码10801002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsLeakWatcher30', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_3000 start");
      try {
        let config : Array<string> = ['xyz$&%'];
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_3000 config error type')
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcher_Interface_3000 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_3000 fail!");
        expect(err.code == 10801002).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_3000 end");
    })

    /**
     * @tc.name   testJsLeakWatcher31
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_3100
     * @tc.desc   验证enableLeakWatcher接口config参数传入非支持类型数字特殊字符混合返回错误码10801002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsLeakWatcher31', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_3100 start");
      try {
        let config : Array<string> = ['123$&%'];
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_3100 config error type')
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcher_Interface_3100 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_3100 fail!");
        expect(err.code == 10801002).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_3100 end");
    })

    /**
     * @tc.name   testJsLeakWatcher32
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_3200
     * @tc.desc   验证enableLeakWatcher接口config参数传入非支持类型大写字母小写字母数字混合返回错误码10801002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsLeakWatcher32', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_3200 start");
      try {
        let config : Array<string> = ['ABCxyz123'];
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_3200 config error type')
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcher_Interface_3200 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_3200 fail!");
        expect(err.code == 10801002).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_3200 end");
    })

    /**
     * @tc.name   testJsLeakWatcher33
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_3300
     * @tc.desc   验证enableLeakWatcher接口config参数传入非支持类型大写字母小写字母特殊字符混合返回错误码10801002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsLeakWatcher33', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_3300 start");
      try {
        let config : Array<string> = ['ABCxyz$&%'];
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_3300 config error type')
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcher_Interface_3300 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_3300 fail!");
        expect(err.code == 10801002).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_3300 end");
    })

    /**
     * @tc.name   testJsLeakWatcher34
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_3400
     * @tc.desc   验证enableLeakWatcher接口config参数传入非支持类型大写字母数字特殊字符混合返回错误码10801002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsLeakWatcher34', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_3400 start");
      try {
        let config : Array<string> = ['ABC123$&%'];
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_3400 config error type')
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcher_Interface_3400 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_3400 fail!");
        expect(err.code == 10801002).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_3400 end");
    })

    /**
     * @tc.name   testJsLeakWatcher35
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_3500
     * @tc.desc   验证enableLeakWatcher接口config参数传入非支持类型小写字母数字特殊字符混合返回错误码10801002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsLeakWatcher35', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_3500 start");
      try {
        let config : Array<string> = ['xyz123$&%'];
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_3500 config error type')
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcher_Interface_3500 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_3500 fail!");
        expect(err.code == 10801002).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_3500 end");
    })
  })
}
