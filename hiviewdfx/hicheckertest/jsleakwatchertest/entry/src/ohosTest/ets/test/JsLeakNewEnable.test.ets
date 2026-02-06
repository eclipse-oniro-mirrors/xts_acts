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

import { describe, expect, it, TestType, Level, Size } from '@ohos/hypium'
import { jsLeakWatcher } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@ohos.base'
import common from '@ohos.app.ability.common';

export function asyncSleep(time: number): Promise<Object> {
  return new Promise(resolve => setTimeout(resolve, time));
};

let obj : Object = new Object();

export default function JsLeakWatcherNewTest() {
  describe('JsLeakWatcherNewTest', () => {
        /**
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_0700
     * @tc.name testJsLeakWatcher07
     * @tc.desc 验证enableLeakWatcher接口正常传参
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
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
          leakFilePath = filepath
        });
        jsLeakWatcher.watch(obj, 'test_watch');
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0700 test_' + obj.toString());
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0700 wait start')
        await asyncSleep(35000);
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0700 wait end')
        let checkstr:string = jsLeakWatcher.check();
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0700 checkstr' + checkstr)
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0700 leakListFileName1 check: ' + leakFilePath[0]);
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0700 heapDumpFileName1 check: ' + leakFilePath[1]);
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
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_0800
     * @tc.name testJsLeakWatcher08
     * @tc.desc 验证enableLeakWatcher接口isEnabled参数传入undefined值返回错误码10801001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
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
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_0900
     * @tc.name testJsLeakWatcher09
     * @tc.desc 验证enableLeakWatcher接口isEnabled参数传入false值返回正常
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testJsLeakWatcher09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_0900 start");
      try {
        let config : Array<string> = [];
        jsLeakWatcher.enableLeakWatcher(false, config, (filepath : Array<string>) => {
          console.log('testJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
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
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_1000
     * @tc.name testJsLeakWatcher10
     * @tc.desc 验证enableLeakWatcher接口config参数传入undefined值返回错误码10801002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
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
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_1100
     * @tc.name testJsLeakWatcher11
     * @tc.desc 验证enableLeakWatcher接口callback参数传入undefined值返回错误码10801003
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
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
  })
}
