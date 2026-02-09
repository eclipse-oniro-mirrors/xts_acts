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
import { beforeEach, describe, expect, it , TestType, Size, Level } from "@ohos/hypium"
import Utils from './Utils'
import unistd from 'libunistdndk.so'
import fs from '@ohos.file.fs';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

export default function unistdNdkTest() {

  describe('MuslUnistdTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.name   testMuslUnistdSetpgid001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_SETPGID_0100
     * @tc.desc   test setpgid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdSetpgid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 0
      let c = 0
      let a: number = unistd.setpgid(b, c);
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslUnistdSetpgid003
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_SETPGID_0300
     * @tc.desc   test setpgid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdSetpgid003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 0
      let c = -1
      let a: number = unistd.setpgid(b, c);
      expect(a).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testMuslUnistdSetpgid004
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_SETPGID_0400
     * @tc.desc   test setpgid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdSetpgid004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 1
      let c = 0
      let a: number = unistd.setpgid(b, c);
      expect(a).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testMuslUnistdSetpgrp001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_SETPGRP_0100
     * @tc.desc   test setpgrp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdSetpgrp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = -1
      let a: number = unistd.setpgrp(b);
      expect(a).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslUnistdSetpgrp002
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_SETPGRP_0200
     * @tc.desc   test setpgrp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdSetpgrp002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 0;
      let a: number = unistd.setpgrp(b);
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslUnistdRead001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_READ_0100
     * @tc.desc   test read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdRead001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/testRead.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, "Try to write str.");
      console.info("The length of str is: " + writeLen);
      fs.closeSync(file);
      let result: number = unistd.read(filesDir + '/teRead.txt');
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslUnistdRmdir001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_RMDIR_0100
     * @tc.desc   test rmdir
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdRmdir001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = -1;
      let result: number = unistd.rmdir(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testMuslUnistdRmdir002
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_RMDIR_0200
     * @tc.desc   test rmdir
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdRmdir002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 0;
      let result: number = unistd.rmdir(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslUnistdGetGroups001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_GETGROUPS_0100
     * @tc.desc   test getgroups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdGetGroups001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = unistd.getGroups(0);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testMuslUnistdGetGroups002
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_GETGROUPS_0200
     * @tc.desc   test getgroups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdGetGroups002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = unistd.getGroups(10);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testMuslUnistdGetGroups003
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_GETGROUPS_0300
     * @tc.desc   test getgroups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdGetGroups003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = unistd.getGroups(5);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testMuslUnistdGetPid001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_GETPID_0100
     * @tc.desc   test getpid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdGetPid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = unistd.getPid();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertLarger(-1);
      done();
    });
    /**
     * @tc.name   testMuslUnistdGetPPid001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_GETPPID_0100
     * @tc.desc   test getppid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdGetPPid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = unistd.getPPid();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertLarger(-1);
      done();
    });
    /**
     * @tc.name   testMuslUnistdGetPGrp001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_GETPGRP_0100
     * @tc.desc   test getpgrp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdGetPGrp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = unistd.getPGrp();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });
    /**
     * @tc.name   testMuslUnistdCrypt001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_CRYPT_0100
     * @tc.desc   test crypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdCrypt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let salt: String = "$1$";
      let c: String = unistd.crypt(salt);
      let d: String = unistd.crypt(salt);
      expect(c).assertEqual(d);
      done();
    });
    /**
     * @tc.name   testMuslUnistdCrypt002
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_CRYPT_0200
     * @tc.desc   test crypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdCrypt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let salt: String = "$2$";
      let c: String = unistd.crypt(salt);
      let d: String = unistd.crypt(salt);
      expect(c).assertEqual(d);
      done();
    });
    /**
     * @tc.name   testMuslUnistdCrypt003
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_CRYPT_0300
     * @tc.desc   test crypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdCrypt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let salt: String = "$5$";
      let c: String = unistd.crypt(salt);
      let d: String = unistd.crypt(salt);
      expect(c).assertEqual(d);
      done();
    });
    /**
     * @tc.name   testMuslUnistdGetPGid001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_GETPGID_0100
     * @tc.desc   test getpgrd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdGetPGid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = unistd.getPGid();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });
    /**
     * @tc.name   testMuslUnistdGetSid001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_GETSID_0100
     * @tc.desc   test getsid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdGetSid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = unistd.getSid(0);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });
    /**
     * @tc.name   testMuslUnistdGetUid001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_GETUID_0100
     * @tc.desc   test getuid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdGetUid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = unistd.getUid();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });
    /**
     * @tc.name   testMuslUnistdGetOpt001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_GETOPT_0100
     * @tc.desc   test getopt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdGetOpt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let data: number = unistd.getOpt("-a");
        console.info("Test NAPI data= " + JSON.stringify(data));
        expect(data).assertEqual(97);
        done();
      });
    /**
     * @tc.name   testMuslUnistdGetOpt002
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_GETOPT_0200
     * @tc.desc   test getopt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdGetOpt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = unistd.getOpt("-b");
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(98);
      done();
    });
    /**
     * @tc.name   testMuslUnistdGetOpt003
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_GETOPT_0300
     * @tc.desc   test getopt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdGetOpt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = unistd.getOpt("-c");
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(99);
      done();
    });
    /**
     * @tc.name   testMuslUnistdGetTid001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_GETTID_0100
     * @tc.desc   test gettid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdGetTid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = unistd.getTid();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertLarger(-1);
      done();
    });
    /**
     * @tc.name   testMuslUnistdGetEUid001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_GETEUID_0100
     * @tc.desc   test geteuid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdGetEUid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = unistd.getEUid();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertLarger(0);
      done();
    });
    /**
     * @tc.name   testMuslUnistdGetGid001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_GETGID_0100
     * @tc.desc   test geteuid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdGetGid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = unistd.getGid();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertLarger(-1);
      done();
    });
    /**
     * @tc.name   testMuslUnistdGetEGid001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_GETEGID_0100
     * @tc.desc   test getegid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdGetEGid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = unistd.getEGid();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertLarger(-1);
      done();
    });
    /**
     * @tc.name   testMuslUnistdGetHostName001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_GETHOSTNAME_0100
     * @tc.desc   test gethostname
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdGetHostName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = unistd.getHostName();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testMuslUnistdGetPageSize001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_GETPAGESIZE_0100
     * @tc.desc   test getpagesize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdGetPageSize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = unistd.getPageSize();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertLarger(0);
      done();
    });
    /**
     * @tc.name   testMuslUnistdGetDTableSize001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_GETDTABLESIZE_0100
     * @tc.desc   test getdtablesize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdGetDTableSize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = unistd.getDTableSize();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertLarger(0);
      done();
    });
    /**
     * @tc.name   testMuslUnistdGtReSuid001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_GETRESUID_0100
     * @tc.desc   test getresuid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdGtReSuid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = unistd.getReSuid();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testMuslUnistdGetResGid001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_GETRESGID_0100
     * @tc.desc   test getresgid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdGetResGid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = unistd.getResGid();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslUnistdSleep001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_SLEEP_0100
     * @tc.desc   test sleep
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdSleep001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 1;
      let c = 0
      let a: number = unistd.sleep(b);
      let d = (a >= c);
      expect(d).assertTrue();
      done();
    });
    /**
     * @tc.name   testMuslUnistdSleep002
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_SLEEP_0200
     * @tc.desc   test sleep
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdSleep002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 2;
      let c = 0
      let a: number = unistd.sleep(b);
      expect(c).assertEqual(a);
      done();
    });

    /**
     * @tc.name   testMuslUnistdIsatty001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_ISATTY_0100
     * @tc.desc   test isatty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdIsatty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = unistd.isatty();
      expect(a).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testMuslUnistdSwab001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_SWAB_0100
     * @tc.desc   test swab
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdSwab001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 0
      let c: String = unistd.swab(a);
      expect(c).assertEqual("BAcd");
      done();
    });

    /**
     * @tc.name   testMuslUnistdSwab002
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_SWAB_0200
     * @tc.desc   test swab
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdSwab002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 1
      let c: String = unistd.swab(a);
      expect(c).assertEqual("abcd");
      done();
    });

    /**
     * @tc.name   testMuslUnistdSync001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_SYNC_0100
     * @tc.desc   test sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let c: number = unistd.sync();
      expect(c).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslUnistdSyncfs001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_SYNCFS_0100
     * @tc.desc   test syncfs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdSyncfs001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let c: number = unistd.syncfs();
      expect(c).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testMuslUnistdSyscall001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_SYSCALL_0100
     * @tc.desc   test syscall
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdSyscall001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let c: number = unistd.syscall();
      expect(c).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslUnistdSysinfo001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_SYSINFO_0100
     * @tc.desc   test sysinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdSysinfo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let c: number = unistd.sysinfo(0);
      expect(c).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testMuslUnistdSysinfo002
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_SYSINFO_0200
     * @tc.desc   test sysinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdSysinfo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let c: number = unistd.sysinfo(1);
      expect(c).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testMuslUnistdSyncFileRange001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_SYNCFILERANGE_0100
     * @tc.desc   test sync_file_range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdSyncFileRange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let c: number = unistd.sync_file_range();
      expect(c).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testMuslUnistdTcgetpgrp001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_TCGETPGRP_0100
     * @tc.desc   test tcgetpgrp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdTcgetpgrp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let c: number = unistd.tcgetpgrp(0);
      expect(c).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testMuslUnistdTcsetpgrp001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_TCSETPGRP_0100
     * @tc.desc   test tcsetpgrp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdTcsetpgrp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let c: number = unistd.tcsetpgrp(0);
      expect(c).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testMuslUnistdTtyname002
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_TTYNAME_0200
     * @tc.desc   test ttyname
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdTtyname002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let toCpp = 1;
      let result: number = unistd.ttyname(toCpp);
      console.info("Test result= " + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslUnistdTtynameR001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_TTYNAME_R_0100
     * @tc.desc   test ttyname_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdTtynameR001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let toCpp = 0;
      let result: number = unistd.ttyname_r(toCpp);
      console.info("Test result= " + result);
      expect(result).assertEqual(0);
      done();
      ;
    });

    /**
     * @tc.name   testMuslUnistdUnlink001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_UNLINK_0100
     * @tc.desc   test unlink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdUnlink001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = unistd.unlink(-1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testMuslUnistdUnlink002
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_UNLINK_0200
     * @tc.desc   test unlink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdUnlink002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = unistd.unlink(0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslUnistdUnlinkat001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_UNLINKAT_0100
     * @tc.desc   test unlinkat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdUnlinkat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = unistd.unlinkat(-1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testMuslUnistdUnlinkat002
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_UNLINKAT_0200
     * @tc.desc   test unlinkat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdUnlinkat002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = unistd.unlinkat(0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslUnistdUsleep001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_USLEEP_0100
     * @tc.desc   test usleep
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdUsleep001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 2000000;
      let result: number = unistd.usleep(b);
      console.info("Test result= " + result);
      expect(result).assertEqual(1);
      done();
      ;
    });

    /**
     * @tc.name   testMuslUnistdAccess001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_ACCESS_0100
     * @tc.desc   test access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdAccess001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = unistd.access();
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslUnistdEaccess001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_EACCESS_0100
     * @tc.desc   test eaccess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdEaccess001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = unistd.eaccess();
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslUnistdAlarm001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_ALARM_0100
     * @tc.desc   test alarm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdAlarm001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 0;
      let resultValue = 0;
      let result: number = unistd.alarm(param);
      expect(result).assertEqual(resultValue);
      done();
    });

    /**
     * @tc.name   testMuslUnistdOptarg001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_OPTARG_0100
     * @tc.desc   test optarg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdOptarg001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = unistd.optarg();
      expect(a).assertEqual(1);
      done();
    });
    /**
     * @tc.name   testMuslUnistdOpterr001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_OPTERR_0100
     * @tc.desc   test opterr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdOpterr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = unistd.opterr();
      expect(a).assertEqual(1);
      done();
    });
    /**
     * @tc.name   testMuslUnistdOptind001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_OPTIND_0100
     * @tc.desc   test optind
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdOptind001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = unistd.optind();
      expect(a).assertEqual(1);
      done();
    });
    /**
     * @tc.name   testMuslUnistdOptopt001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_OPTOPT_0100
     * @tc.desc   test optopt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdOptopt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = unistd.optopt();
      expect(a).assertEqual(1);
      done();
    });
    /**
     * @tc.name   testMuslUnistdPRead001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_PREAD_0100
     * @tc.desc   test pread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdPRead001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = unistd.pRead();
      expect(a).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslUnistdPipe001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_PIPE_0100
     * @tc.desc   test pipe
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdPipe001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = unistd.pipe();
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(0);
      done();
      ;
    });

    /**
     * @tc.name   testMuslUnistdPipe2001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_PIPE2_0100
     * @tc.desc   test pipe2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdPipe2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = unistd.pipe2();
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(0);
      done();
      ;
    });

    /**
     * @tc.name   testMuslUnistdPathconf001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_PATHCONF_0100
     * @tc.desc   test pathconf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdPathconf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: string = unistd.pathconf();
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(0);
      done();
      ;
    });

    /**
     * @tc.name   testMuslUnistdSetresuid001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_SETRESUID_0100
     * @tc.desc   test setresuid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdSetresuid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = unistd.setresuid();
      expect(result).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testMuslUnistdTruncate001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_TRUNCATE_0100
     * @tc.desc   test truncate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdTruncate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = unistd.truncate();
      expect(result).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testMuslUnistdTruncate64001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_TRUNCATE64_0100
     * @tc.desc   test truncate64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdTruncate64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = unistd.truncate64();
      expect(result).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testMuslUnistdNice001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_NICE_0100
     * @tc.desc   test nice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdNice001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = 10;
      let data: number = unistd.nice(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(0);
      done();
      ;
    });

    /**
     * @tc.name   testMuslUnistdGetentropy001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_GETENTROPY_0100
     * @tc.desc   test getentropy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdGetentropy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultValue = 0;
      let result: number = unistd.getentropy();
      expect(result).assertEqual(resultValue);
      done();
    });


    /**
     * @tc.name   testMuslUnistdGetdomainname001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_GETDOMAINNAME_0100
     * @tc.desc   test getdomainname
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdGetdomainname001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultValue = 0;
      let result: number = unistd.getdomainname();
      expect(result).assertEqual(resultValue);
      done();
    });

    /**
     * @tc.name   testMuslUnistdGetcwd001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_GETCWD_0100
     * @tc.desc   test getcwd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdGetcwd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultValue = 1;
      let result: number = unistd.getcwd();
      expect(result).assertEqual(resultValue);
      done();
    });

    /**
     * @tc.name   testMuslUnistdFpathconf001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_FPATHCONF_0100
     * @tc.desc   test fpathconf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdFpathconf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultValue = 1;
      let result: number = unistd.fpathconf();
      expect(result).assertEqual(resultValue);
      done();
    });

    /**
     * @tc.name   testMuslUnistdChdir001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_CHDIR_0100
     * @tc.desc   test chdir
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdChdir001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultValue = 0;
      let result: number = unistd.chdir();
      expect(result).assertEqual(resultValue);
      done();
    });

    /**
     * @tc.name   testMuslUnistdChown001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_CHOWN_0100
     * @tc.desc   test chown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdChown001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultValue = 0;
      let result: number = unistd.chown();
      expect(result).assertEqual(resultValue);
      done();
    });

    /**
     * @tc.name   testMuslUnistdChroot001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_CHROOT_0100
     * @tc.desc   test chroot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdChroot001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultValue = 0;
      let result: number = unistd.chroot();
      expect(result).assertEqual(resultValue);
      done();
    });

    /**
     * @tc.name   testMuslUnistdFsync001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_FSYNC_0100
     * @tc.desc   test fsync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdFsync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultValue = 0;
      let result: number = unistd.fsync();
      expect(result).assertEqual(resultValue);
      done();
    });

    /**
     * @tc.name   testMuslUnistdFtruncate001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_FTRUNCATE_0100
     * @tc.desc   test ftruncate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdFtruncate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultValue = 0;
      let result: number = unistd.ftruncate();
      expect(result).assertEqual(resultValue);
      done();
    });

    /**
     * @tc.name   testMuslUnistdFtruncate64001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_FTRUNCATE64_0100
     * @tc.desc   test ftruncate64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdFtruncate64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultValue = 0;
      let result: number = unistd.ftruncate64();
      expect(result).assertEqual(resultValue);
      done();
    });

    /**
     * @tc.name   testMuslUnistdTtyname001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_TTYNAME_0100
     * @tc.desc   test ttyname
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdTtyname001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let toCpp = 0;
      let result: number = unistd.ttyname(toCpp);
      expect(result).assertEqual(0);
      done();
      ;
    });

    /**
     * @tc.name   testMuslIssetugid001
     * @tc.number SUB_THIRDPARTY_MUSL_ISSETUGID_0100
     * @tc.desc   test issetugid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslIssetugid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = unistd.issetugid();
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testMuslUnistdSetegid001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_SETEGID_0100
     * @tc.desc   test setegid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdSetegid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = unistd.setegid();
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslUnistdGetLogin001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_GETLOGIN_0100
     * @tc.desc   test getlogin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdGetLogin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = unistd.getLogin();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslUnistdGetLoginR001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_GETLOGIN_R_0100
     * @tc.desc   test getloginr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdGetLoginR001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = unistd.getLoginR();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslUnistdLink002
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_LINK_0200
     * @tc.desc   test link
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdLink002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = "";
      let b = "";
      let c: number = unistd.link(a, b);
      expect(c).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testMuslUnistdLinkAt002
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_LINK_AT_0200
     * @tc.desc   test linkAt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdLinkAt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = "";
      let b = "";
      let c: number = unistd.linkAt(a, b);
      expect(c).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testMuslUnistdLockF001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_LOCKF_0100
     * @tc.desc   test lockf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdLockF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let a = filesDir + '/LockFNone.txt';
      let file = fs.openSync(a, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let c: number = unistd.lockF(a);
      fs.closeSync(file);
      expect(c).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslUnistdLockF64001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_LOCKF64_0100
     * @tc.desc   test lockF64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdLockF64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let a = filesDir + '/lockSixFour.txt';
      let file = fs.openSync(a, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let c: number = unistd.lockF64(a);
      fs.closeSync(file);
      expect(c).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslUnistdClose001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_CLOSE_0100
     * @tc.desc   test close
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdClose001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let a = filesDir + '/test.txt';
      let file = fs.openSync(a, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);
      let param = 0;
      let result: number = unistd.close(a);
      expect(result).assertEqual(param);
      done();
    });

    /**
     * @tc.name   testMuslUnistdCopyFileRange001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_COPY_FILE_RANGE_0100
     * @tc.desc   test copy_file_range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdCopyFileRange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let a = filesDir + 'testCopyFileRange.txt';
      let b = filesDir + 'testCopyFile.txt';
      let file = fs.openSync(a, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);
      let fileAt = fs.openSync(b, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(fileAt);
      let result: number = unistd.copy_file_range(a, b);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslUnistdCtermid001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_CTERMID_0100
     * @tc.desc   test ctermid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdCtermid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = "/dev/tty";
      let result: string = unistd.ctermid();
      expect(result).assertEqual(param);
      done();
    });
    /**
     * @tc.name   testMuslUnistdSysconf001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_SYSCONF_0100
     * @tc.desc   test sysconf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdSysconf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 30;
      let sysconfResult: number = unistd.sysconf(param);
      expect(sysconfResult).assertEqual(4096);
      done();
      ;
    });

    /**
     * @tc.name   testMuslUnistdSysconf002
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_SYSCONF_0200
     * @tc.desc   test sysconf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdSysconf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = -100;
      let sysconfResult: number = unistd.sysconf(param);
      expect(sysconfResult).assertEqual(-1);
      done();
      ;
    });

    /**
     * @tc.name   testMuslUnistdSbrk001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_SBRK_0100
     * @tc.desc   test sbrk
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdSbrk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 0;
      let result: number = unistd.sbrk();
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(param);
      done();
    });

    /**
     * @tc.name   testMuslUnistdWrite001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_WRITE_0100
     * @tc.desc   test write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdWrite001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 2;
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let a = filesDir + 'test2.txt';
      let file = fs.openSync(a, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let result: number = unistd.write(file.fd);
      fs.closeSync(file);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(param);
      done();
    });

    /**
     * @tc.name   testMuslUnistdEnviron001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_ENVIRON_0100
     * @tc.desc   test environ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdEnviron001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 0;
      let result: number = unistd.environ();
      expect(result).assertEqual(param);
      done();
    });

    /**
     * @tc.name   testMuslUnistdDup001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_DUP_0100
     * @tc.desc   test dup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdDup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let a = filesDir + '/test.txt';
      let file = fs.openSync(a, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);
      let param = 0;
      let result: number = unistd.dup(a);
      expect(result).assertEqual(param);
      done();
    });

    /**
     * @tc.name   testMuslUnistdDup2001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_DUP2_0100
     * @tc.desc   test dup2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdDup2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let a = filesDir + '/test.txt';
      let file = fs.openSync(a, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);
      let param = 0;
      let result: number = unistd.dup2(a);
      expect(result).assertEqual(param);
      done();
    });

    /**
     * @tc.name   testMuslUnistdDup3001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_DUP3_0100
     * @tc.desc   test dup3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdDup3001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let a = filesDir + '/test.txt';
      let file = fs.openSync(a, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);
      let param = 0;
      let result: number = unistd.dup3(a);
      expect(result).assertEqual(param);
      done();
    });

    /**
     * @tc.name   testMuslUnistdExecv001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_EXECV_0100
     * @tc.desc   test execv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdExecv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 0;
      let result: number = unistd.execv();
      expect(result).assertEqual(param);
      done();
    });

    /**
     * @tc.name   testMuslUnistdExecvp001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_EXECVP_0100
     * @tc.desc   test execvp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdExecvp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 0;
      let result: number = unistd.execvp();
      expect(result).assertEqual(param);
      done();
    });
    /**
     * @tc.name   testMuslUnistdExecvpe001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_EXECVPE_0100
     * @tc.desc   test execvpe
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdExecvpe001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 0;
      let result: number = unistd.execvpe();
      expect(result).assertEqual(param);
      done();
    });

    /**
     * @tc.name   testMuslUnistdFexecve001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_FEXECVE_0100
     * @tc.desc   test fexecve
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdFexecve001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 0;
      let result: number = unistd.fexecve();
      expect(result).assertEqual(param);
      done();
    });
    /**
     * @tc.name   testMuslUnistdExecve001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_EXECVE_0100
     * @tc.desc   test execve
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdExecve001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 0;
      let result: number = unistd.execve();
      expect(result).assertEqual(param);
      done();
    });

    /**
     * @tc.name   testMuslUnistdFaccessat001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_FACCESSAT_0100
     * @tc.desc   test faccessat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdFaccessat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let a = filesDir + '/faccessat.txt';
      let file = fs.openSync(a, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);
      let param = 0;
      let result: number = unistd.faccessat(a);
      expect(result).assertEqual(param);
      done();
    });


    /**
     * @tc.name   testMuslUnistdFchdir001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_FCHDIR_0100
     * @tc.desc   test fchdir
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdFchdir001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let param = 0;
      let result: number = unistd.fchdir(filesDir);
      expect(result).assertEqual(param);
      done();
    });

    /**
     * @tc.name   testMuslUnistdFchownat001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_FCHOWNAT_0100
     * @tc.desc   test fchownat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdFchownat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let a = filesDir + '/fchownat.txt';
      let file = fs.openSync(a, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);
      let param = 0;
      let result: number = unistd.fchownat(a);
      expect(result).assertEqual(param);
      done();
    });

    /**
     * @tc.name   testMuslUnistdFdatasync001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_FDATASYNC_0100
     * @tc.desc   test fdatasync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdFdatasync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let a = filesDir + '/test.txt';
      let file = fs.openSync(a, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);
      let param = 0;
      let result: number = unistd.fdatasync(a);
      expect(result).assertEqual(param);
      done();
    });

    /**
     * @tc.name   testMuslUnistdFchown001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_FCHOWN_0100
     * @tc.desc   test fchown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdFchown001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let a = filesDir + '/test.txt';
      let file = fs.openSync(a, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);
      let param = 0;
      let result: number = unistd.fchown(a);
      expect(result).assertEqual(param);
      done();
      ;
    });

    /**
     * @tc.name   testMuslUnistdDaemon001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_DAEMON_0100
     * @tc.desc   test daemon
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdDaemon001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param = 0;
      let result: number = unistd.daemon();
      expect(result).assertEqual(param);
      done();
      ;
    });

    /**
     * @tc.name   testMuslUnistdWrite002
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_WRITE_0200
     * @tc.desc   test vwarn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdWrite002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue = -1;
      let result: number = unistd.vwarn();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslUnistdWrite003
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_WRITE_0300
     * @tc.desc   test vwarnx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdWrite003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue = -1;
      let result: number = unistd.vwarnx();
      expect(result).assertEqual(resultTrue);
      done()
    });
  })
}
