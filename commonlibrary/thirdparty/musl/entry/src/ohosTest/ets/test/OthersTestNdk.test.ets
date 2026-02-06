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
     * @tc.name   testMuslDlFcnDlOpen001
     * @tc.number SUB_THIRDPARTY_MUSL_DLFCN_DLOPEN_0100
     * @tc.desc   test dlopen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslDlFcnDlOpen001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.dlopen()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   PluginDefaultNsTest001
     * @tc.number SUB_THIRDPARTY_MUSL_PLUGIN_DEFAULT_0100
     * @tc.desc   test dlns_add_plugin_default_ld_dictionary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PluginDefaultNsTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.PluginDefaultNsTest()).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   PluginDefaultNsTest002
     * @tc.number SUB_THIRDPARTY_MUSL_PLUGIN_DEFAULT_0200
     * @tc.desc   test dlns_set_permitted_path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PluginDefaultNsTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.PluginDefaultNsTest2()).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   PluginDefaultNsTest003
     * @tc.number SUB_THIRDPARTY_MUSL_PLUGIN_DEFAULT_0300
     * @tc.desc   test dlns_set_permitted_path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PluginDefaultNsTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.PluginDefaultNsTest3()).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   PluginDefaultNsTest004
     * @tc.number SUB_THIRDPARTY_MUSL_PLUGIN_DEFAULT_0400
     * @tc.desc   test dlns_set_permitted_path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PluginDefaultNsTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.PluginDefaultNsTest4()).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   PluginDefaultNsTest005
     * @tc.number SUB_THIRDPARTY_MUSL_PLUGIN_DEFAULT_0500
     * @tc.desc   test dlns_set_permitted_path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PluginDefaultNsTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.PluginDefaultNsTest5()).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   PluginDefaultNsTest006
     * @tc.number SUB_THIRDPARTY_MUSL_PLUGIN_DEFAULT_0600
     * @tc.desc   test dlns_set_permitted_path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PluginDefaultNsTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.PluginDefaultNsTest6()).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   PluginDefaultNsTest007
     * @tc.number SUB_THIRDPARTY_MUSL_PLUGIN_DEFAULT_0700
     * @tc.desc   test dlns_set_permitted_path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PluginDefaultNsTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.PluginDefaultNsTest7()).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   PluginDefaultNsTest008
     * @tc.number SUB_THIRDPARTY_MUSL_PLUGIN_DEFAULT_0800
     * @tc.desc   test dlns_set_permitted_path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PluginDefaultNsTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.PluginDefaultNsTest8()).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   PluginDefaultNsTest009
     * @tc.number SUB_THIRDPARTY_MUSL_PLUGIN_DEFAULT_0900
     * @tc.desc   test dlns_set_permitted_path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PluginDefaultNsTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.PluginDefaultNsTest9()).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   PluginDefaultNsTest010
     * @tc.number SUB_THIRDPARTY_MUSL_PLUGIN_DEFAULT_1000
     * @tc.desc   test dlns_set_permitted_path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PluginDefaultNsTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.PluginDefaultNsTest10()).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslDlFcnDlClose001
     * @tc.number SUB_THIRDPARTY_MUSL_DLFCN_DLCLOSE_0100
     * @tc.desc   test dlclose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslDlFcnDlClose001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.dlclose()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslDlFcnDlError001
     * @tc.number SUB_THIRDPARTY_MUSL_DLFCN_DLERROR_0100
     * @tc.desc   test dlerror
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslDlFcnDlError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.dlerror()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslDlFcnDlAddr001
     * @tc.number SUB_THIRDPARTY_MUSL_DLFCN_DLADDR_0100
     * @tc.desc   test dladdr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslDlFcnDlAddr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.dladdr()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslReSoLvDnComp001
     * @tc.number SUB_THIRDPARTY_MUSL_RESOLV_DN_COMP_0100
     * @tc.desc   test dn_comp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslReSoLvDnComp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.dn_comp()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslReSoLvDnSkipName001
     * @tc.number SUB_THIRDPARTY_MUSL_RESOLV_DN_SKIPNAME_0100
     * @tc.desc   test dn_skipname
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslReSoLvDnSkipName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.dn_skipname()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslMathDRem001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_DREM_0100
     * @tc.desc   test drem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathDRem001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1;
      let secondParam = 3.651;
      expect(otherstestndk.drem(firstParam, secondParam)).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslMathDRemF001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_DREMF_0100
     * @tc.desc   test dremf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathDRemF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1;
      let secondParam = 3.651;
      expect(otherstestndk.dremf(firstParam, secondParam)).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslMathFinite001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FINITE_0100
     * @tc.desc   test finite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFinite001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.78941;
      expect(otherstestndk.finite(firstParam)).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslMathFiniteF001
     * @tc.number SUB_THIRDPARTY_MUSL_MATH_FINITEF_0100
     * @tc.desc   test finitef
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMathFiniteF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 1.78941;
      expect(otherstestndk.finitef(firstParam)).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslMnTentEndMntEnt001
     * @tc.number SUB_THIRDPARTY_MUSL_MNTENT_ENDMNTENT_0100
     * @tc.desc   test endmntent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslMnTentEndMntEnt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.endmntent()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslSchEdClone001
     * @tc.number SUB_THIRDPARTY_MUSL_SCHED_CLONE_0100
     * @tc.desc   test clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSchEdClone001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.clone()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslLibGenDirName001
     * @tc.number SUB_THIRDPARTY_MUSL_LIBGEN_DIRNAME_0100
     * @tc.desc   test dirname
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslLibGenDirName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.dirname()).assertEqual("/data/storage/el2/base/files");
      done()
    });

    /**
     * @tc.name   testMuslSyslogCloseLog001
     * @tc.number SUB_THIRDPARTY_MUSL_SYSLOG_CLOSELOG_0100
     * @tc.desc   test closelog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSyslogCloseLog001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.closelog()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslUTmpEndUTent001
     * @tc.number SUB_THIRDPARTY_MUSL_UTMP_ENDUTENT_0100
     * @tc.desc   test endutent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUTmpEndUTent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.endutent()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslEpollEpollCreate001
     * @tc.number SUB_THIRDPARTY_MUSL_EPOLL_EPOLL_CREATE_0100
     * @tc.desc   test epoll_create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslEpollEpollCreate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.epoll_create();
      expect(result).assertLarger(0);
      done()
    });

    /**
     * @tc.name   testMuslEpollEpollCreate1001
     * @tc.number SUB_THIRDPARTY_MUSL_EPOLL_EPOLL_CREATE1_0100
     * @tc.desc   test epoll_create1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslEpollEpollCreate1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.epoll_create1();
      expect(result).assertLarger(0);
      done()
    });

    /**
     * @tc.name   testMuslEpollEpollCtl001
     * @tc.number SUB_THIRDPARTY_MUSL_EPOLL_EPOLL_CTL_0100
     * @tc.desc   test epoll_ctl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslEpollEpollCtl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.epoll_ctl()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslEpollEpollPWait001
     * @tc.number SUB_THIRDPARTY_MUSL_EPOLL_EPOLL_PWAIT_0100
     * @tc.desc   test epoll_pwait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslEpollEpollPWait001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.epoll_pwait()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslEpollEpollWait001
     * @tc.number SUB_THIRDPARTY_MUSL_EPOLL_EPOLL_WAIT_0100
     * @tc.desc   test epoll_wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslEpollEpollWait001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.epoll_wait()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslEtherEtherATon001
     * @tc.number SUB_THIRDPARTY_MUSL_ETHER_ETHER_ATON_0100
     * @tc.desc   test ether_aton
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslEtherEtherATon001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.ether_aton()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslEtherEtherATonR001
     * @tc.number SUB_THIRDPARTY_MUSL_ETHER_ETHER_ATON_R_0100
     * @tc.desc   test ether_aton_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslEtherEtherATonR001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.ether_aton_r()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslEtherEtherNToa001
     * @tc.number SUB_THIRDPARTY_MUSL_ETHER_ETHER_NTOA_0100
     * @tc.desc   test ether_ntoa
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslEtherEtherNToa001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.ether_ntoa()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslEtherEtherNToaR001
     * @tc.number SUB_THIRDPARTY_MUSL_ETHER_ETHER_NTOA_R_0100
     * @tc.desc   test ether_ntoa_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslEtherEtherNToaR001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.ether_ntoa_r()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslEventFdEventFd001
     * @tc.number SUB_THIRDPARTY_MUSL_EVENT_EVENTFD_0100
     * @tc.desc   test eventfd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testMuslEventFdEventFdRead001
     * @tc.number SUB_THIRDPARTY_MUSL_EVENT_EVENTFD_READ_0100
     * @tc.desc   test eventfd_read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslEventFdEventFdRead001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.eventfd_read()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslEventFdEventFdWrite001
     * @tc.number SUB_THIRDPARTY_MUSL_EVENT_EVENTFD_WRITE_0100
     * @tc.desc   test eventfd_write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslEventFdEventFdWrite001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.eventfd_write()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslXAttrFGetXAttr001
     * @tc.number SUB_THIRDPARTY_MUSL_XATTR_FGETXATTR_0100
     * @tc.desc   test fgetxattr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslXAttrFGetXAttr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.fgetxattr()).assertLarger(0);
      done()
    });

    /**
     * @tc.name   testMuslFileFlock001
     * @tc.number SUB_THIRDPARTY_MUSL_FILE_FLOCK_0100
     * @tc.desc   test flock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslFileFlock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.flock()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslStatUMaskChk001
     * @tc.number SUB_THIRDPARTY_MUSL_STAT_UMASK_CHK_0100
     * @tc.desc   test __umask_chk
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStatUMaskChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.__umask_chk()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslSocketSendToChk001
     * @tc.number SUB_THIRDPARTY_MUSL_SOCKET_SENDTO_CHK_0100
     * @tc.desc   test __sendto_chk
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSocketSendToChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.__sendto_chk()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslSocketSendChk001
     * @tc.number SUB_THIRDPARTY_MUSL_SOCKET_SEND_CHK_0100
     * @tc.desc   test __send_chk
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSocketSendChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.__send_chk()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslSocketRecVChk001
     * @tc.number SUB_THIRDPARTY_MUSL_SOCKET_RECV_CHK_0100
     * @tc.desc   test __recv_chk
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSocketRecVChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.__recv_chk()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslSocketRecVFromChk001
     * @tc.number SUB_THIRDPARTY_MUSL_SOCKET_RECVFROM_CHK_0100
     * @tc.desc   test __recvfrom_chk
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSocketRecVFromChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(otherstestndk.__recvfrom_chk()).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testMuslThreadsCndWait001
     * @tc.number SUB_THIRDPARTY_MUSL_THREADS_CND_WAIT_0100
     * @tc.desc   test cnd_wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslThreadsCndWait001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = otherstestndk.cndWait()
      expect(a).assertEqual(0);
      done()
    });


    /**
     * @tc.name   testCtypegetmbcurmax001
     * @tc.number SUB_THIRDPARTY_MUSL_OTHER_CTYPEGETMBCURMAX_0100
     * @tc.desc   test __ctype_get_mb_cur_max
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCtypegetmbcurmax001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.ctypegetmbcurmax();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testDuplocale001
     * @tc.number SUB_THIRDPARTY_MUSL_OTHER_DUPLOCALE_0100
     * @tc.desc   test __duplocale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDuplocale001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.duplocale();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testErrnolocation001
     * @tc.number SUB_THIRDPARTY_MUSL_OTHER_ERRNOLOCATION_0100
     * @tc.desc   test __errno_location
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrnolocation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.errnolocation();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testFltrounds001
     * @tc.number SUB_THIRDPARTY_MUSL_OTHER_FLTROUNDS_0100
     * @tc.desc   test __flt_rounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFltrounds001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.fltrounds();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testHerrnolocation001
     * @tc.number SUB_THIRDPARTY_MUSL_OTHER_HERRNOLOCATION_0100
     * @tc.desc   test __h_errno_location
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHerrnolocation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.herrnolocation();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testLibccurrentsigrtmax001
     * @tc.number SUB_THIRDPARTY_MUSL_OTHER_LIBCCURRENTSIGRTMAX_0100
     * @tc.desc   test __libc_current_sigrtmax
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLibccurrentsigrtmax001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.libccurrentsigrtmax();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testLibccurrentsigrtmin001
     * @tc.number SUB_THIRDPARTY_MUSL_OTHER_LIBCCURRENTSIGRTMIN_0100
     * @tc.desc   test __libc_current_sigrtmin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLibccurrentsigrtmin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.libccurrentsigrtmin();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOverflow001
     * @tc.number SUB_THIRDPARTY_MUSL_OTHER_OVERFLOW_0100
     * @tc.desc   test __overflow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testPthreadcleanuppush001
     * @tc.number SUB_THIRDPARTY_MUSL_OTHER_PTHREADCLEANUPPUSH_0100
     * @tc.desc   test _pthread_cleanup_push
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPthreadcleanuppush001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.pthreadcleanuppush();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testAccept001
     * @tc.number SUB_THIRDPARTY_MUSL_OTHER_ACCEPT_0100
     * @tc.desc   test accept
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAccept001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.accept();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testAccept4001
     * @tc.number SUB_THIRDPARTY_MUSL_OTHER_ACCEPT4_0100
     * @tc.desc   test accept4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAccept4001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.accept4();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testPthreadgettidnp001
     * @tc.number SUB_THIRDPARTY_MUSL_OTHER_PTHREADGETTIDNP_0100
     * @tc.desc   test pthread_gettid_np
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPthreadgettidnp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.pthreadgettidnp();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testQuickexit001
     * @tc.number SUB_THIRDPARTY_MUSL_OTHER_QUICKEXIT_0100
     * @tc.desc   test quick_exit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQuickexit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.quickexit();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOptreset001
     * @tc.number SUB_THIRDPARTY_MUSL_OTHER_OPTRESET_0100
     * @tc.desc   test optreset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptreset001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.optreset();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testGetfatalmessage001
     * @tc.number SUB_THIRDPARTY_MUSL_OTHER_GETFATALMESSAGE_0100
     * @tc.desc   test get_fatal_message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetfatalmessage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.getfatalmessage();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testPthreadcondclockwait001
     * @tc.number SUB_THIRDPARTY_MUSL_OTHER_PTHREADCONDCLOCKWAIT_0100
     * @tc.desc   test pthread_cond_clockwait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPthreadcondclockwait001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.pthreadcondclockwait();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testPthreadcondtimedwaitmonotonicnp001
     * @tc.number SUB_THIRDPARTY_MUSL_OTHER_PTHREADCONDTIMEDWAITMONOTONICNP_0100
     * @tc.desc   test pthread_cond_timedwait_monotonic_np
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPthreadcondtimedwaitmonotonicnp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.pthreadcondtimedwaitmonotonicnp();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testPthreadcondtimeoutnp001
     * @tc.number SUB_THIRDPARTY_MUSL_OTHER_PTHREADCONDTIMEOUTNP_0100
     * @tc.desc   test pthread_cond_timeout_np
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPthreadcondtimeoutnp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.pthreadcondtimeoutnp();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testPthreadgetnamenp001
     * @tc.number SUB_THIRDPARTY_MUSL_OTHER_PTHREADGETNAMENP_0100
     * @tc.desc   test pthread_getname_np
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPthreadgetnamenp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.pthreadgetnamenp();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testPthreadmutexlocktimeoutnp001
     * @tc.number SUB_THIRDPARTY_MUSL_OTHER_PTHREADMUTEXLOCKTIMEOUTNP_0100
     * @tc.desc   test pthread_mutex_lock_timeout_np
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPthreadmutexlocktimeoutnp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.pthreadmutexlocktimeoutnp();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testPthreadmutextimedlockmonotonicnp001
     * @tc.number SUB_THIRDPARTY_MUSL_OTHER_PTHREADMUTEXTIMEDLOCKMONOTONICNP_0100
     * @tc.desc   test pthread_mutex_timedlock_monotonic_np
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPthreadmutextimedlockmonotonicnp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.pthreadmutextimedlockmonotonicnp();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testPthreadmutexclocklock001
     * @tc.number SUB_THIRDPARTY_MUSL_OTHER_PTHREADMUTEXCLOCKLOCK_0100
     * @tc.desc   test pthread_mutex_clocklock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPthreadmutexclocklock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.pthreadmutexclocklock();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testPthreadrwlockclockrdlock001
     * @tc.number SUB_THIRDPARTY_MUSL_OTHER_PTHREADRWLOCKCLOCKRDLOCK_0100
     * @tc.desc   test pthread_rwlock_clockrdlock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPthreadrwlockclockrdlock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.pthreadrwlockclockrdlock();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testPthreadrwlockclockwrlock001
     * @tc.number SUB_THIRDPARTY_MUSL_OTHER_PTHREADRWLOCKCLOCKWRLOCK_0100
     * @tc.desc   test pthread_rwlock_clockwrlock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPthreadrwlockclockwrlock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.pthreadrwlockclockwrlock();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testPthreadrwlocktimedrdlockmonotonicnp001
     * @tc.number SUB_THIRDPARTY_MUSL_OTHER_PTHREADRWLOCKTIMEDRDLOCKMONOTONICNP_0100
     * @tc.desc   test pthread_rwlock_timedrdlock_monotonic_np
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPthreadrwlocktimedrdlockmonotonicnp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.pthreadrwlocktimedrdlockmonotonicnp();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testPthreadrwlocktimedwrlockmonotonicnp001
     * @tc.number SUB_THIRDPARTY_MUSL_OTHER_PTHREADRWLOCKTIMEDWRLOCKMONOTONICNP_0100
     * @tc.desc   test pthread_rwlock_timedwrlock_monotonic_np
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPthreadrwlocktimedwrlockmonotonicnp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.pthreadrwlocktimedwrlockmonotonicnp();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testSetapplicationtargetsdkversion001
     * @tc.number SUB_THIRDPARTY_MUSL_OTHER_SETAPPLICATIONTARGETSDKVERSION_0100
     * @tc.desc   test set_application_target_sdk_version
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetapplicationtargetsdkversion001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.setapplicationtargetsdkversion();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testSetfatalmessage001
     * @tc.number SUB_THIRDPARTY_MUSL_OTHER_SETFATALMESSAGE_0100
     * @tc.desc   test set_fatal_message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetfatalmessage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.setfatalmessage();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testPthreadcleanuppop001
     * @tc.number SUB_THIRDPARTY_MUSL_OTHER_PTHREADCLEANUPPOP_0100
     * @tc.desc   test _pthread_cleanup_pop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPthreadcleanuppop001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.pthreadcleanuppop();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testTlsgetaddr001
     * @tc.number SUB_THIRDPARTY_MUSL_OTHER_TLSGETADDR_0100
     * @tc.desc   test __tls_get_addr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTlsgetaddr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.tlsgetaddr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testDeletemodule001
     * @tc.number SUB_THIRDPARTY_MUSL_OTHER_DELETEMODULE_0100
     * @tc.desc   test delete_module
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeletemodule001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.delete_module();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testUflow001
     * @tc.number SUB_THIRDPARTY_MUSL_OTHER_UFLOW_0100
     * @tc.desc   test __uflow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUflow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = otherstestndk.uflow();
      expect(result).assertEqual(0);
      done();
    });
  });
}