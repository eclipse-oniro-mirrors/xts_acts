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
import { beforeEach, describe, expect, it } from '@ohos/hypium'
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_SETPGID_0100
     * @tc.name       : testMuslUnistdSetpgid001
     * @tc.desc       : test setpgid
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdSetpgid001', 0, async (done: Function) => {
      let b = 0
      let c = 0
      let a: number = unistd.setpgid(b, c);
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_SETPGID_0300
     * @tc.name       : testMuslUnistdSetpgid003
     * @tc.desc       : test setpgid
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdSetpgid003', 0, async (done: Function) => {
      let b = 0
      let c = -1
      let a: number = unistd.setpgid(b, c);
      expect(a).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_SETPGID_0400
     * @tc.name       : testMuslUnistdSetpgid004
     * @tc.desc       : test setpgid
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdSetpgid004', 0, async (done: Function) => {
      let b = 1
      let c = 0
      let a: number = unistd.setpgid(b, c);
      expect(a).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_SETPGRP_0100
     * @tc.name       : testMuslUnistdSetpgrp001
     * @tc.desc       : test setpgrp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdSetpgrp001', 0, async (done: Function) => {
      let b = -1
      let a: number = unistd.setpgrp(b);
      expect(a).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_SETPGRP_0200
     * @tc.name       : testMuslUnistdSetpgrp002
     * @tc.desc       : test setpgrp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdSetpgrp002', 0, async (done: Function) => {
      let b = 0;
      let a: number = unistd.setpgrp(b);
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_READ_0100
     * @tc.name       : testMuslUnistdRead001
     * @tc.desc       : test read
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdRead001', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_RMDIR_0100
     * @tc.name       : testMuslUnistdRmdir001
     * @tc.desc       : test rmdir
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdRmdir001', 0, async (done: Function) => {
      let param = -1;
      let result: number = unistd.rmdir(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_RMDIR_0200
     * @tc.name       : testMuslUnistdRmdir002
     * @tc.desc       : test rmdir
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdRmdir002', 0, async (done: Function) => {
      let param = 0;
      let result: number = unistd.rmdir(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETGROUPS_0100
     * @tc.name       : testMuslUnistdGetGroups001
     * @tc.desc       : test getgroups
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetGroups001', 0, async (done: Function) => {
      let data: number = unistd.getGroups(0);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETGROUPS_0200
     * @tc.name       : testMuslUnistdGetGroups002
     * @tc.desc       : test getgroups
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetGroups002', 0, async (done: Function) => {
      let data: number = unistd.getGroups(10);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETGROUPS_0300
     * @tc.name       : testMuslUnistdGetGroups003
     * @tc.desc       : test getgroups
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetGroups003', 0, async (done: Function) => {
      let data: number = unistd.getGroups(5);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETPID_0100
     * @tc.name       : testMuslUnistdGetPid001
     * @tc.desc       : test getpid
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetPid001', 0, async (done: Function) => {
      let data: number = unistd.getPid();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertLarger(-1);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETPPID_0100
     * @tc.name       : testMuslUnistdGetPPid001
     * @tc.desc       : test getppid
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetPPid001', 0, async (done: Function) => {
      let data: number = unistd.getPPid();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertLarger(-1);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETPGRP_0100
     * @tc.name       : testMuslUnistdGetPGrp001
     * @tc.desc       : test getpgrp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetPGrp001', 0, async (done: Function) => {
      let data: number = unistd.getPGrp();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_CRYPT_0100
     * @tc.name       : testMuslUnistdCrypt001
     * @tc.desc       : test crypt
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdCrypt001', 0, async (done: Function) => {
      let salt: String = "$1$";
      let c: String = unistd.crypt(salt);
      let d: String = unistd.crypt(salt);
      expect(c).assertEqual(d);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_CRYPT_0200
     * @tc.name       : testMuslUnistdCrypt002
     * @tc.desc       : test crypt
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdCrypt002', 0, async (done: Function) => {
      let salt: String = "$2$";
      let c: String = unistd.crypt(salt);
      let d: String = unistd.crypt(salt);
      expect(c).assertEqual(d);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_CRYPT_0300
     * @tc.name       : testMuslUnistdCrypt003
     * @tc.desc       : test crypt
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdCrypt003', 0, async (done: Function) => {
      let salt: String = "$5$";
      let c: String = unistd.crypt(salt);
      let d: String = unistd.crypt(salt);
      expect(c).assertEqual(d);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETPGID_0100
     * @tc.name       : testMuslUnistdGetPGid001
     * @tc.desc       : test getpgrd
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetPGid001', 0, async (done: Function) => {
      let data: number = unistd.getPGid();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETSID_0100
     * @tc.name       : testMuslUnistdGetSid001
     * @tc.desc       : test getsid
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetSid001', 0, async (done: Function) => {
      let data: number = unistd.getSid(0);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETUID_0100
     * @tc.name       : testMuslUnistdGetUid001
     * @tc.desc       : test getuid
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetUid001', 0, async (done: Function) => {
      let data: number = unistd.getUid();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETOPT_0100
     * @tc.name       : testMuslUnistdGetOpt001
     * @tc.desc       : test getopt
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetOpt001', 0,
      async (done: Function) => {
        let data: number = unistd.getOpt("-a");
        console.info("Test NAPI data= " + JSON.stringify(data));
        expect(data).assertEqual(97);
        done();
      });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETOPT_0200
     * @tc.name       : testMuslUnistdGetOpt002
     * @tc.desc       : test getopt
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetOpt002', 0, async (done: Function) => {
      let data: number = unistd.getOpt("-b");
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(98);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETOPT_0300
     * @tc.name       : testMuslUnistdGetOpt003
     * @tc.desc       : test getopt
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetOpt003', 0, async (done: Function) => {
      let data: number = unistd.getOpt("-c");
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(99);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETTID_0100
     * @tc.name       : testMuslUnistdGetTid001
     * @tc.desc       : test gettid
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetTid001', 0, async (done: Function) => {
      let data: number = unistd.getTid();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertLarger(-1);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETEUID_0100
     * @tc.name       : testMuslUnistdGetEUid001
     * @tc.desc       : test geteuid
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetEUid001', 0, async (done: Function) => {
      let data: number = unistd.getEUid();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertLarger(0);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETGID_0100
     * @tc.name       : testMuslUnistdGetGid001
     * @tc.desc       : test geteuid
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetGid001', 0, async (done: Function) => {
      let data: number = unistd.getGid();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertLarger(-1);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETEGID_0100
     * @tc.name       : testMuslUnistdGetEGid001
     * @tc.desc       : test getegid
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetEGid001', 0, async (done: Function) => {
      let data: number = unistd.getEGid();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertLarger(-1);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETHOSTNAME_0100
     * @tc.name       : testMuslUnistdGetHostName001
     * @tc.desc       : test gethostname
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetHostName001', 0, async (done: Function) => {
      let data: number = unistd.getHostName();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETPAGESIZE_0100
     * @tc.name       : testMuslUnistdGetPageSize001
     * @tc.desc       : test getpagesize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetPageSize001', 0, async (done: Function) => {
      let data: number = unistd.getPageSize();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertLarger(0);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETDTABLESIZE_0100
     * @tc.name       : testMuslUnistdGetDTableSize001
     * @tc.desc       : test getdtablesize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetDTableSize001', 0, async (done: Function) => {
      let data: number = unistd.getDTableSize();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertLarger(0);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETRESUID_0100
     * @tc.name       : testMuslUnistdGtReSuid001
     * @tc.desc       : test getresuid
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGtReSuid001', 0, async (done: Function) => {
      let data: number = unistd.getReSuid();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETRESGID_0100
     * @tc.name       : testMuslUnistdGetResGid001
     * @tc.desc       : test getresgid
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetResGid001', 0, async (done: Function) => {
      let data: number = unistd.getResGid();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_SLEEP_0100
     * @tc.name       : testMuslUnistdSleep001
     * @tc.desc       : test sleep
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdSleep001', 0, async (done: Function) => {
      let b = 1;
      let c = 0
      let a: number = unistd.sleep(b);
      let d = (a >= c);
      expect(d).assertTrue();
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_SLEEP_0200
     * @tc.name       : testMuslUnistdSleep002
     * @tc.desc       : test sleep
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdSleep002', 0, async (done: Function) => {
      let b = 2;
      let c = 0
      let a: number = unistd.sleep(b);
      expect(c).assertEqual(a);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_ISATTY_0100
     * @tc.name       : testMuslUnistdIsatty001
     * @tc.desc       : test isatty
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdIsatty001', 0, async (done: Function) => {
      let a: number = unistd.isatty();
      expect(a).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_SWAB_0100
     * @tc.name       : testMuslUnistdSwab001
     * @tc.desc       : test swab
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdSwab001', 0, async (done: Function) => {
      let a: number = 0
      let c: String = unistd.swab(a);
      expect(c).assertEqual("BAcd");
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_SWAB_0200
     * @tc.name       : testMuslUnistdSwab002
     * @tc.desc       : test swab
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdSwab002', 0, async (done: Function) => {
      let a: number = 1
      let c: String = unistd.swab(a);
      expect(c).assertEqual("abcd");
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_SYNC_0100
     * @tc.name       : testMuslUnistdSync001
     * @tc.desc       : test sync
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdSync001', 0, async (done: Function) => {
      let c: number = unistd.sync();
      expect(c).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_SYNCFS_0100
     * @tc.name       : testMuslUnistdSyncfs001
     * @tc.desc       : test syncfs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdSyncfs001', 0, async (done: Function) => {
      let c: number = unistd.syncfs();
      expect(c).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_SYSCALL_0100
     * @tc.name       : testMuslUnistdSyscall001
     * @tc.desc       : test syscall
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdSyscall001', 0, async (done: Function) => {
      let c: number = unistd.syscall();
      expect(c).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_SYSINFO_0100
     * @tc.name       : testMuslUnistdSysinfo001
     * @tc.desc       : test sysinfo
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdSysinfo001', 0, async (done: Function) => {
      let c: number = unistd.sysinfo(0);
      expect(c).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_SYSINFO_0200
     * @tc.name       : testMuslUnistdSysinfo002
     * @tc.desc       : test sysinfo
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdSysinfo002', 0, async (done: Function) => {
      let c: number = unistd.sysinfo(1);
      expect(c).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_SYNCFILERANGE_0100
     * @tc.name       : testMuslUnistdSyncFileRange001
     * @tc.desc       : test sync_file_range
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdSyncFileRange001', 0, async (done: Function) => {
      let c: number = unistd.sync_file_range();
      expect(c).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_TCGETPGRP_0100
     * @tc.name       : testMuslUnistdTcgetpgrp001
     * @tc.desc       : test tcgetpgrp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdTcgetpgrp001', 0, async (done: Function) => {
      let c: number = unistd.tcgetpgrp(0);
      expect(c).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_TCSETPGRP_0100
     * @tc.name       : testMuslUnistdTcsetpgrp001
     * @tc.desc       : test tcsetpgrp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdTcsetpgrp001', 0, async (done: Function) => {
      let c: number = unistd.tcsetpgrp(0);
      expect(c).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_TTYNAME_0200
     * @tc.name       : testMuslUnistdTtyname002
     * @tc.desc       : test ttyname
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdTtyname002', 0, async (done: Function) => {
      let toCpp = 1;
      let result: number = unistd.ttyname(toCpp);
      console.info("Test result= " + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_TTYNAME_R_0100
     * @tc.name       : testMuslUnistdTtynameR001
     * @tc.desc       : test ttyname_r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdTtynameR001', 0, async (done: Function) => {
      let toCpp = 0;
      let result: number = unistd.ttyname_r(toCpp);
      console.info("Test result= " + result);
      expect(result).assertEqual(0);
      done();
      ;
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_UNLINK_0100
     * @tc.name       : testMuslUnistdUnlink001
     * @tc.desc       : test unlink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdUnlink001', 0, async (done: Function) => {
      let result: number = unistd.unlink(-1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_UNLINK_0200
     * @tc.name       : testMuslUnistdUnlink002
     * @tc.desc       : test unlink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdUnlink002', 0, async (done: Function) => {
      let result: number = unistd.unlink(0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_UNLINKAT_0100
     * @tc.name       : testMuslUnistdUnlinkat001
     * @tc.desc       : test unlinkat
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdUnlinkat001', 0, async (done: Function) => {
      let result: number = unistd.unlinkat(-1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_UNLINKAT_0200
     * @tc.name       : testMuslUnistdUnlinkat002
     * @tc.desc       : test unlinkat
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdUnlinkat002', 0, async (done: Function) => {
      let result: number = unistd.unlinkat(0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_USLEEP_0100
     * @tc.name       : testMuslUnistdUsleep001
     * @tc.desc       : test usleep
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdUsleep001', 0, async (done: Function) => {
      let b = 2000000;
      let result: number = unistd.usleep(b);
      console.info("Test result= " + result);
      expect(result).assertEqual(1);
      done();
      ;
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_ACCESS_0100
     * @tc.name       : testMuslUnistdAccess001
     * @tc.desc       : test access
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdAccess001', 0, async (done: Function) => {
      let a: number = unistd.access();
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_EACCESS_0100
     * @tc.name       : testMuslUnistdEaccess001
     * @tc.desc       : test eaccess
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdEaccess001', 0, async (done: Function) => {
      let a: number = unistd.eaccess();
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_ALARM_0100
     * @tc.name       : testMuslUnistdAlarm001
     * @tc.desc       : test alarm
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     * @
     */
    it('testMuslUnistdAlarm001', 0, async (done: Function) => {
      let param = 0;
      let resultValue = 0;
      let result: number = unistd.alarm(param);
      expect(result).assertEqual(resultValue);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_OPTARG_0100
     * @tc.name       : testMuslUnistdOptarg001
     * @tc.desc       : test optarg
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdOptarg001', 0, async (done: Function) => {
      let a: number = unistd.optarg();
      expect(a).assertEqual(1);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_OPTERR_0100
     * @tc.name       : testMuslUnistdOpterr001
     * @tc.desc       : test opterr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdOpterr001', 0, async (done: Function) => {
      let a: number = unistd.opterr();
      expect(a).assertEqual(1);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_OPTIND_0100
     * @tc.name       : testMuslUnistdOptind001
     * @tc.desc       : test optind
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdOptind001', 0, async (done: Function) => {
      let a: number = unistd.optind();
      expect(a).assertEqual(1);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_OPTOPT_0100
     * @tc.name       : testMuslUnistdOptopt001
     * @tc.desc       : test optopt
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdOptopt001', 0, async (done: Function) => {
      let a: number = unistd.optopt();
      expect(a).assertEqual(1);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_PREAD_0100
     * @tc.name       : testMuslUnistdPRead001
     * @tc.desc       : test pread
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdPRead001', 0, async (done: Function) => {
      let a: number = unistd.pRead();
      expect(a).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_PIPE_0100
     * @tc.name       : testMuslUnistdPipe001
     * @tc.desc       : test pipe
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdPipe001', 0, async (done: Function) => {
      let data: number = unistd.pipe();
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(0);
      done();
      ;
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_PIPE2_0100
     * @tc.name       : testMuslUnistdPipe2001
     * @tc.desc       : test pipe2
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdPipe2001', 0, async (done: Function) => {
      let data: number = unistd.pipe2();
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(0);
      done();
      ;
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_PATHCONF_0100
     * @tc.name       : testMuslUnistdPathconf001
     * @tc.desc       : test pathconf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdPathconf001', 0, async (done: Function) => {
      let data: string = unistd.pathconf();
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(0);
      done();
      ;
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_UNISTD_SETRESUID_0100
     * @tc.name     : testMuslUnistdSetresuid001
     * @tc.desc     : test setresuid
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslUnistdSetresuid001', 0, async (done: Function) => {
      let result: number = unistd.setresuid();
      expect(result).assertEqual(0)
      done();
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_UNISTD_TRUNCATE_0100
     * @tc.name     : testMuslUnistdTruncate001
     * @tc.desc     : test truncate
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslUnistdTruncate001', 0, async (done: Function) => {
      let result: number = unistd.truncate();
      expect(result).assertEqual(0)
      done();
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_UNISTD_TRUNCATE64_0100
     * @tc.name     : testMuslUnistdTruncate64001
     * @tc.desc     : test truncate64
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslUnistdTruncate64001', 0, async (done: Function) => {
      let result: number = unistd.truncate64();
      expect(result).assertEqual(0)
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_NICE_0100
     * @tc.name       : testMuslUnistdNice001
     * @tc.desc       : test nice
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdNice001', 0, async (done: Function) => {
      let a: number = 10;
      let data: number = unistd.nice(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(0);
      done();
      ;
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETENTROPY_0100
     * @tc.name       : testMuslUnistdGetentropy001
     * @tc.desc       : test getentropy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslUnistdGetentropy001', 0, async (done: Function) => {
      let resultValue = 0;
      let result: number = unistd.getentropy();
      expect(result).assertEqual(resultValue);
      done();
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETDOMAINNAME_0100
     * @tc.name       : testMuslUnistdGetdomainname001
     * @tc.desc       : test getdomainname
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslUnistdGetdomainname001', 0, async (done: Function) => {
      let resultValue = 0;
      let result: number = unistd.getdomainname();
      expect(result).assertEqual(resultValue);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETCWD_0100
     * @tc.name       : testMuslUnistdGetcwd001
     * @tc.desc       : test getcwd
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslUnistdGetcwd001', 0, async (done: Function) => {
      let resultValue = 1;
      let result: number = unistd.getcwd();
      expect(result).assertEqual(resultValue);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_FPATHCONF_0100
     * @tc.name       : testMuslUnistdFpathconf001
     * @tc.desc       : test fpathconf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslUnistdFpathconf001', 0, async (done: Function) => {
      let resultValue = 1;
      let result = unistd.fpathconf();
      expect(result).assertEqual(resultValue);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_CHDIR_0100
     * @tc.name       : testMuslUnistdChdir001
     * @tc.desc       : test chdir
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslUnistdChdir001', 0, async (done: Function) => {
      let resultValue = 0;
      let result: number = unistd.chdir();
      expect(result).assertEqual(resultValue);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_CHOWN_0100
     * @tc.name       : testMuslUnistdChown001
     * @tc.desc       : test chown
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslUnistdChown001', 0, async (done: Function) => {
      let resultValue = 0;
      let result: number = unistd.chown();
      expect(result).assertEqual(resultValue);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_CHROOT_0100
     * @tc.name       : testMuslUnistdChroot001
     * @tc.desc       : test chroot
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslUnistdChroot001', 0, async (done: Function) => {
      let resultValue = 0;
      let result: number = unistd.chroot();
      expect(result).assertEqual(resultValue);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_FSYNC_0100
     * @tc.name       : testMuslUnistdFsync001
     * @tc.desc       : test fsync
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslUnistdFsync001', 0, async (done: Function) => {
      let resultValue = 0;
      let result: number = unistd.fsync();
      expect(result).assertEqual(resultValue);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_FTRUNCATE_0100
     * @tc.name       : testMuslUnistdFtruncate001
     * @tc.desc       : test ftruncate
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslUnistdFtruncate001', 0, async (done: Function) => {
      let resultValue = 0;
      let result: number = unistd.ftruncate();
      expect(result).assertEqual(resultValue);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_FTRUNCATE64_0100
     * @tc.name       : testMuslUnistdFtruncate64001
     * @tc.desc       : test ftruncate64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslUnistdFtruncate64001', 0, async (done: Function) => {
      let resultValue = 0;
      let result: number = unistd.ftruncate64();
      expect(result).assertEqual(resultValue);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_TTYNAME_0100
     * @tc.name       : testMuslUnistdTtyname001
     * @tc.desc       : test ttyname
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdTtyname001', 0, async (done: Function) => {
      let toCpp = 0;
      let result: number = unistd.ttyname(toCpp);
      expect(result).assertEqual(0);
      done();
      ;
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_ISSETUGID_0100
     * @tc.name       : testMuslIssetugid001
     * @tc.desc       : test issetugid
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslIssetugid001', 0, async (done: Function) => {
      let result: number = unistd.issetugid();
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_SETEGID_0100
     * @tc.name       : testMuslUnistdSetegid001
     * @tc.desc       : test setegid
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdSetegid001', 0, async (done: Function) => {
      let a: number = unistd.setegid();
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETLOGIN_0100
     * @tc.name       : testMuslUnistdGetLogin001
     * @tc.desc       : test getlogin
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdGetLogin001', 0, async (done: Function) => {
      let data = unistd.getLogin();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETLOGIN_R_0100
     * @tc.name       : testMuslUnistdGetLoginR001
     * @tc.desc       : test getloginr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdGetLoginR001', 0, async (done: Function) => {
      let data = unistd.getLoginR();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_LINK_0200
     * @tc.name       : testMuslUnistdLink002
     * @tc.desc       : test link
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdLink002', 0, async (done: Function) => {
      let a = "";
      let b = "";
      let c = unistd.link(a, b);
      expect(c).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_LINK_AT_0200
     * @tc.name       : testMuslUnistdLinkAt002
     * @tc.desc       : test linkAt
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdLinkAt002', 0, async (done: Function) => {
      let a = "";
      let b = "";
      let c = unistd.linkAt(a, b);
      expect(c).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_LOCKF_0100
     * @tc.name       : testMuslUnistdLockF001
     * @tc.desc       : test lockf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdLockF001', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let a = filesDir + '/LockFNone.txt';
      let file = fs.openSync(a, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let c = unistd.lockF(a);
      fs.closeSync(file);
      expect(c).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_LOCKF64_0100
     * @tc.name       : testMuslUnistdLockF64001
     * @tc.desc       : test lockF64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdLockF64001', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let a = filesDir + '/lockSixFour.txt';
      let file = fs.openSync(a, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let c = unistd.lockF64(a);
      fs.closeSync(file);
      expect(c).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_CLOSE_0100
     * @tc.name       : testMuslUnistdClose001
     * @tc.desc       : test close
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdClose001', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_COPY_FILE_RANGE_0100
     * @tc.name       : testMuslUnistdCopyFileRange001
     * @tc.desc       : test copy_file_range
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdCopyFileRange001', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_CTERMID_0100
     * @tc.name       : testMuslUnistdCtermid001
     * @tc.desc       : test ctermid
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdCtermid001', 0, async (done: Function) => {
      let param = "/dev/tty";
      let result = unistd.ctermid();
      expect(result).assertEqual(param);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_SYSCONF_0100
     * @tc.name       : testMuslUnistdSysconf001
     * @tc.desc       : test sysconf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdSysconf001', 0, async (done: Function) => {
      let param = 30;
      let sysconfResult: number = unistd.sysconf(param);
      expect(sysconfResult).assertEqual(4096);
      done();
      ;
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_SYSCONF_0200
     * @tc.name       : testMuslUnistdSysconf002
     * @tc.desc       : test sysconf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdSysconf002', 0, async (done: Function) => {
      let param = -100;
      let sysconfResult: number = unistd.sysconf(param);
      expect(sysconfResult).assertEqual(-1);
      done();
      ;
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_SBRK_0100
     * @tc.name       : testMuslUnistdSbrk001
     * @tc.desc       : test sbrk
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdSbrk001', 0, async (done: Function) => {
      let param = 0;
      let result: number = unistd.sbrk();
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(param);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_WRITE_0100
     * @tc.name       : testMuslUnistdWrite001
     * @tc.desc       : test write
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdWrite001', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_ENVIRON_0100
     * @tc.name       : testMuslUnistdEnviron001
     * @tc.desc       : test environ
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdEnviron001', 0, async (done: Function) => {
      let param = 0;
      let result: number = unistd.environ();
      expect(result).assertEqual(param);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_DUP_0100
     * @tc.name       : testMuslUnistdDup001
     * @tc.desc       : test dup
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdDup001', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_DUP2_0100
     * @tc.name       : testMuslUnistdDup2001
     * @tc.desc       : test dup2
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdDup2001', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_DUP3_0100
     * @tc.name       : testMuslUnistdDup3001
     * @tc.desc       : test dup3
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdDup3001', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_EXECV_0100
     * @tc.name       : testMuslUnistdExecv001
     * @tc.desc       : test execv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdExecv001', 0, async (done: Function) => {
      let param = 0;
      let result: number = unistd.execv();
      expect(result).assertEqual(param);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_EXECVP_0100
     * @tc.name       : testMuslUnistdExecvp001
     * @tc.desc       : test execvp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdExecvp001', 0, async (done: Function) => {
      let param = 0;
      let result: number = unistd.execvp();
      expect(result).assertEqual(param);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_EXECVPE_0100
     * @tc.name       : testMuslUnistdExecvpe001
     * @tc.desc       : test execvpe
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdExecvpe001', 0, async (done: Function) => {
      let param = 0;
      let result: number = unistd.execvpe();
      expect(result).assertEqual(param);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_FEXECVE_0100
     * @tc.name       : testMuslUnistdFexecve001
     * @tc.desc       : test fexecve
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdFexecve001', 0, async (done: Function) => {
      let param = 0;
      let result: number = unistd.fexecve();
      expect(result).assertEqual(param);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_EXECVE_0100
     * @tc.name       : testMuslUnistdExecve001
     * @tc.desc       : test execve
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdExecve001', 0, async (done: Function) => {
      let param = 0;
      let result: number = unistd.execve();
      expect(result).assertEqual(param);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_FACCESSAT_0100
     * @tc.name       : testMuslUnistdFaccessat001
     * @tc.desc       : test faccessat
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdFaccessat001', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_FCHDIR_0100
     * @tc.name       : testMuslUnistdFchdir001
     * @tc.desc       : test fchdir
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdFchdir001', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let param = 0;
      let result: number = unistd.fchdir(filesDir);
      expect(result).assertEqual(param);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_FCHOWNAT_0100
     * @tc.name       : testMuslUnistdFchownat001
     * @tc.desc       : test fchownat
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdFchownat001', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_FDATASYNC_0100
     * @tc.name       : testMuslUnistdFdatasync001
     * @tc.desc       : test fdatasync
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdFdatasync001', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_FCHOWN_0100
     * @tc.name       : testMuslUnistdFchown001
     * @tc.desc       : test fchown
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdFchown001', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_DAEMON_0100
     * @tc.name       : testMuslUnistdDaemon001
     * @tc.desc       : test daemon
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdDaemon001', 0, async (done: Function) => {
      let param = 0;
      let result: number = unistd.daemon();
      expect(result).assertEqual(param);
      done();
      ;
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_WRITE_0200
     * @tc.name       : testMuslUnistdWrite002
     * @tc.desc       : test vwarn
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdWrite002', 0, async (done: Function) => {
      let resultTrue = -1;
      let result: number = unistd.vwarn();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_WRITE_0300
     * @tc.name       : testMuslUnistdWrite003
     * @tc.desc       : test vwarnx
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdWrite003', 0, async (done: Function) => {
      let resultTrue = -1;
      let result: number = unistd.vwarnx();
      expect(result).assertEqual(resultTrue);
      done()
    });
  })
}
