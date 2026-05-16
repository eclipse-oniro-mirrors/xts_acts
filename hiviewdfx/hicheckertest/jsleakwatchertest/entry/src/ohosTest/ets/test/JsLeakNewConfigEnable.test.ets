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
enum MonitorObjectType {
  ALL = -1,
  // CustomComponent = 'CustomComponent',
  CUSTOM_COMPONENT = 1 << 0,
  // Window = 'Window',
  WINDOW = 1 << 1,
  // NodeContainer = 'NodeContainer',
  NODE_CONTAINER = 1 << 2,
  // XComponent = 'XComponent',
  X_COMPONENT = 1 << 3,
  // Ability = 'Ability'
  ABILITY = 1 << 4
}

let maxValue = 2147483647;

export default function JsLeakNewConfigEnable() {
  describe('JsLeakNewConfigEnable', () => {
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      try {
        let config : Array<string> = [];
        jsLeakWatcher.enableLeakWatcher(false, config, (filepath : Array<string>) => {
          console.log('testNewJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testNewJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
      } catch (err) {
        console.error(`testNewJsLeakWatcher > err code: ${err.code}, err msg: ${err.message}`)
        console.info("testNewJsLeakWatcher fail!");
      }
    })
    /**
     * @tc.name   testNewJsLeakWatcher07
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_0700
     * @tc.desc   验证enableLeakWatcher接口正常传参
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewJsLeakWatcher07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_0700 start");
      try {
        jsLeakWatcher.enable(false);
        let leakFilePath:Array<string> = [];
        let config :LeakWatcherConfig = {monitorObjectTypes: MonitorObjectType.ALL};
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_0700 leakListFileName: ' + filepath[0]);
          console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_0700 heapDumpFileName: ' + filepath[1]);
          leakFilePath = filepath;
        });
        jsLeakWatcher.watch(obj, 'test_watch');
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_0700 test_' + obj.toString());
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_0700 wait start')
        await asyncSleep(100000);
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_0700 wait end')
        let checkstr:string = jsLeakWatcher.check();
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_0700 checkstr' + checkstr)
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_0700 leakListFileName1 check: ' + leakFilePath[0]);
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_0700 heapDumpFileName1 check: ' + leakFilePath[1]);
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_0700 enable success')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_0700 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_0700 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_0700 end");
    })

    /**
     * @tc.name   testNewJsLeakWatcher08
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_0800
     * @tc.desc   验证enableLeakWatcher接口isEnabled参数传入undefined值返回错误码10801001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_0800 start");
      try {
        let config :LeakWatcherConfig = {monitorObjectTypes: MonitorObjectType.ALL};
        jsLeakWatcher.enableLeakWatcher(undefined, config, (filepath : Array<string>) => {
          console.log('testNewJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testNewJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_0800 isEnabled undefined')
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_0800 > err code: ${err.code}, err msg: ${err.message}`)
        expect(err.code === 10801001).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_0800 end");
    })

    /**
     * @tc.name   testNewJsLeakWatcher09
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_0900
     * @tc.desc   验证enableLeakWatcher接口isEnabled参数传入false值返回正常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_0900 start");
      try {
        let leakFilePath:Array<string> = [];
        let config :LeakWatcherConfig = {monitorObjectTypes: MonitorObjectType.ALL};
        jsLeakWatcher.enableLeakWatcher(false, config, (filepath : Array<string>) => {
          console.log('testNewJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testNewJsLeakWatcher heapDumpFileName: ' + filepath[1]);
          leakFilePath = filepath;
        });
        expect(leakFilePath.length === 0).assertTrue();
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_0900 isEnabled false')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_0900 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_0900 end");
    })

    /**
     * @tc.name   testNewJsLeakWatcher10
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_1000
     * @tc.desc   验证enableLeakWatcher接口config参数传入undefined值返回错误码10801002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_1000 start");
      try {
        jsLeakWatcher.enableLeakWatcher(true, undefined, (filepath : Array<string>) => {
          console.log('testNewJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testNewJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_1000 config undefined')
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_1000 > err code: ${err.code}, err msg: ${err.message}`)
        expect(err.code === 10801002).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_1000 end");
    })

    /**
     * @tc.name   testNewJsLeakWatcher11
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_1100
     * @tc.desc   验证enableLeakWatcher接口callback参数传入undefined值返回错误码10801003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_1100 start");
      try {
        let config :LeakWatcherConfig = {monitorObjectTypes: MonitorObjectType.ALL};
        jsLeakWatcher.enableLeakWatcher(true, config, undefined);
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_1100 callback undefined')
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_1100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(err.code === 10801003).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_1100 end");
    })

    /**
     * @tc.name   testNewJsLeakWatcher12
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_1200
     * @tc.desc   验证enableLeakWatcher接口config参数传入支持类型和非支持类型混合返回错误码10801002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_1200 start");
      try {
        let config :LeakWatcherConfig = {monitorObjectTypes: -1};
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testNewJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testNewJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_1200 config error type')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_1200 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_1200 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_1200 end");
    })

    /**
     * @tc.name   testNewJsLeakWatcher13
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_1300
     * @tc.desc   验证enableLeakWatcher接口config参数传入支持类型和非支持类型数组返回错误码10801002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_1300 start");
      try {
        let config :LeakWatcherConfig = {monitorObjectTypes: MonitorObjectType.WINDOW|-1 };
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testNewJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testNewJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_1300 config error type')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_1300 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_1300 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_1300 end");
    })

    /**
     * @tc.name   testNewJsLeakWatcher14
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_1400
     * @tc.desc   验证enableLeakWatcher接口isEnabled参数传入true值稳定性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_1400 start");
      try {
        let config :LeakWatcherConfig = {monitorObjectTypes: MonitorObjectType.ALL};
        for (let i = 1; i <= 100; i++) {
          jsLeakWatcher.enableLeakWatcher(true, config, (filepath: Array<string>) => {
            console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_1400 leakListFileName: ' + filepath[0]);
            console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_1400 heapDumpFileName: ' + filepath[1]);
          });
          console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_1400 ' + i + ' times success')
        }
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_1400 success')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_1400 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_1400 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_1400 end");
    })

    /**
     * @tc.name   testNewJsLeakWatcher15
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_1500
     * @tc.desc   验证enableLeakWatcher接口isEnabled参数传入false值稳定性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher15', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_1500 start");
      try {
        let config :LeakWatcherConfig = {monitorObjectTypes: MonitorObjectType.ALL};
        for (let i = 1; i <= 100; i++) {
          jsLeakWatcher.enableLeakWatcher(false, config, (filepath: Array<string>) => {
            console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_1500 leakListFileName: ' + filepath[0]);
            console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_1500 heapDumpFileName: ' + filepath[1]);
          });
          console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_1500 ' + i + ' times success')
        }
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_1500 success')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_1500 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_1500 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_1500 end");
    })

    /**
     * @tc.name   testNewJsLeakWatcher16
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_1600
     * @tc.desc   验证enableLeakWatcher接口config参数传入CustomComponent类型正常返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_1600 start");
      try {
        let config :LeakWatcherConfig = {monitorObjectTypes: MonitorObjectType.CUSTOM_COMPONENT};
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testNewJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testNewJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_1600 config error type')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_1600 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_1600 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_1600 end");
    })

    /**
     * @tc.name   testNewJsLeakWatcher17
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_1700
     * @tc.desc   验证enableLeakWatcher接口config参数传入Window类型正常返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher17', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_1700 start");
      try {
        let config :LeakWatcherConfig = {monitorObjectTypes: MonitorObjectType.WINDOW};
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testNewJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testNewJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_1700 config error type')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_1700 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_1700 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_1700 end");
    })

    /**
     * @tc.name   testNewJsLeakWatcher18
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_1800
     * @tc.desc   验证enableLeakWatcher接口config参数传入NodeContainer类型正常返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher18', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_1800 start");
      try {
        let config :LeakWatcherConfig = {monitorObjectTypes: MonitorObjectType.NODE_CONTAINER};
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testNewJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testNewJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_1800 config error type')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_1800 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_1800 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_1800 end");
    })

    /**
     * @tc.name   testNewJsLeakWatcher19
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_1900
     * @tc.desc   验证enableLeakWatcher接口config参数传入XComponent类型正常返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher19', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_1900 start");
      try {
        let config :LeakWatcherConfig = {monitorObjectTypes: MonitorObjectType.X_COMPONENT};
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testNewJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testNewJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_1900 config error type')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_1900 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_1900 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_1900 end");
    })

    /**
     * @tc.name   testNewJsLeakWatcher20
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_2000
     * @tc.desc   验证enableLeakWatcher接口config参数传入Ability类型正常返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher20', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_2000 start");
      try {
        let config :LeakWatcherConfig = {monitorObjectTypes: MonitorObjectType.ABILITY};
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testNewJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testNewJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_2000 config error type')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_2000 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_2000 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_2000 end");
    })

    /**
     * @tc.name   testNewJsLeakWatcher21
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_2100
     * @tc.desc   验证enableLeakWatcher接口config参数传入CustomComponent、Window、NodeContainer、XComponent、Ability类型正常返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher21', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_2100 start");
      try {
        let config :LeakWatcherConfig = {monitorObjectTypes: MonitorObjectType.ABILITY|MonitorObjectType.CUSTOM_COMPONENT|MonitorObjectType.WINDOW|MonitorObjectType.NODE_CONTAINER|MonitorObjectType.X_COMPONENT};
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testNewJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testNewJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_2100 config error type')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_2100 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_2100 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_2100 end");
    })

    /**
     * @tc.name   testNewJsLeakWatcher22
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_2200
     * @tc.desc   验证enableLeakWatcher接口config参数传入非支持类型大写字母返回错误码10801002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher22', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
        objectUniqueIDs: Array<number>;
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_2200 start");
      try {
        let config :LeakWatcherConfig = {monitorObjectTypes: MonitorObjectType.ALL,objectUniqueIDs:[maxValue]};
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testNewJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testNewJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_2200 config error type')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_2200 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_2200 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_2200 end");
    })

    /**
     * @tc.name   testNewJsLeakWatcher23
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_2300
     * @tc.desc   验证enableLeakWatcher接口config参数传入非支持类型小写字母返回错误码10801002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher23', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
        objectUniqueIDs: Array<number>;
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_2300 start");
      try {
        let config :LeakWatcherConfig = {monitorObjectTypes: MonitorObjectType.ALL,objectUniqueIDs:[-1]};
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testNewJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testNewJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_2300 config error type')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_2300 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_2300 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_2300 end");
    })

    /**
     * @tc.name   testNewJsLeakWatcher24
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_2400
     * @tc.desc   验证enableLeakWatcher接口config参数传入非支持类型数字返回错误码10801002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher24', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_2400 start");
      try {
        let config :LeakWatcherConfig = {monitorObjectTypes: 123};
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testNewJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testNewJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_2400 config error type')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_2400 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_2400 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_2400 end");
    })

    /**
     * @tc.name   testNewJsLeakWatcher25
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_2500
     * @tc.desc   验证enableLeakWatcher接口config参数传入非支持类型特殊字符返回错误码10801002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher25', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
        checkInterval: number;
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_2500 start");
      try {
        let config :LeakWatcherConfig = {monitorObjectTypes: MonitorObjectType.ALL,checkInterval: -1};
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testNewJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testNewJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_2500 config error type')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_2500 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_2500 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_2500 end");
    })

    /**
     * @tc.name   testNewJsLeakWatcher26
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_2600
     * @tc.desc   验证enableLeakWatcher接口config参数传入非支持类型大小写字母混合返回错误码10801002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher26', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
        checkInterval: number;
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_2600 start");
      try {
        let config :LeakWatcherConfig = {monitorObjectTypes: MonitorObjectType.ALL,checkInterval: maxValue};
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testNewJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testNewJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_2600 config error type')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_2600 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_2600 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_2600 end");
    })

    /**
     * @tc.name   testNewJsLeakWatcher27
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_2700
     * @tc.desc   验证enableLeakWatcher接口config参数传入非支持类型大写字母数字混合返回错误码10801002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher27', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
        fgLeakCountThreshold: number;
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_2700 start");
      try {
        let config :LeakWatcherConfig = {monitorObjectTypes: MonitorObjectType.ALL,fgLeakCountThreshold: maxValue};
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testNewJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testNewJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_2700 config error type')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_2700 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_2700 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_2700 end");
    })

    /**
     * @tc.name   testNewJsLeakWatcher28
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_2800
     * @tc.desc   验证enableLeakWatcher接口config参数传入非支持类型大写字母特殊字符混合返回错误码10801002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher28', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
        fgLeakCountThreshold: number;
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_2800 start");
      try {
        let config :LeakWatcherConfig = {monitorObjectTypes: MonitorObjectType.ALL,fgLeakCountThreshold: -1};
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testNewJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testNewJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_2800 config error type')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_2800 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_2800 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_2800 end");
    })

    /**
     * @tc.name   testNewJsLeakWatcher29
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_2900
     * @tc.desc   验证enableLeakWatcher接口config参数传入非支持类型小写字母数字混合返回错误码10801002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher29', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
        bgLeakCountThreshold: number;
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_2900 start");
      try {
        let config :LeakWatcherConfig = {monitorObjectTypes: MonitorObjectType.ALL,bgLeakCountThreshold: -1};
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testNewJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testNewJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_2900 config error type')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_2900 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_2900 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_2900 end");
    })

    /**
     * @tc.name   testNewJsLeakWatcher30
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_3000
     * @tc.desc   验证enableLeakWatcher接口config参数传入非支持类型小写字母特殊字符混合返回错误码10801002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher30', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
        bgLeakCountThreshold: number;
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_3000 start");
      try {
        let config :LeakWatcherConfig = {monitorObjectTypes: MonitorObjectType.ALL,bgLeakCountThreshold: maxValue};
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testNewJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testNewJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_3000 config error type')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_3000 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_3000 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_3000 end");
    })

    /**
     * @tc.name   testNewJsLeakWatcher31
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_3100
     * @tc.desc   验证enableLeakWatcher接口config参数传入非支持类型数字特殊字符混合返回错误码10801002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher31', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
        maxStoredHeapDumps: number;
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_3100 start");
      try {
        let config :LeakWatcherConfig = {monitorObjectTypes: MonitorObjectType.ALL,maxStoredHeapDumps: maxValue};
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testNewJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testNewJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_3100 config error type')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_3100 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_3100 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_3100 end");
    })

    /**
     * @tc.name   testNewJsLeakWatcher32
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_3200
     * @tc.desc   验证enableLeakWatcher接口config参数传入非支持类型大写字母小写字母数字混合返回错误码10801002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher32', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
        maxStoredHeapDumps: number;
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_3200 start");
      try {
        let config :LeakWatcherConfig = {monitorObjectTypes: MonitorObjectType.ALL,maxStoredHeapDumps: -1};
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testNewJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testNewJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_3200 config error type')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_3200 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_3200 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_3200 end");
    })

    /**
     * @tc.name   testNewJsLeakWatcher33
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_3300
     * @tc.desc   验证enableLeakWatcher接口config参数传入非支持类型大写字母小写字母特殊字符混合返回错误码10801002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher33', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
        dumpHeapWaitTimeMs: number;
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_3300 start");
      try {
        let config :LeakWatcherConfig = {monitorObjectTypes: MonitorObjectType.ALL,dumpHeapWaitTimeMs: -1};
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testNewJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testNewJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_3300 config error type')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_3300 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_3300 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_3300 end");
    })

    /**
     * @tc.name   testNewJsLeakWatcher34
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_3400
     * @tc.desc   验证enableLeakWatcher接口config参数传入非支持类型大写字母数字特殊字符混合返回错误码10801002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher34', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
        dumpHeapWaitTimeMs: number;
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_3400 start");
      try {
        let config :LeakWatcherConfig = {monitorObjectTypes: MonitorObjectType.ALL,dumpHeapWaitTimeMs: maxValue};
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testNewJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testNewJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_3400 config error type')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_3400 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_3400 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_3400 end");
    })

    /**
     * @tc.name   testNewJsLeakWatcher35
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_3500
     * @tc.desc   验证enableLeakWatcher接口config参数传入非支持类型小写字母数字特殊字符混合返回错误码10801002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher35', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
        exclusionList: Array<string>;
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_3500 start");
      try {
        let config :LeakWatcherConfig = {monitorObjectTypes: MonitorObjectType.ALL,exclusionList: ['中文']};
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('testNewJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testNewJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_3500 config error type')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_3500 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_3500 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_3500 end");
    })

    /**
     * @tc.name   testNewJsLeakWatcher36
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_3600
     * @tc.desc   验证enableLeakWatcher接口config参数传入支持objectUniqueIDs、MonitorObjectType类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher36', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
        objectUniqueIDs: Array<number>;
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_3600 start");
      try {
        jsLeakWatcher.enable(false);
        let leakFilePath:Array<string> = [];
        let config :LeakWatcherConfig = {monitorObjectTypes: MonitorObjectType.ALL,objectUniqueIDs: []};
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_3600 leakListFileName: ' + filepath[0]);
          console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_3600 heapDumpFileName: ' + filepath[1]);
          leakFilePath = filepath;
        });
        expect(leakFilePath.length === 0).assertTrue();
        jsLeakWatcher.watch(obj, 'test_watch');
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_3600 test_' + obj.toString());
        let checkstr:string = jsLeakWatcher.check();
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_3600 checkstr' + checkstr)
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_3600 enable success')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_3600 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_3600 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_3600 end");
    })

    /**
     * @tc.name   testNewJsLeakWatcher37
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_3700
     * @tc.desc   验证enableLeakWatcher接口config参数传入支持objectUniqueIDs、MonitorObjectType、checkInterval类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher37', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
        objectUniqueIDs: Array<number>;
        checkInterval: number;
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_3700 start");
      try {
        jsLeakWatcher.enable(false);
        let leakFilePath:Array<string> = [];
        let config :LeakWatcherConfig = {
          monitorObjectTypes: MonitorObjectType.ALL,
          objectUniqueIDs: [],
          checkInterval: 10000,
        };
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_3700 leakListFileName: ' + filepath[0]);
          console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_3700 heapDumpFileName: ' + filepath[1]);
          leakFilePath = filepath;
        });
        expect(leakFilePath.length === 0).assertTrue();
        jsLeakWatcher.watch(obj, 'test_watch');
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_3700 test_' + obj.toString());
        let checkstr:string = jsLeakWatcher.check();
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_3700 checkstr' + checkstr)
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_3700 enable success')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_3700 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_3700 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_3700 end");
    })
    /**
     * @tc.name   testNewJsLeakWatcher38
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_3800
     * @tc.desc   验证enableLeakWatcher接口config参数传入支持objectUniqueIDs、MonitorObjectType、checkInterval、fgLeakCountThreshold类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher38', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
        objectUniqueIDs: Array<number>;
        checkInterval: number;
        fgLeakCountThreshold: number;
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_3800 start");
      try {
        jsLeakWatcher.enable(false);
        let leakFilePath:Array<string> = [];
        let config :LeakWatcherConfig = {
          monitorObjectTypes: MonitorObjectType.ALL,
          objectUniqueIDs: [],
          checkInterval: 10000,
          fgLeakCountThreshold: 5,
        };
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_3800 leakListFileName: ' + filepath[0]);
          console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_3800 heapDumpFileName: ' + filepath[1]);
          leakFilePath = filepath;
        });
        expect(leakFilePath.length === 0).assertTrue();
        jsLeakWatcher.watch(obj, 'test_watch');
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_3800 test_' + obj.toString());
        let checkstr:string = jsLeakWatcher.check();
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_3800 checkstr' + checkstr)
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_3800 enable success')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_3800 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_3800 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_3800 end");
    })
     /**
     * @tc.name   testNewJsLeakWatcher39
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_3900
     * @tc.desc   验证enableLeakWatcher接口config参数传入支持objectUniqueIDs、MonitorObjectType、checkInterval、fgLeakCountThreshold、bgLeakCountThreshold类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher39', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
        objectUniqueIDs: Array<number>;
        checkInterval: number;
        fgLeakCountThreshold: number;
        bgLeakCountThreshold: number;
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_3900 start");
      try {
        jsLeakWatcher.enable(false);
        let leakFilePath:Array<string> = [];
        let config :LeakWatcherConfig = {
          monitorObjectTypes: MonitorObjectType.ALL,
          objectUniqueIDs: [],
          checkInterval: 10000,
          fgLeakCountThreshold: 5,
          bgLeakCountThreshold: 3
        };
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_3900 leakListFileName: ' + filepath[0]);
          console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_3900 heapDumpFileName: ' + filepath[1]);
          leakFilePath = filepath;
        });
        expect(leakFilePath.length === 0).assertTrue();
        jsLeakWatcher.watch(obj, 'test_watch');
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_3900 test_' + obj.toString());
        let checkstr:string = jsLeakWatcher.check();
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_3900 checkstr' + checkstr)
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_3900 enable success')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_3900 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_3900 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_3900 end");
    })
    /**
     * @tc.name   testNewJsLeakWatcher40
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_4000
     * @tc.desc   验证enableLeakWatcher接口config参数传入支持objectUniqueIDs、MonitorObjectType、checkInterval、fgLeakCountThreshold、bgLeakCountThreshold、maxStoredHeapDumps类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher40', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
        objectUniqueIDs: Array<number>;
        checkInterval: number;
        fgLeakCountThreshold: number;
        bgLeakCountThreshold: number;
        maxStoredHeapDumps: number;
        //dumpHeapWaitTimeMs: number;
        //exclusionList: Array<string>
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_4000 start");
      try {
        jsLeakWatcher.enable(false);
        let leakFilePath:Array<string> = [];
        let config :LeakWatcherConfig = {
          monitorObjectTypes: MonitorObjectType.ALL,
          objectUniqueIDs: [],
          checkInterval: 10000,
          fgLeakCountThreshold: 5,
          bgLeakCountThreshold: 3,
          maxStoredHeapDumps: 5
        };
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_4000 leakListFileName: ' + filepath[0]);
          console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_4000 heapDumpFileName: ' + filepath[1]);
          leakFilePath = filepath;
        });
        expect(leakFilePath.length === 0).assertTrue();
        jsLeakWatcher.watch(obj, 'test_watch');
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_4000 test_' + obj.toString());
        let checkstr:string = jsLeakWatcher.check();
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_4000 checkstr' + checkstr)
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_4000 enable success')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_4000 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_4000 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_4000 end");
    })
    /**
     * @tc.name   testNewJsLeakWatcher41
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_4100
     * @tc.desc   验证enableLeakWatcher接口config参数传入支持objectUniqueIDs、MonitorObjectType、checkInterval、fgLeakCountThreshold、bgLeakCountThreshold、maxStoredHeapDumps类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher41', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
        objectUniqueIDs: Array<number>;
        checkInterval: number;
        fgLeakCountThreshold: number;
        bgLeakCountThreshold: number;
        maxStoredHeapDumps: number;
        dumpHeapWaitTimeMs: number;
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_4100 start");
      try {
        jsLeakWatcher.enable(false);
        let leakFilePath:Array<string> = [];
        let config :LeakWatcherConfig = {
          monitorObjectTypes: MonitorObjectType.ALL,
          objectUniqueIDs: [],
          checkInterval: 10000,
          fgLeakCountThreshold: 5,
          bgLeakCountThreshold: 1,
          maxStoredHeapDumps: 5,
          dumpHeapWaitTimeMs: 5000,
        };
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_4100 leakListFileName: ' + filepath[0]);
          console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_4100 heapDumpFileName: ' + filepath[1]);
          leakFilePath = filepath;
        });
        expect(leakFilePath.length === 0).assertTrue();
        jsLeakWatcher.watch(obj, 'test_watch');
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_4100 test_' + obj.toString());
        let checkstr:string = jsLeakWatcher.check();
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_4100 checkstr' + checkstr)
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_4100 enable success')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_4100 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_4100 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_4100 end");
    })
    /**
     * @tc.name   testNewJsLeakWatcher42
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_4200
     * @tc.desc   验证enableLeakWatcher接口config参数传入支持objectUniqueIDs、MonitorObjectType、checkInterval、fgLeakCountThreshold、bgLeakCountThreshold、maxStoredHeapDumps类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher42', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
        objectUniqueIDs: Array<number>;
        checkInterval: number;
        fgLeakCountThreshold: number;
        bgLeakCountThreshold: number;
        maxStoredHeapDumps: number;
        dumpHeapWaitTimeMs: number;
        exclusionList: Array<string>
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_4200 start");
      try {
        jsLeakWatcher.enable(false);
        let leakFilePath:Array<string> = [];
        let config :LeakWatcherConfig = {
          monitorObjectTypes: MonitorObjectType.ALL,
          objectUniqueIDs: [],
          checkInterval: 10000,
          fgLeakCountThreshold: 5,
          bgLeakCountThreshold: 1,
          maxStoredHeapDumps: 5,
          dumpHeapWaitTimeMs: 5000,
          exclusionList: []
        };
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_4200 leakListFileName: ' + filepath[0]);
          console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_4200 heapDumpFileName: ' + filepath[1]);
          leakFilePath = filepath;
        });
        expect(leakFilePath.length === 0).assertTrue();
        jsLeakWatcher.watch(obj, 'test_watch');
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_4200 test_' + obj.toString());
        let checkstr:string = jsLeakWatcher.check();
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_4200 checkstr' + checkstr)
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_4200 enable success')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_4200 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_4200 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_4200 end");
    })
    /**
     * @tc.name   testNewJsLeakWatcher43
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_4300
     * @tc.desc   验证enableLeakWatcher接口config参数传入支持objectUniqueIDs、MonitorObjectType、checkInterval、fgLeakCountThreshold、bgLeakCountThreshold、maxStoredHeapDumps类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher43', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
        checkInterval: number;
        fgLeakCountThreshold: number;
        bgLeakCountThreshold: number;
        maxStoredHeapDumps: number;
        dumpHeapWaitTimeMs: number;
        exclusionList: Array<string>
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_4300 start");
      try {
        jsLeakWatcher.enable(false);
        let leakFilePath:Array<string> = [];
        let config :LeakWatcherConfig = {
          monitorObjectTypes: MonitorObjectType.ALL,
          checkInterval: 10000,
          fgLeakCountThreshold: 5,
          bgLeakCountThreshold: 3,
          maxStoredHeapDumps: 5,
          dumpHeapWaitTimeMs: 5000,
          exclusionList: []
        };
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_4300 leakListFileName: ' + filepath[0]);
          console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_4300 heapDumpFileName: ' + filepath[1]);
          leakFilePath = filepath;
        });
        expect(leakFilePath.length === 0).assertTrue();
        jsLeakWatcher.watch(obj, 'test_watch');
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_4300 test_' + obj.toString());
        let checkstr:string = jsLeakWatcher.check();
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_4300 checkstr' + checkstr)
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_4300 enable success')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_4300 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_4300 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_4300 end");
    })
    /**
     * @tc.name   testNewJsLeakWatcher44
     * @tc.number SUB_DFX_DFR_jsLeakWatcherNew_Interface_4400
     * @tc.desc   验证enableLeakWatcher接口config参数传入支持objectUniqueIDs、MonitorObjectType、checkInterval、fgLeakCountThreshold、bgLeakCountThreshold、maxStoredHeapDumps类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNewJsLeakWatcher44', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      interface LeakWatcherConfig {
        monitorObjectTypes: MonitorObjectType;
        fgLeakCountThreshold: number;
        bgLeakCountThreshold: number;
        maxStoredHeapDumps: number;
        dumpHeapWaitTimeMs: number;
        exclusionList: Array<string>
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_4400 start");
      try {
        jsLeakWatcher.enable(false);
        let leakFilePath:Array<string> = [];
        let config :LeakWatcherConfig = {
          monitorObjectTypes: MonitorObjectType.ALL,
          fgLeakCountThreshold: 5,
          bgLeakCountThreshold: 3,
          maxStoredHeapDumps: 5,
          dumpHeapWaitTimeMs: 5000,
          exclusionList: []
        };
        jsLeakWatcher.enableLeakWatcher(true, config, (filepath : Array<string>) => {
          console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_4400 leakListFileName: ' + filepath[0]);
          console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_4400 heapDumpFileName: ' + filepath[1]);
          leakFilePath = filepath;
        });
        expect(leakFilePath.length === 0).assertTrue();
        jsLeakWatcher.watch(obj, 'test_watch');
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_4400 test_' + obj.toString());
        let checkstr:string = jsLeakWatcher.check();
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_4400 checkstr' + checkstr)
        console.log('SUB_DFX_DFR_jsLeakWatcherNew_Interface_4400 enable success')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcherNew_Interface_4400 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_4400 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcherNew_Interface_4400 end");
    })

  })
}
