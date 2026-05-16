/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from "@ohos/hypium"
import hidebug from '@ohos.hidebug'
import featureAbility from '@ohos.ability.featureAbility';
import fileIo from '@ohos.file.fs';
import fs from '@ohos.file.fs';
export default function HidebugTest() {
  describe('HidebugTest', () => {
    /**
     * @tc.name   HidebugTest_0001
     * @tc.number HidebugTest_0001
     * @tc.desc   startProfiling函数的异常值覆盖,undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0001 start");
      try{
        hidebug.startProfiling(undefined);
        console.info("====> HidebugTest_0001 startProfiling undefined ");
        hidebug.stopProfiling();
        console.info("====> HidebugTest_0001 startProfiling undefined end");
        done();
      }catch(err){
        console.error(`====>HidebugTest_0001 startProfiling catch > error code: ${err.code}, error msg: ${err.message}`)
        expect().assertFail();
        done();
      }
      console.info("HidebugTest_0001 end");
    });
    /**
     * @tc.name   HidebugTest_0016
     * @tc.number HidebugTest_0016
     * @tc.desc   startProfiling函数的异常值覆盖,null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0016 start");
      try{
        hidebug.startProfiling(null);
        console.info("====> HidebugTest_0016 startProfiling null ");
        hidebug.stopProfiling();
        console.info("====> HidebugTest_0016 startProfiling null end");
        done();
      }catch(err){
        console.error(`====>HidebugTest_0016 startProfiling catch > error code: ${err.code}, error msg: ${err.message}`)
        expect().assertFail();
        done();
      }
      console.info("HidebugTest_0016 end");
    });
    /**
     * @tc.name   HidebugTest_0017
     * @tc.number HidebugTest_0017
     * @tc.desc   startProfiling函数的异常值覆盖,空值覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0017 start");
      try{
        hidebug.startProfiling("");
        console.info("====> HidebugTest_0017 startProfiling empty ");
        hidebug.stopProfiling();
        console.info("====> HidebugTest_0017 startProfiling empty end");
        done();
      }catch(err){
        console.error(`====>HidebugTest_0017 startProfiling catch > error code: ${err.code}, error msg: ${err.message}`)
        expect().assertFail();
        done();
      }
      console.info("HidebugTest_0017 end");
    });
    /**
     * @tc.name   HidebugTest_0002
     * @tc.number HidebugTest_0002
     * @tc.desc   dumpHeapData函数的异常值覆盖,undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0002 start");
      try{
        hidebug.dumpHeapData(undefined);
        console.info("====> HidebugTest_0002 dumpHeapData undefined");
        done();
      }catch(err){
        console.error(`====>HidebugTest_0002 dumpHeapData catch > error code: ${err.code}, error msg: ${err.message}`)
        expect().assertFail();
        done();
      }
      console.info("HidebugTest_0002 end");
    });
    /**
     * @tc.name   HidebugTest_0018
     * @tc.number HidebugTest_0018
     * @tc.desc   dumpHeapData函数的异常值覆盖,null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0018 start");
      try{
        hidebug.dumpHeapData(null);
        console.info("====> HidebugTest_0018 dumpHeapData null end");
        done();
      }catch(err){
        console.error(`====>HidebugTest_0018 dumpHeapData catch > error code: ${err.code}, error msg: ${err.message}`)
        expect().assertFail();
        done();
      }
      console.info("HidebugTest_0018 end");
    });
    /**
     * @tc.name   HidebugTest_0019
     * @tc.number HidebugTest_0019
     * @tc.desc   dumpHeapData函数的异常值覆盖,空值覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0019 start");
      try{
        hidebug.dumpHeapData("");
        console.info("====> HidebugTest_0019 dumpHeapData empty end");
        done();
      }catch(err){
        console.error(`====>HidebugTest_0019 dumpHeapData catch > error code: ${err.code}, error msg: ${err.message}`)
        expect().assertFail();
        done();
      }
      console.info("HidebugTest_0019 end");
    });
    /**
     * @tc.name   HidebugTest_0003
     * @tc.number HidebugTest_0003
     * @tc.desc   startJsCpuProfiling函数的异常值覆盖,undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0003 start");
      try{
        hidebug.startJsCpuProfiling(undefined);
        console.info("====> HidebugTest_0003 startJsCpuProfiling undefined ");
        hidebug.stopJsCpuProfiling();
        console.info("====> HidebugTest_0003 startJsCpuProfiling undefined end");
        done();
      }catch(err){
        console.error(`====>HidebugTest_0003 startJsCpuProfiling catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertFalse();
        done();
      }
      console.info("HidebugTest_0003 end");
    });
    /**
     * @tc.name   HidebugTest_0020
     * @tc.number HidebugTest_0020
     * @tc.desc   startJsCpuProfiling函数的异常值覆盖,null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0020 start");
      try{
        hidebug.startJsCpuProfiling(null);
        console.info("====> HidebugTest_0020 startJsCpuProfiling null ");
        hidebug.stopJsCpuProfiling();
        console.info("====> HidebugTest_0020 startJsCpuProfiling null end");
        done();
      }catch(err){
        console.error(`====>HidebugTest_0020 startJsCpuProfiling catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertFalse();
        done();
      }
      console.info("HidebugTest_0020 end");
    });
    /**
     * @tc.name   HidebugTest_0021
     * @tc.number HidebugTest_0021
     * @tc.desc   startJsCpuProfiling函数的异常值覆盖,空值覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0021 start");
      try{
        hidebug.startJsCpuProfiling("");
        console.info("====> HidebugTest_0021 startJsCpuProfiling null ");
        hidebug.stopJsCpuProfiling();
        console.info("====> HidebugTest_0021 startJsCpuProfiling null end");
        done();
      }catch(err){
        console.error(`====>HidebugTest_0021 startJsCpuProfiling catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertFalse();
        done();
      }
      console.info("HidebugTest_0021 end");
    });
    /**
     * @tc.name   HidebugTest_0004
     * @tc.number HidebugTest_0004
     * @tc.desc   dumpJsHeapData函数的异常值覆盖,undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0004 start");
      try{
        hidebug.dumpJsHeapData(undefined);
        console.info("====> HidebugTest_0004 dumpJsHeapData undefined");
        done();
      }catch(err){
        console.error(`====>HidebugTest_0004 dumpJsHeapData catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertFalse();
        done();
      }
      console.info("HidebugTest_0004 end");
    });
    /**
     * @tc.name   HidebugTest_0022
     * @tc.number HidebugTest_0022
     * @tc.desc   dumpJsHeapData函数的异常值覆盖,null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0022 start");
      try{
        hidebug.dumpJsHeapData(null);
        console.info("====> HidebugTest_0022 dumpJsHeapData null end");
        done();
      }catch(err){
        console.error(`====>HidebugTest_0022 dumpJsHeapData catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertFalse();
        done();
      }
      console.info("HidebugTest_0022 end");
    });
    /**
     * @tc.name   HidebugTest_0023
     * @tc.number HidebugTest_0023
     * @tc.desc   dumpJsHeapData函数的异常值覆盖,""//null/undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0023 start");
      try{
        hidebug.dumpJsHeapData("");
        console.info("====> HidebugTest_0023 dumpJsHeapData null end");
        done();
      }catch(err){
        console.error(`====>HidebugTest_0023 dumpJsHeapData catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertFalse();
        done();
      }
      console.info("HidebugTest_0023 end");
    });
    /**
     * @tc.name   HidebugTest_0014
     * @tc.number HidebugTest_0014
     * @tc.desc   getServiceDump函数的异常值覆盖,第1个参数的undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0014 start");
      let path: string = "/data/storage/el2/base/files/serviceInfo1.txt";
      let file = fileIo.openSync(path, 0o102);
      let args: Array<string> = new Array("allInfo");
      try {
        hidebug.getServiceDump(null, file.fd, args);
        console.info("====> HidebugTest_0014 getServiceDump null");
        done();
      } catch (error) {
        console.error(`====>HidebugTest_0014 getServiceDump catch > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 401).assertFalse();
        done();
      }
      console.info("HidebugTest_0014 end");
    });
    /**
     * @tc.name   HidebugTest_0024
     * @tc.number HidebugTest_0024
     * @tc.desc   getServiceDump函数的异常值覆盖,第1个参数的undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0024 start");
      let path: string = "/data/storage/el2/base/files/serviceInfo1.txt";
      let file = fileIo.openSync(path, 0o102);
      let args: Array<string> = new Array("allInfo");
      try {
        hidebug.getServiceDump(undefined, file.fd, args);
        console.info("====> HidebugTest_0024 getServiceDump undefined");
        done();
      } catch (error) {
        console.error(`====>HidebugTest_0024 getServiceDump catch > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 401).assertFalse();
        done();
      }
      console.info("HidebugTest_0024 end");
    });
    /**
     * @tc.name   HidebugTest_0005
     * @tc.number HidebugTest_0005
     * @tc.desc   getServiceDump函数的异常值覆盖,第2个参数的null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0005 start");
      let serviceId: number = 10;
      let args: Array<string> = new Array("allInfo");
      try {
        hidebug.getServiceDump(serviceId, null, args);
        console.info("====> HidebugTest_0005 getServiceDump null");
        done();
      } catch (error) {
        console.error(`====>HidebugTest_0005 getServiceDump catch > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 401).assertFalse();
        done();
      }
      console.info("HidebugTest_0005 end");
    });
    /**
     * @tc.name   HidebugTest_0025
     * @tc.number HidebugTest_0025
     * @tc.desc   getServiceDump函数的异常值覆盖,第2个参数的undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0025 start");
      let serviceId: number = 10;
      let args: Array<string> = new Array("allInfo");
      try {
        hidebug.getServiceDump(serviceId, undefined, args);
        console.info("====> HidebugTest_0025 getServiceDump undefined");
        done();
      } catch (error) {
        console.error(`====>HidebugTest_0025 getServiceDump catch > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 401).assertFalse();
        done();
      }
      console.info("HidebugTest_0025 end");
    });
    /**
     * @tc.name   HidebugTest_0015
     * @tc.number HidebugTest_0015
     * @tc.desc   getServiceDump函数的异常值覆盖,第3个参数的null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0015 start");
      let path: string = "/data/storage/el2/base/files/serviceInfo1.txt";
      let file = fileIo.openSync(path, 0o102);
      let serviceId: number = 10;
      try {
        hidebug.getServiceDump(serviceId, file.fd, null);
        console.info("====> HidebugTest_0015 getServiceDump null");
        done();
      } catch (error) {
        console.error(`====>HidebugTest_0015 getServiceDump catch > error code: ${error.code}, error msg: ${error.message}`)
        if (error.code === 201) {
          console.info(`The application does not have the permission required to call the API`);
          done();
        } else {
          expect(error.code === 401).assertFalse();
          done();
        }
        done();
      }
      console.info("HidebugTest_0015 end");
    });
    /**
     * @tc.name   HidebugTest_0026
     * @tc.number HidebugTest_0026
     * @tc.desc   getServiceDump函数的异常值覆盖,第3个参数的undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0026 start");
      let path: string = "/data/storage/el2/base/files/serviceInfo1.txt";
      let file = fileIo.openSync(path, 0o102);
      let serviceId: number = 10;
      try {
        hidebug.getServiceDump(serviceId, file.fd, undefined);
        console.info("====> HidebugTest_0026 getServiceDump undefined");
        done();
      } catch (error) {
        console.error(`====>HidebugTest_0026 getServiceDump catch > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 401).assertFalse();
        done();
      }
      console.info("HidebugTest_0026 end");
    });
    /**
     * @tc.name   HidebugTest_0027
     * @tc.number HidebugTest_0027
     * @tc.desc   getServiceDump函数的异常值覆盖,第3个参数的空值覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0027 start");
      let path: string = "/data/storage/el2/base/files/serviceInfo1.txt";
      let file = fileIo.openSync(path, 0o102);
      let serviceId: number = 10;
      let args = [];
      try {
        hidebug.getServiceDump(serviceId, file.fd, args);
        console.info("====> HidebugTest_0027 getServiceDump empty");
        done();
      } catch (error) {
        console.error(`====>HidebugTest_0027 getServiceDump catch > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 401).assertFalse();
        done();
      }
      console.info("HidebugTest_0027 end");
    });
    /**
     * @tc.name   HidebugTest_0006
     * @tc.number HidebugTest_0006
     * @tc.desc   startAppTraceCapture函数的异常值覆盖,第一个参数的undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('HidebugTest_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      try {
        let flag = hidebug.TraceFlag.ALL_THREADS;
        let limit_size = 1024 * 1024;
        let path1 = hidebug.startAppTraceCapture(undefined, flag, limit_size);
        console.info("====> HidebugTest_0006 startAppTraceCapture undefined ");
        hidebug.stopAppTraceCapture();
        console.info("====> HidebugTest_0006 startAppTraceCapture undefined end");
        done();
      } catch (error) {
        console.error(`====>HidebugTest_0006 startAppTraceCapture catch > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 401).assertFalse();
        done();
      }
    });
    /**
     * @tc.name   HidebugTest_0028
     * @tc.number HidebugTest_0028
     * @tc.desc   startAppTraceCapture函数的异常值覆盖,第一个参数的null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('HidebugTest_0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      try {
        let flag = hidebug.TraceFlag.ALL_THREADS;
        let limit_size = 1024 * 1024;
        let path2 = hidebug.startAppTraceCapture(null, flag, limit_size);
        console.info("====> HidebugTest_0028 startAppTraceCapture null ");
        hidebug.stopAppTraceCapture();
        console.info("====> HidebugTest_0028 startAppTraceCapture null end");
        done();
      } catch (error) {
        console.error(`====>HidebugTest_0028 startAppTraceCapture catch > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 401).assertFalse();
        done();
      }
    });
    /**
     * @tc.name   HidebugTest_0029
     * @tc.number HidebugTest_0029
     * @tc.desc   startAppTraceCapture函数的异常值覆盖,第一个参数的空值覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('HidebugTest_0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      try {
        let flag = hidebug.TraceFlag.ALL_THREADS;
        let limit_size = 1024 * 1024;
        let tag = [];
        let path3 = hidebug.startAppTraceCapture(tag, flag, limit_size);
        console.info("====> HidebugTest_0029 startAppTraceCapture empty ");
        hidebug.stopAppTraceCapture();
        console.info("====> HidebugTest_0029 startAppTraceCapture empty end");
        done();
      } catch (error) {
        console.error(`====>HidebugTest_0029 startAppTraceCapture catch > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 401).assertFalse();
        done();
      }
    });
    /**
     * @tc.name   HidebugTest_0007
     * @tc.number HidebugTest_0007
     * @tc.desc   startAppTraceCapture函数的异常值覆盖,第3个参数的undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('HidebugTest_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      try {
        let flag = hidebug.TraceFlag.ALL_THREADS;
        let tag = [hidebug.tags.ABILITY_MANAGER];
        let path1 = hidebug.startAppTraceCapture(tag, flag, undefined);
        console.info("====> HidebugTest_0007 startAppTraceCapture undefined ");
        hidebug.stopAppTraceCapture();
        console.info("====> HidebugTest_0007 startAppTraceCapture undefined end");
        done();
      } catch (error) {
        console.error(`====>HidebugTest_0007 startAppTraceCapture catch > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 401).assertFalse();
        done();
      }
    });
    /**
     * @tc.name   HidebugTest_0030
     * @tc.number HidebugTest_0030
     * @tc.desc   startAppTraceCapture函数的异常值覆盖,第3个参数的null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('HidebugTest_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      try {
        let flag = hidebug.TraceFlag.ALL_THREADS;
        let tag = [hidebug.tags.ABILITY_MANAGER];
        let path2 = hidebug.startAppTraceCapture(tag, flag, null);
        console.info("====> HidebugTest_0030 startAppTraceCapture null ");
        hidebug.stopAppTraceCapture();
        console.info("====> HidebugTest_0030 startAppTraceCapture null end");
        done();
      } catch (error) {
        console.error(`====>HidebugTest_0030 startAppTraceCapture catch > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 401).assertFalse();
        done();
      }
    });
    /**
     * @tc.name   HidebugTest_0008
     * @tc.number HidebugTest_0008
     * @tc.desc   getVMRuntimeStat函数的异常值覆盖,undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0008 start");
      try{
        hidebug.getVMRuntimeStat(undefined);
        console.info("====> HidebugTest_0008 getVMRuntimeStat undefined");
        done();
      }catch(error){
        console.error(`====>HidebugTest_0008 getVMRuntimeStat catch > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 401).assertFalse();
        done();
      }
      console.info("HidebugTest_0008 end");
    });
    /**
     * @tc.name   HidebugTest_0031
     * @tc.number HidebugTest_0031
     * @tc.desc   getVMRuntimeStat函数的异常值覆盖,null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0031 start");
      try{
        hidebug.getVMRuntimeStat(null);
        console.info("====> HidebugTest_0031 getVMRuntimeStat null end");
        done();
      }catch(error){
        console.error(`====>HidebugTest_0031 getVMRuntimeStat catch > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 401).assertFalse();
        done();
      }
      console.info("HidebugTest_0031 end");
    });
    /**
     * @tc.name   HidebugTest_0032
     * @tc.number HidebugTest_0032
     * @tc.desc   getVMRuntimeStat函数的异常值覆盖,空值覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0032 start");
      try{
        hidebug.getVMRuntimeStat("");
        console.info("====> HidebugTest_0032 getVMRuntimeStat empty end");
        done();
      }catch(error){
        console.error(`====>HidebugTest_0032 getVMRuntimeStat catch > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 401).assertFalse();
        done();
      }
      console.info("HidebugTest_0032 end");
    });
    /**
     * @tc.name   HidebugTest_0009
     * @tc.number HidebugTest_0009
     * @tc.desc   setAppResourceLimit函数的异常值覆盖,第1个参数的undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0009 start");
      try{
        let value = 85;
        let enabledDebugLog = true;
        hidebug.setAppResourceLimit(undefined, value, enabledDebugLog);
        console.info("====> HidebugTest_0009 setAppResourceLimit undefined");
        done();
      }catch(err){
        console.error(`====>HidebugTest_0009 setAppResourceLimit catch > error code: ${err.code}, error msg: ${err.message}`)
        expect().assertFail();
        done();
      }
      console.info("HidebugTest_0009 end");
    });
    /**
     * @tc.name   HidebugTest_0033
     * @tc.number HidebugTest_0033
     * @tc.desc   setAppResourceLimit函数的异常值覆盖,第1个参数的null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0033 start");
      try{
        let value = 85;
        let enabledDebugLog = true;
        hidebug.setAppResourceLimit(null, value, enabledDebugLog);
        console.info("====> HidebugTest_0033 setAppResourceLimit null end");
        done();
      }catch(err){
        console.error(`====>HidebugTest_0033 setAppResourceLimit catch > error code: ${err.code}, error msg: ${err.message}`)
        expect().assertFail();
        done();
      }
      console.info("HidebugTest_0033 end");
    });
    /**
     * @tc.name   HidebugTest_0034
     * @tc.number HidebugTest_0034
     * @tc.desc   setAppResourceLimit函数的异常值覆盖,第1个参数的空值覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0034 start");
      try{
        let value = 85;
        let enabledDebugLog = true;
        hidebug.setAppResourceLimit("", value, enabledDebugLog);
        console.info("====> HidebugTest_0034 setAppResourceLimit empty end");
        done();
      }catch(err){
        console.error(`====>HidebugTest_0034 setAppResourceLimit catch > error code: ${err.code}, error msg: ${err.message}`)
        expect().assertFail();
        done();
      }
      console.info("HidebugTest_0034 end");
    });
    /**
     * @tc.name   HidebugTest_0010
     * @tc.number HidebugTest_0010
     * @tc.desc   setAppResourceLimit函数的异常值覆盖,第2个参数的undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0010 start");
      try{
        let type = 'js_heap';
        let enabledDebugLog = true;
        hidebug.setAppResourceLimit(type, undefined, enabledDebugLog);
        console.info("====> HidebugTest_0010 dumpJsHeapData undefined");
        done();
      }catch(err){
        console.error(`====>HidebugTest_0010 dumpJsHeapData catch > error code: ${err.code}, error msg: ${err.message}`)
        expect().assertFail();
        done();
      }
      console.info("HidebugTest_0010 end");
    });
    /**
     * @tc.name   HidebugTest_0035
     * @tc.number HidebugTest_0035
     * @tc.desc   setAppResourceLimit函数的异常值覆盖,第2个参数的null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0035 start");
      try{
        let type = 'js_heap';
        let enabledDebugLog = true;
        hidebug.setAppResourceLimit(type, null, enabledDebugLog);
        console.info("====> HidebugTest_0035 dumpJsHeapData null end");
        done();
      }catch(err){
        console.error(`====>HidebugTest_0035 dumpJsHeapData catch > error code: ${err.code}, error msg: ${err.message}`)
        expect().assertFail();
        done();
      }
      console.info("HidebugTest_0035 end");
    });
    /**
     * @tc.name   HidebugTest_0011
     * @tc.number HidebugTest_0011
     * @tc.desc   dumpJsRawHeapData函数的值覆盖,第1个参数的true覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0011 start");
      try{
        hidebug.dumpJsRawHeapData(true);
        console.info("====> HidebugTest_0011 dumpJsHeapData true");
        done();
      }catch(err){
        console.error(`====>HidebugTest_0011 dumpJsHeapData catch > error code: ${err.code}, error msg: ${err.message}`)
        expect().assertFail();
        done();
      }
      console.info("HidebugTest_0011 end");
    });
    /**
     * @tc.name   HidebugTest_0036
     * @tc.number HidebugTest_0036
     * @tc.desc   dumpJsRawHeapData函数的值覆盖,第1个参数的false覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0036 start");
      try{
        hidebug.dumpJsRawHeapData(false);
        console.info("====> HidebugTest_0036 dumpJsHeapData false");
        done();
      }catch(err){
        console.error(`====>HidebugTest_0036 dumpJsHeapData catch > error code: ${err.code}, error msg: ${err.message}`)
        expect().assertFail();
        done();
      }
      console.info("HidebugTest_0036 end");
    });
    /**
     * @tc.name   HidebugTest_0012
     * @tc.number HidebugTest_0012
     * @tc.desc   enableGwpAsanGrayscale函数的值覆盖,第1个参数的null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0012 start");
      try{
        hidebug.enableGwpAsanGrayscale(null, 10);
        console.info("====> HidebugTest_0012 enableGwpAsanGrayscale null");
        done();
      }catch(error){
        console.error(`====>HidebugTest_0012 enableGwpAsanGrayscale catch > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 401).assertFalse();
        done();
      }
      console.info("HidebugTest_0012 end");
    });
    /**
     * @tc.name   HidebugTest_0037
     * @tc.number HidebugTest_0037
     * @tc.desc   enableGwpAsanGrayscale函数的值覆盖,第1个参数的undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0037 start");
      try{
        hidebug.enableGwpAsanGrayscale(undefined, 10);
        console.info("====> HidebugTest_0037 enableGwpAsanGrayscale undefined");
        done();
      }catch(error){
        console.error(`====>HidebugTest_0037 enableGwpAsanGrayscale catch > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 401).assertFalse();
        done();
      }
      console.info("HidebugTest_0037 end");
    });
    /**
     * @tc.name   HidebugTest_0013
     * @tc.number HidebugTest_0013
     * @tc.desc   enableGwpAsanGrayscale函数的值覆盖,第2个参数的null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0013 start");
      try{
        let options1: hidebug.GwpAsanOptions = {
          alwaysEnabled: true,
          sampleRate: 5000,
          maxSimutaneousAllocations: 5000,
        };
        hidebug.enableGwpAsanGrayscale(options1, null);
        console.info("====> HidebugTest_0013 enableGwpAsanGrayscale null");
        done();
      }catch(error){
        console.error(`====>HidebugTest_0013 enableGwpAsanGrayscale catch > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 401).assertFalse();
        done();
      }
      console.info("HidebugTest_0013 end");
    });
    /**
     * @tc.name   HidebugTest_0038
     * @tc.number HidebugTest_0038
     * @tc.desc   enableGwpAsanGrayscale函数的值覆盖,第2个参数的undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0038 start");
      try{
        let options1: hidebug.GwpAsanOptions = {
          alwaysEnabled: true,
          sampleRate: 5000,
          maxSimutaneousAllocations: 5000,
        };
        hidebug.enableGwpAsanGrayscale(options1, undefined);
        console.info("====> HidebugTest_0038 enableGwpAsanGrayscale undefined");
        done();
      }catch(error){
        console.error(`====>HidebugTest_0038 enableGwpAsanGrayscale catch > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 401).assertFalse();
        done();
      }
      console.info("HidebugTest_0038 end");
    });
  })
}
