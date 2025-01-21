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
import dirent from 'libdirentndk.so'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs'


export default function direntNdkTest() {
  describe('MuslDirentTest', () => {

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DIRENT_OPENDIR_0100
     * @tc.name       : testMuslDirentOpendir001
     * @tc.desc       : test opendir
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslDirentOpendir001', 0, async (done: Function) => {
      let dir = "./sdcard/log/hrs.log";
      let data: number = dirent.opendir(dir);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DIRENT_SCANDIR64_0100
     * @tc.name       : testMuslDirentScandir64001
     * @tc.desc       : test scandir64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslDirentScandir64001', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;

      let file = fs.openSync(filesDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, "Try to write str.");
      console.info("The length of str is: " + writeLen);
      console.info("pattr-", filesDir + '/test.txt');
      let buf = new ArrayBuffer(1024);
      let readLen = fs.readSync(file.fd, buf, {
        offset: 0
      });
      fs.closeSync(file);
      let b = 0
      let a: number = dirent.scandir64(filesDir, b);
      expect(a).assertEqual(4);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DIRENT_SCANDIR64_0200
     * @tc.name       : testMuslDirentScandir64002
     * @tc.desc       : test scandir64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslDirentScandir64002', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, "Try to write str.");
      console.info("The length of str is: " + writeLen);
      console.info("pattr-", filesDir + '/test.txt');
      let buf = new ArrayBuffer(1024);
      let readLen = fs.readSync(file.fd, buf, {
        offset: 0
      });
      fs.closeSync(file);

      let b = 1
      let a: number = dirent.scandir64(filesDir, b);
      expect(a).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DIRENT_SCANDIR_0100
     * @tc.name       : testMuslDirentScandir001
     * @tc.desc       : test scandir
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslDirentScandir001', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;

      let file = fs.openSync(filesDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, "Try to write str.");
      console.info("The length of str is: " + writeLen);
      console.info("pattr-", filesDir + '/test.txt');
      let buf = new ArrayBuffer(1024);
      let readLen = fs.readSync(file.fd, buf, {
        offset: 0
      });
      fs.closeSync(file);
      let b = 0
      let a: number = dirent.scandir(filesDir, b);
      expect(a).assertEqual(4);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DIRENT_SCANDIR_0200
     * @tc.name       : testMuslDirentScandir002
     * @tc.desc       : test scandir
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslDirentScandir002', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;

      let file = fs.openSync(filesDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, "Try to write str.");
      console.info("The length of str is: " + writeLen);
      console.info("pattr-", filesDir + '/test.txt');
      let buf = new ArrayBuffer(1024);
      let readLen = fs.readSync(file.fd, buf, {
        offset: 0
      });
      fs.closeSync(file);

      let b = 1
      let a: number = dirent.scandir(filesDir, b);
      expect(a).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DIRENT_SEEKDIR_0100
     * @tc.name       : testMuslDirentSeekdir001
     * @tc.desc       : test seekdir
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslDirentSeekdir001', 0, async (done: Function) => {
      let a: number = dirent.seekdir(0);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DIRENT_SEEKDIR_0200
     * @tc.name       : testMuslDirentSeekdir002
     * @tc.desc       : test seekdir
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslDirentSeekdir002', 0, async (done: Function) => {
      let a: number = dirent.seekdir(1);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DIRENT_GETDENTS_0100
     * @tc.name       : testMuslDirentGetdents001
     * @tc.desc       : test getdents
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslDirentGetdents001', 0, async (done: Function) => {
      let resultValue = 0;
      let result: number = dirent.getdents();
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DIRENT_GETDENTS64_0100
     * @tc.name       : testMuslDirentGetdents64001
     * @tc.desc       : test getdents64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslDirentGetdents64001', 0, async (done: Function) => {
      let resultValue = 0;
      let result: number = dirent.getdents64();
      expect(result).assertEqual(resultValue);
      done()
    });
  })
}