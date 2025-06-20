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

import { describe, expect, it } from '@ohos/hypium'
import jsLeakWatcher from '@ohos.hiviewdfx.jsLeakWatcher';
import { BusinessError } from '@ohos.base'
import common from '@ohos.app.ability.common';

export default function JsLeakWatcherTest() {
  describe('JsLeakWatcherTest', () => {
    /**
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_0100
     * @tc.name testJsLeakWatcher01
     * @tc.desc 验证enable接口传入true和false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testJsLeakWatcher01', 0, async (done: Function) => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_0100 start");
      try {
        jsLeakWatcher.enable(true);
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0100 enable success')
        jsLeakWatcher.enable(false);
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0100 enable false success')
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_0100 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_0100 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_0200
     * @tc.name testJsLeakWatcher02
     * @tc.desc 验证watch接口正常传参
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testJsLeakWatcher02', 0, async (done: Function) => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_0200 start");
      try {
        jsLeakWatcher.enable(true);
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0200 enable success')
        let obj: Object = new Object();
        jsLeakWatcher.watch(obj, 'test_watch')
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0200 watch success')
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_0200 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_0200 end");
    })
    
    /**
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_0300
     * @tc.name testJsLeakWatcher03
     * @tc.desc 验证check和dump接口正常传参
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testJsLeakWatcher03', 0, async (done: Function) => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_0300 start");
      try {
        jsLeakWatcher.enable(true);
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0300 enable success')
        let obj: Object = new Object();
        jsLeakWatcher.watch(obj, 'test_watch')
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0300 watch success')
        let check = jsLeakWatcher.check();
        console.log('check hash name msg : ' + check)
        expect(check).assertContain("hash");
        expect(check).assertContain("\"name\":\"Object\"");
        expect(check).assertContain("\"msg\":\"test_watch\"");
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0300 check success')
        let context: common.UIAbilityContext = globalThis.context;
        let path = jsLeakWatcher.dump(context.filesDir);
        console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_0300 dump success");
        console.log('jsleaklist: ' + path[0] + ', heapsnapshot: ' + path[1])
        expect(path[0]).assertContain(".jsleaklist");
        expect(path[1]).assertContain(".heapsnapshot");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcher_Interface_0300 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_0300 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_0300 end");
    })
    
    /**
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_0400
     * @tc.name testJsLeakWatcher04
     * @tc.desc 验证watch接口传入undefined值返回错误码401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testJsLeakWatcher04', 0, async (done: Function) => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_0400 start");
      try {
        jsLeakWatcher.watch(undefined, 'test_watch')
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0400 watch undefined')
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcher_Interface_0400 > err code: ${err.code}, err msg: ${err.message}`)
        expect(err.code == 401).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_0400 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_0500
     * @tc.name testJsLeakWatcher05
     * @tc.desc 验证dump接口传入undefined值返回错误码401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testJsLeakWatcher05', 0, async (done: Function) => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_0500 start");
      try {
        jsLeakWatcher.dump(undefined);
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0500 dump undefined')
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcher_Interface_0500 > err code: ${err.code}, err msg: ${err.message}`)
        expect(err.code == 401).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_0500 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_0600
     * @tc.name testJsLeakWatcher06
     * @tc.desc 验证dump接口传入异常路径值返回错误码401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testJsLeakWatcher06', 0, async (done: Function) => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_0600 start");
      try {
        jsLeakWatcher.enable(true);
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0600 enable success')
        let obj: Object = new Object();
        jsLeakWatcher.watch(obj, 'test_watch')
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0600 watch success')
        jsLeakWatcher.check();
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0600 check success')
        let path:string = '/data/local/tmp'
        jsLeakWatcher.dump(path);
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0600 dump unpath')
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcher_Interface_0600 > err code: ${err.code}, err msg: ${err.message}`)
        expect(err.code == 401).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_0600 end");
    })
  })
}
