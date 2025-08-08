/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import otherstestndk from 'libotherstestndk.so'
import fs from '@ohos.file.fs';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

export default function otherstestNdkTest() {
  describe('OthersTestNdkTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DLFCN_DLOPEN_0100
     * @tc.name       : testMuslDlFcnDlOpen001
     * @tc.desc       : test dlopen
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslDlFcnDlOpen001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.dlopen()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DLFCN_DLCLOSE_0100
     * @tc.name       : testMuslDlFcnDlClose001
     * @tc.desc       : test dlclose
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslDlFcnDlClose001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.dlclose()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DLFCN_DLERROR_0100
     * @tc.name       : testMuslDlFcnDlError001
     * @tc.desc       : test dlerror
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslDlFcnDlError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.dlerror()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DLFCN_DLADDR_0100
     * @tc.name       : testMuslDlFcnDlAddr001
     * @tc.desc       : test dladdr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslDlFcnDlAddr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.dladdr()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOLV_DN_COMP_0100
     * @tc.name       : testMuslReSoLvDnComp001
     * @tc.desc       : test dn_comp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslReSoLvDnComp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.dn_comp()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOLV_DN_SKIPNAME_0100
     * @tc.name       : testMuslReSoLvDnSkipName001
     * @tc.desc       : test dn_skipname
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslReSoLvDnSkipName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.dn_skipname()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_DREM_0100
     * @tc.name       : testMuslMathDRem001
     * @tc.desc       : test drem
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathDRem001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1;
      let secondParam = 3.651;
      expect(otherstestndk.drem(firstParam, secondParam)).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_DREMF_0100
     * @tc.name       : testMuslMathDRemF001
     * @tc.desc       : test dremf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathDRemF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1;
      let secondParam = 3.651;
      expect(otherstestndk.dremf(firstParam, secondParam)).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FINITE_0100
     * @tc.name       : testMuslMathFinite001
     * @tc.desc       : test finite
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFinite001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.78941;
      expect(otherstestndk.finite(firstParam)).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FINITEF_0100
     * @tc.name       : testMuslMathFiniteF001
     * @tc.desc       : test finitef
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFiniteF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.78941;
      expect(otherstestndk.finitef(firstParam)).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MNTENT_ENDMNTENT_0100
     * @tc.name       : testMuslMnTentEndMntEnt001
     * @tc.desc       : test endmntent
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMnTentEndMntEnt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.endmntent()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SCHED_CLONE_0100
     * @tc.name       : testMuslSchEdClone001
     * @tc.desc       : test clone
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSchEdClone001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.clone()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_LIBGEN_DIRNAME_0100
     * @tc.name       : testMuslLibGenDirName001
     * @tc.desc       : test dirname
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslLibGenDirName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.dirname()).assertEqual("/data/storage/el2/base/files");
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SYSLOG_CLOSELOG_0100
     * @tc.name       : testMuslSyslogCloseLog001
     * @tc.desc       : test closelog
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSyslogCloseLog001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.closelog()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UTMP_ENDUTENT_0100
     * @tc.name       : testMuslUTmpEndUTent001
     * @tc.desc       : test endutent
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUTmpEndUTent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.endutent()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_EPOLL_EPOLL_CREATE_0100
     * @tc.name       : testMuslEpollEpollCreate001
     * @tc.desc       : test epoll_create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslEpollEpollCreate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.epoll_create();
      expect(result).assertLarger(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_EPOLL_EPOLL_CREATE1_0100
     * @tc.name       : testMuslEpollEpollCreate1001
     * @tc.desc       : test epoll_create1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslEpollEpollCreate1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.epoll_create1();
      expect(result).assertLarger(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_EPOLL_EPOLL_CTL_0100
     * @tc.name       : testMuslEpollEpollCtl001
     * @tc.desc       : test epoll_ctl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslEpollEpollCtl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.epoll_ctl()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_EPOLL_EPOLL_PWAIT_0100
     * @tc.name       : testMuslEpollEpollPWait001
     * @tc.desc       : test epoll_pwait
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslEpollEpollPWait001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.epoll_pwait()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_EPOLL_EPOLL_WAIT_0100
     * @tc.name       : testMuslEpollEpollWait001
     * @tc.desc       : test epoll_wait
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslEpollEpollWait001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.epoll_wait()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_ETHER_ETHER_ATON_0100
     * @tc.name       : testMuslEtherEtherATon001
     * @tc.desc       : test ether_aton
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslEtherEtherATon001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.ether_aton()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_ETHER_ETHER_ATON_R_0100
     * @tc.name       : testMuslEtherEtherATonR001
     * @tc.desc       : test ether_aton_r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslEtherEtherATonR001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.ether_aton_r()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_ETHER_ETHER_NTOA_0100
     * @tc.name       : testMuslEtherEtherNToa001
     * @tc.desc       : test ether_ntoa
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslEtherEtherNToa001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.ether_ntoa()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_ETHER_ETHER_NTOA_R_0100
     * @tc.name       : testMuslEtherEtherNToaR001
     * @tc.desc       : test ether_ntoa_r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslEtherEtherNToaR001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.ether_ntoa_r()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_EVENT_EVENTFD_0100
     * @tc.name       : testMuslEventFdEventFd001
     * @tc.desc       : test eventfd
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslEventFdEventFd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = false;
      if (otherstestndk.eventfd() >= 0) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_EVENT_EVENTFD_READ_0100
     * @tc.name       : testMuslEventFdEventFdRead001
     * @tc.desc       : test eventfd_read
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslEventFdEventFdRead001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.eventfd_read()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_EVENT_EVENTFD_WRITE_0100
     * @tc.name       : testMuslEventFdEventFdWrite001
     * @tc.desc       : test eventfd_write
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslEventFdEventFdWrite001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.eventfd_write()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_XATTR_FGETXATTR_0100
     * @tc.name       : testMuslXAttrFGetXAttr001
     * @tc.desc       : test fgetxattr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslXAttrFGetXAttr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.fgetxattr()).assertLarger(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FILE_FLOCK_0100
     * @tc.name       : testMuslFileFlock001
     * @tc.desc       : test flock
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslFileFlock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.flock()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_UMASK_CHK_0100
     * @tc.name       : testMuslStatUMaskChk001
     * @tc.desc       : test __umask_chk
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStatUMaskChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.__umask_chk()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SOCKET_SENDTO_CHK_0100
     * @tc.name       : testMuslSocketSendToChk001
     * @tc.desc       : test __sendto_chk
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSocketSendToChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.__sendto_chk()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SOCKET_SEND_CHK_0100
     * @tc.name       : testMuslSocketSendChk001
     * @tc.desc       : test __send_chk
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSocketSendChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.__send_chk()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SOCKET_RECV_CHK_0100
     * @tc.name       : testMuslSocketRecVChk001
     * @tc.desc       : test __recv_chk
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSocketRecVChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.__recv_chk()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SOCKET_RECVFROM_CHK_0100
     * @tc.name       : testMuslSocketRecVFromChk001
     * @tc.desc       : test __recvfrom_chk
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSocketRecVFromChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.__recvfrom_chk()).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_CND_WAIT_0100
     * @tc.name       : testMuslThreadsCndWait001
     * @tc.desc       : test cnd_wait
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslThreadsCndWait001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = otherstestndk.cndWait()
      expect(a).assertEqual(0);
      done()
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_OTHER_CTYPEGETMBCURMAX_0100
     * @tc.name       : testCtypegetmbcurmax001
     * @tc.desc       : test __ctype_get_mb_cur_max
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCtypegetmbcurmax001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.ctypegetmbcurmax();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_OTHER_DUPLOCALE_0100
     * @tc.name       : testDuplocale001
     * @tc.desc       : test __duplocale
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplocale001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.duplocale();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_OTHER_ERRNOLOCATION_0100
     * @tc.name       : testErrnolocation001
     * @tc.desc       : test __errno_location
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testErrnolocation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.errnolocation();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_OTHER_FLTROUNDS_0100
     * @tc.name       : testFltrounds001
     * @tc.desc       : test __flt_rounds
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFltrounds001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.fltrounds();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_OTHER_HERRNOLOCATION_0100
     * @tc.name       : testHerrnolocation001
     * @tc.desc       : test __h_errno_location
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHerrnolocation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.herrnolocation();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_OTHER_LIBCCURRENTSIGRTMAX_0100
     * @tc.name       : testLibccurrentsigrtmax001
     * @tc.desc       : test __libc_current_sigrtmax
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLibccurrentsigrtmax001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.libccurrentsigrtmax();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_OTHER_LIBCCURRENTSIGRTMIN_0100
     * @tc.name       : testLibccurrentsigrtmin001
     * @tc.desc       : test __libc_current_sigrtmin
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLibccurrentsigrtmin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.libccurrentsigrtmin();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_OTHER_OVERFLOW_0100
     * @tc.name       : testOverflow001
     * @tc.desc       : test __overflow
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOverflow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let filetext = filesDir + 'test.txt';
      let file = fs.openSync(filetext, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.closeSync(file);
      let result: number = otherstestndk.overflow(filetext);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_OTHER_PTHREADCLEANUPPUSH_0100
     * @tc.name       : testPthreadcleanuppush001
     * @tc.desc       : test _pthread_cleanup_push
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPthreadcleanuppush001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.pthreadcleanuppush();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_OTHER_ACCEPT_0100
     * @tc.name       : testAccept001
     * @tc.desc       : test accept
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAccept001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.accept();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_OTHER_ACCEPT4_0100
     * @tc.name       : testAccept4001
     * @tc.desc       : test accept4
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAccept4001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.accept4();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_OTHER_PTHREADGETTIDNP_0100
     * @tc.name       : testPthreadgettidnp001
     * @tc.desc       : test pthread_gettid_np
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPthreadgettidnp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.pthreadgettidnp();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_OTHER_QUICKEXIT_0100
     * @tc.name       : testQuickexit001
     * @tc.desc       : test quick_exit
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testQuickexit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.quickexit();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_OTHER_OPTRESET_0100
     * @tc.name       : testOptreset001
     * @tc.desc       : test optreset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOptreset001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.optreset();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_OTHER_GETFATALMESSAGE_0100
     * @tc.name       : testGetfatalmessage001
     * @tc.desc       : test get_fatal_message
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetfatalmessage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.getfatalmessage();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_OTHER_PTHREADCONDCLOCKWAIT_0100
     * @tc.name       : testPthreadcondclockwait001
     * @tc.desc       : test pthread_cond_clockwait
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPthreadcondclockwait001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.pthreadcondclockwait();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_OTHER_PTHREADCONDTIMEDWAITMONOTONICNP_0100
     * @tc.name       : testPthreadcondtimedwaitmonotonicnp001
     * @tc.desc       : test pthread_cond_timedwait_monotonic_np
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPthreadcondtimedwaitmonotonicnp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.pthreadcondtimedwaitmonotonicnp();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_OTHER_PTHREADCONDTIMEOUTNP_0100
     * @tc.name       : testPthreadcondtimeoutnp001
     * @tc.desc       : test pthread_cond_timeout_np
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPthreadcondtimeoutnp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.pthreadcondtimeoutnp();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_OTHER_PTHREADGETNAMENP_0100
     * @tc.name       : testPthreadgetnamenp001
     * @tc.desc       : test pthread_getname_np
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPthreadgetnamenp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.pthreadgetnamenp();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_OTHER_PTHREADMUTEXLOCKTIMEOUTNP_0100
     * @tc.name       : testPthreadmutexlocktimeoutnp001
     * @tc.desc       : test pthread_mutex_lock_timeout_np
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPthreadmutexlocktimeoutnp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.pthreadmutexlocktimeoutnp();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_OTHER_PTHREADMUTEXTIMEDLOCKMONOTONICNP_0100
     * @tc.name       : testPthreadmutextimedlockmonotonicnp001
     * @tc.desc       : test pthread_mutex_timedlock_monotonic_np
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPthreadmutextimedlockmonotonicnp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.pthreadmutextimedlockmonotonicnp();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_OTHER_PTHREADMUTEXCLOCKLOCK_0100
     * @tc.name       : testPthreadmutexclocklock001
     * @tc.desc       : test pthread_mutex_clocklock
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPthreadmutexclocklock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.pthreadmutexclocklock();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_OTHER_PTHREADRWLOCKCLOCKRDLOCK_0100
     * @tc.name       : testPthreadrwlockclockrdlock001
     * @tc.desc       : test pthread_rwlock_clockrdlock
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPthreadrwlockclockrdlock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.pthreadrwlockclockrdlock();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_OTHER_PTHREADRWLOCKCLOCKWRLOCK_0100
     * @tc.name       : testPthreadrwlockclockwrlock001
     * @tc.desc       : test pthread_rwlock_clockwrlock
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPthreadrwlockclockwrlock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.pthreadrwlockclockwrlock();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_OTHER_PTHREADRWLOCKTIMEDRDLOCKMONOTONICNP_0100
     * @tc.name       : testPthreadrwlocktimedrdlockmonotonicnp001
     * @tc.desc       : test pthread_rwlock_timedrdlock_monotonic_np
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPthreadrwlocktimedrdlockmonotonicnp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.pthreadrwlocktimedrdlockmonotonicnp();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_OTHER_PTHREADRWLOCKTIMEDWRLOCKMONOTONICNP_0100
     * @tc.name       : testPthreadrwlocktimedwrlockmonotonicnp001
     * @tc.desc       : test pthread_rwlock_timedwrlock_monotonic_np
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPthreadrwlocktimedwrlockmonotonicnp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.pthreadrwlocktimedwrlockmonotonicnp();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_OTHER_SETAPPLICATIONTARGETSDKVERSION_0100
     * @tc.name       : testSetapplicationtargetsdkversion001
     * @tc.desc       : test set_application_target_sdk_version
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSetapplicationtargetsdkversion001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.setapplicationtargetsdkversion();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_OTHER_SETFATALMESSAGE_0100
     * @tc.name       : testSetfatalmessage001
     * @tc.desc       : test set_fatal_message
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSetfatalmessage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.setfatalmessage();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_OTHER_PTHREADCLEANUPPOP_0100
     * @tc.name       : testPthreadcleanuppop001
     * @tc.desc       : test _pthread_cleanup_pop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPthreadcleanuppop001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.pthreadcleanuppop();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_OTHER_TLSGETADDR_0100
     * @tc.name       : testTlsgetaddr001
     * @tc.desc       : test __tls_get_addr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTlsgetaddr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.tlsgetaddr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_OTHER_DELETEMODULE_0100
     * @tc.name       : testDeletemodule001
     * @tc.desc       : test delete_module
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDeletemodule001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.delete_module();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_OTHER_UFLOW_0100
     * @tc.name       : testUflow001
     * @tc.desc       : test __uflow
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUflow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.uflow();
      expect(result).assertEqual(0);
      done();
    });
  });
}