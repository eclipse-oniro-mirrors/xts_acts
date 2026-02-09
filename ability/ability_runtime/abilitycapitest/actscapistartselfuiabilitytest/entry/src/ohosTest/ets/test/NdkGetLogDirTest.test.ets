/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import fs from '@ohos.file.fs'
import testNapi from 'libentry.so';

export default function NdkGetLogDirTest() {
  describe('NdkGetLogDirTest', () => {
    beforeAll(() => {})
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})
    
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetLogPath_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetLogPath_0100
     * @tc.desc   To verify use OH_AbilityRuntime_ApplicationContextGetLogFileDir with buffer is nullptr.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ContextGetLogPath_0100', Level.LEVEL3, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ContextGetLogPath_0100`;
      console.log(`${tag}, it begin`);
      let ret : Number = testNapi.contextGetLogPath_0100();
      hilog.info(0x0000, tag, '%{public}s', ` ${tag} execute result:` + ret);
      expect(ret).assertEqual(401);
      done();
    })

    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetLogPath_0200
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetLogPath_0200
     * @tc.desc   To verify use OH_AbilityRuntime_ApplicationContextGetLogFileDir with buffersizr is 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ContextGetLogPath_0200', Level.LEVEL3, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ContextGetLogPath_0200`;
      console.log(`${tag}, it begin`);
      let ret : Number = testNapi.contextGetLogPath_0200();
      hilog.info(0x0000, tag, '%{public}s', ` ${tag} execute result:` + ret);
      expect(ret).assertEqual(401);
      done();
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetLogPath_0300
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetLogPath_0300
     * @tc.desc   To verify use OH_AbilityRuntime_ApplicationContextGetLogFileDir with buffersizr larger length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ContextGetLogPath_0300', Level.LEVEL3, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ContextGetLogPath_0300`;
      console.log(`${tag}, it begin`);
      let ret : string = testNapi.contextGetLogPath_0300();
      hilog.info(0x0000, tag, '%{public}s', ` ${tag} execute result:` + ret);
      expect(ret).assertEqual('/data/storage/el2/log');
      let filePath = ret + '/test.txt';
      fs.open(filePath, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY).then((file: fs.File)=>{
        hilog.info(0x0000, tag, '%{public}s', ` ${tag} fs open success`);
        try{
          expect(fs.accessSync(filePath)).assertTrue();
          fs.unlink(filePath).then(()=>{
            try{ expect(fs.accessSync(filePath)).assertFalse(); }catch{}
            done();
          }).catch(()=>{
            hilog.info(0x0000, tag, '%{public}s', ` ${tag} fs unlink fail`);
            expect().assertFail();
            done();
          })
        }catch{}
      }).catch(()=>{
        hilog.info(0x0000, tag, '%{public}s', ` ${tag} fs catch open fail`);
        expect().assertFail();
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetLogPath_0400
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetLogPath_0400
     * @tc.desc   To verify use OH_AbilityRuntime_ApplicationContextGetLogFileDir with buffersizr less length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ContextGetLogPath_0400', Level.LEVEL3, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ContextGetLogPath_0400`;
      console.log(`${tag}, it begin`);
      let ret : Number = testNapi.contextGetLogPath_0400();
      hilog.info(0x0000, tag, '%{public}s', ` ${tag} execute result:` + ret);
      expect(ret).assertEqual(401);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetLogPath_0700
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetLogPath_0700
     * @tc.desc   To verify use OH_AbilityRuntime_ApplicationContextGetLogFileDir get log dir.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ContextGetLogPath_0700', Level.LEVEL3, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ContextGetLogPath_0700`;
      console.log(`${tag}, it begin`);
      let ret : string = testNapi.contextGetLogPath_0700();
      hilog.info(0x0000, tag, '%{public}s', ` ${tag} execute result:` + ret);
      expect(ret).assertEqual('/data/storage/el2/log');
      let filePath = ret + '/test1.txt';
      fs.open(filePath, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY).then((file: fs.File)=>{
        hilog.info(0x0000, tag, '%{public}s', ` ${tag} fs open success`);
        try{
          expect(fs.accessSync(filePath)).assertTrue();
          fs.unlink(filePath).then(()=>{
            try{ expect(fs.accessSync(filePath)).assertFalse(); }catch{}
            done();
          }).catch(()=>{
            hilog.info(0x0000, tag, '%{public}s', ` ${tag} fs unlink fail`);
            expect().assertFail();
            done();
          })
        }catch{}
      }).catch(()=>{
        hilog.info(0x0000, tag, '%{public}s', ` ${tag} fs catch open fail`);
        expect().assertFail();
        done();
      })
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetLogPath_1500
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetLogPath_1500
     * @tc.desc   To verify use OH_AbilityRuntime_ApplicationContextGetLogFileDir with buffersize is -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ContextGetLogPath_1500', Level.LEVEL3, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ContextGetLogPath_1500`;
      console.log(`${tag}, it begin`);
      let ret : Number = testNapi.contextGetLogPath_1500();
      hilog.info(0x0000, tag, '%{public}s', ` ${tag} execute result:` + ret);
      expect(ret).assertEqual(401);
      done();
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetLogPath_1600
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetLogPath_1600
     * @tc.desc   To verify use OH_AbilityRuntime_ApplicationContextGetLogFileDir with writeLength null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ContextGetLogPath_1600', Level.LEVEL3, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ContextGetLogPath_1600`;
      console.log(`${tag}, it begin`);
      let ret : Number = testNapi.contextGetLogPath_1500();
      hilog.info(0x0000, tag, '%{public}s', ` ${tag} execute result:` + ret);
      expect(ret).assertEqual(401);
      done();
    })
  })
}