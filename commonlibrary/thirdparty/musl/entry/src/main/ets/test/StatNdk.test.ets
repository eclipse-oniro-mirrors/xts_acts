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
import stat from 'libstatndk.so'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs'

export default function statNdkTest() {
  describe('MuslStatTest', () => {
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_STAT_0100
     * @tc.name       : testMuslStatStat001
     * @tc.desc       : test stat
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStatStat001', 0, async (done: Function) => {
      let a = 1
      let c: number = stat.stat(a);
      expect(c).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_STAT_0200
     * @tc.name       : testMuslStatStat002
     * @tc.desc       : test stat
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */

    it('testMuslStatStat002', 0, async (done: Function) => {
      let a = 2
      let c: number = stat.stat(a);
      expect(c).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_STAT64_0100
     * @tc.name       : testMuslStatStat64001
     * @tc.desc       : test stat
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStatStat64001', 0, async (done: Function) => {
      let a = 1
      let c: number = stat.stat64(a);
      expect(c).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_STAT64_0200
     * @tc.name       : testMuslStatStat64002
     * @tc.desc       : test stat64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStatStat64002', 0, async (done: Function) => {
      let a = 2
      let c: number = stat.stat64(a);
      expect(c).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_UMASK_0100
     * @tc.name       : testMuslStatUmask001
     * @tc.desc       : test umask
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStatUmask001', 0, async (done: Function) => {
      let a = 777;
      let result: number = stat.umask(a);
      console.info("Test result= " + result);
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_UTIMENSAT_0100
     * @tc.name       : testMuslStatUtimensat001
     * @tc.desc       : test utimensat
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStatUtimensat001', 0, async (done: Function) => {

      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;

      let file = fs.openSync(filesDir + '/utimensat.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);

      let result: number = stat.utimensat(filesDir + '/utimensat.txt');
      console.info("Test result= " + result);
      expect(result).assertEqual(1);

      fs.closeSync(file);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_FCHMOD_0100
     * @tc.name       : testMuslStatFChMod001
     * @tc.desc       : test fchmod
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStatFChMod001', 0, async (done: Function) => {
      expect(stat.fchmod()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_FCHMODAT_0100
     * @tc.name       : testMuslStatFChModAt001
     * @tc.desc       : test fchmodat
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStatFChModAt001', 0, async (done: Function) => {
      expect(stat.fchmodat()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_CREAT_0100
     * @tc.name       : testMuslStatCreat001
     * @tc.desc       : test creat
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStatCreat001', 0, async (done: Function) => {
      expect(stat.creat()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_CREAT64_0100
     * @tc.name       : testMuslStatCreat64001
     * @tc.desc       : test creat64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStatCreat64001', 0, async (done: Function) => {
      expect(stat.creat64()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_FSTAT_0100
     * @tc.name       : testMuslStatFstat001
     * @tc.desc       : test fstat
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStatFstat001', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/fstat.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);
      let path = filesDir + '/fstat.txt';
      let result: number = stat.fstat(path);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_CHMOD_0100
     * @tc.name       : testMuslStatChmod001
     * @tc.desc       : test chmod
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStatChmod001', 0, async (done: Function) => {
      let resultTrue = 0;
      let result: number = stat.chmod();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_FSTAT64_0100
     * @tc.name       : testMuslStatFstat64001
     * @tc.desc       : test fstat64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStatFstat64001', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/fstat64.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);
      let path = filesDir + '/fstat64.txt';
      let result: number = stat.fstat64(path);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_FSTATAT_0100
     * @tc.name       : testMuslStatFstatat001
     * @tc.desc       : test fstatat
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStatFstatat001', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/fstatat.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);
      let path = filesDir + '/fstatat.txt';
      let result: number = stat.fstatat(path);
      let resultTrue = 0;
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_FSTATAT64_0100
     * @tc.name       : testMuslStatFstatat64001
     * @tc.desc       : test fstatat64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStatFstatat64001', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/fstatat64.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);
      let path = filesDir + '/fstatat64.txt';
      let result: number = stat.fstatat64(path);
      let resultTrue = 0;
      expect(result).assertEqual(resultTrue);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_FUTIMENS_0100
     * @tc.name       : testMuslStatFutimens001
     * @tc.desc       : test futimens
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStatFutimens001', 0, async (done: Function) => {
      let resultTrue = 0;
      let result: number = stat.futimens();
      expect(result).assertEqual(resultTrue);
      done()
    });
    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STAT_MKFIFOAT_0100
     * @tc.name     : testMuslStatMkFifoAt001
     * @tc.desc     : test mkfifoat
     * @tc.size     : MEDIUMF
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslStatMkFifoAt001', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);
      let path = filesDir + '/test.txt';
      let name = 0;
      let result: number = stat.mkFifoAt(name, path);
      expect(result).assertEqual(0)
      done();
    });
    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STAT_MKFIFOAT_0200
     * @tc.name     : testMuslStatMkFifoAt002
     * @tc.desc     : test mkfifoat
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStatMkFifoAt002', 0, async (done: Function) => {
      let result: number = stat.mkFifoAt(-1, 'fifoAt002');
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STAT_MKFIFOAT_0300
     * @tc.name     : testMuslStatMkFifoAt003
     * @tc.desc     : test mkfifoat
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStatMkFifoAt003', 0, async (done: Function) => {
      let result: number = stat.mkFifoAt(-100, 'fifoAt003');
      expect(result).assertEqual(-1)
      done()
    });
    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STAT_MKNODAT_0100
     * @tc.name     : testMuslStatMkNodAt001
     * @tc.desc     : test mknodat
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslStatMkNodAt001', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);

      let path = filesDir + '/test.txt';
      let dirFp = 0;
      let mode = 32768;
      let result: number = stat.mkNodAt(dirFp, path, mode);
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STAT_MKNODAT_0200
     * @tc.name     : testMuslStatMkNodAt002
     * @tc.desc     : test mknodat
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslStatMkNodAt002', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);

      let path = filesDir + '/test.txt';
      let dirFp = 0;
      let mode = 8192;
      let result: number = stat.mkNodAt(dirFp, path, mode);
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STAT_MKNODAT_0300
     * @tc.name     : testMuslStatMkNodAt003
     * @tc.desc     : test mknodat
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslStatMkNodAt003', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);

      let path = filesDir + '/test.txt';
      let dirFp = 0;
      let mode = 24576;
      let result: number = stat.mkNodAt(dirFp, path, mode);
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STAT_MKNODAT_0400
     * @tc.name     : testMuslStatMkNodAt004
     * @tc.desc     : test mknodat
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslStatMkNodAt004', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);

      let path = filesDir + '/test.txt';
      let dirFp = 0;
      let mode = 4096;
      let result: number = stat.mkNodAt(dirFp, path, mode);
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STAT_MKNODAT_0500
     * @tc.name     : testMuslStatMkNodAt005
     * @tc.desc     : test mknodat
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslStatMkNodAt005', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);

      let path = filesDir + '/test.txt';
      let dirFp = 0;
      let mode = 49152;
      let result: number = stat.mkNodAt(dirFp, path, mode);
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STAT_MKNODAT_0600
     * @tc.name     : testMuslStatMkNodAt006
     * @tc.desc     : test mknodat
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslStatMkNodAt006', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);

      let path = filesDir;
      let dirFp = -1;
      let mode = 32768;
      let result: number = stat.mkNodAt(dirFp, path, mode);
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STAT_MKNODAT_0700
     * @tc.name     : testMuslStatMkNodAt007
     * @tc.desc     : test mknodat
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStatMkNodAt007', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);

      let path = filesDir + '/test.txt';
      let dirFp = -1;
      let mode = 8192;
      let result: number = stat.mkNodAt(dirFp, path, mode);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STAT_MKNODAT_0800
     * @tc.name     : testMuslStatMkNodAt008
     * @tc.desc     : test mknodat
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStatMkNodAt008', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);

      let path = filesDir + '/test.txt';
      let dirFp = -1;
      let mode = 24576;
      let result: number = stat.mkNodAt(dirFp, path, mode);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STAT_MKNODAT_0900
     * @tc.name     : testMuslStatMkNodAt009
     * @tc.desc     : test mknodat
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStatMkNodAt009', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);

      let path = filesDir + '/test.txt';
      let dirFp = -1;
      let mode = 4096;
      let result: number = stat.mkNodAt(dirFp, path, mode);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STAT_MKNODAT_1000
     * @tc.name     : testMuslStatMkNodAt010
     * @tc.desc     : test mknodat
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStatMkNodAt010', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);

      let path = filesDir + '/test.txt';
      let dirFp = -1;
      let mode = 49152;
      let result: number = stat.mkNodAt(dirFp, path, mode);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STAT_MKNODAT_1100
     * @tc.name     : testMuslStatMkNodAt011
     * @tc.desc     : test mknodat
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslStatMkNodAt011', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);

      let path = filesDir + '/test.txt';
      let dirFp = -100;
      let mode = 32768;
      let result: number = stat.mkNodAt(dirFp, path, mode);
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STAT_MKNODAT_1200
     * @tc.name     : testMuslStatMkNodAt012
     * @tc.desc     : test mknodat
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStatMkNodAt012', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);

      let path = filesDir + '/test.txt';
      let dirFp = -100;
      let mode = 8192;
      let result: number = stat.mkNodAt(dirFp, path, mode);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STAT_MKNODAT_1300
     * @tc.name     : testMuslStatMkNodAt013
     * @tc.desc     : test mknodat
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStatMkNodAt013', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);

      let path = filesDir + '/test.txt';
      let dirFp = -100;
      let mode = 24576;
      let result: number = stat.mkNodAt(dirFp, path, mode);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STAT_MKNODAT_1400
     * @tc.name     : testMuslStatMkNodAt014
     * @tc.desc     : test mknodat
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStatMkNodAt014', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);

      let path = filesDir + '/test.txt';
      let dirFp = -100;
      let mode = 4096;
      let result: number = stat.mkNodAt(dirFp, path, mode);
      expect(result).assertEqual(-1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STAT_MKNODAT_1500
     * @tc.name     : testMuslStatMkNodAt015
     * @tc.desc     : test mknodat
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('testMuslStatMkNodAt015', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);

      let path = filesDir + '/test.txt';
      let dirFp = -100;
      let mode = 49152;
      let result: number = stat.mkNodAt(dirFp, path, mode);
      expect(result).assertEqual(-1)
      done()
    });




    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STAT_MKNOD_0100
     * @tc.name     : testMuslStatMkNod001
     * @tc.desc     : test mknod
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslStatMkNod001', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);
      let path = filesDir + '/test.txt';
      let mode = 32768;
      let result: number = stat.mkNod(path, mode);
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STAT_MKNOD_0200
     * @tc.name     : testMuslStatMkNod002
     * @tc.desc     : test mknod
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslStatMkNod002', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);

      let path = filesDir + '/test.txt';
      let mode = 8192;
      let result: number = stat.mkNod(path, mode);
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STAT_MKNOD_0300
     * @tc.name     : testMuslStatMkNod003
     * @tc.desc     : test mknod
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslStatMkNod003', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);

      let path = filesDir + '/test.txt';
      let mode = 24576;
      let result: number = stat.mkNod(path, mode);
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STAT_MKNOD_0400
     * @tc.name     : testMuslStatMkNod004
     * @tc.desc     : test mknod
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslStatMkNod004', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);

      let path = filesDir + '/test.txt';
      let mode = 4096;
      let result: number = stat.mkNod(path, mode);
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STAT_MKNOD_0500
     * @tc.name     : testMuslStatMkNod005
     * @tc.desc     : test mknod
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslStatMkNod005', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);

      let path = filesDir + '/test.txt';
      let mode = 49152;
      let result: number = stat.mkNod(path, mode);
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_MKDIR_0100
     * @tc.name       : testMuslStatMkDir001
     * @tc.desc       : test mkdir
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStatMkDir001', 0, async (done: Function) => {
      let data: number = stat.mkDir();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_MKDIRAT_0100
     * @tc.name       : testMuslStatMkDirat001
     * @tc.desc       : test mkdirat
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStatMkDirat001', 0, async (done: Function) => {
      let data: number = stat.mkDirAt();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_MKFIFO_0100
     * @tc.name       : testMuslStatMkFiFo001
     * @tc.desc       : test mkfifo
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStatMkFiFo001', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);
      let path = filesDir + '/test.txt';
      let data: number = stat.mkFiFo(path);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_LSTAT_0100
     * @tc.name       : testMuslStatLstat001
     * @tc.desc       : test lstat
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStatLstat001', 0, async (done: Function) => {
      let data: number = stat.lstat();
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_LSTAT64_0100
     * @tc.name       : testMuslStatLstat64001
     * @tc.desc       : test lstat64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStatLstat64001', 0, async (done: Function) => {
      let data: number = stat.lstat64();
      expect(data).assertEqual(0);
      done()
    });

  })
}