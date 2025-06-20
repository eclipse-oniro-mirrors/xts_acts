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
import signal from 'libsignalndk.so'

export default function signalNdkTest() {

  describe('MuslSignalTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGHOLD_0100
     * @tc.name       : testMuslSignalSighold001
     * @tc.desc       : test sighold
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSighold001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.sighold(0,0);
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGHOLD_0200
     * @tc.name       : testMuslSignalSighold002
     * @tc.desc       : test sighold
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSighold002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.sighold(-1, 99999);
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGHOLD_0300
     * @tc.name       : testMuslSignalSighold003
     * @tc.desc       : test sighold
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSighold003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.sighold(-1, 0);
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGRELSE_0100
     * @tc.name       : testMuslSignalSigrelse001
     * @tc.desc       : test sigrelse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSigrelse001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.sigrelse(0,0);
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGRELSE_0200
     * @tc.name       : testMuslSignalSigrelse002
     * @tc.desc       : test sigrelse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSigrelse002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.sigrelse(-1, 99999);
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGRELSE_0300
     * @tc.name       : testMuslSignalSigrelse003
     * @tc.desc       : test sigrelse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSigrelse003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.sigrelse(-1, 0);
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGDELSET_0100
     * @tc.name       : testMuslSignalSigdelset001
     * @tc.desc       : test sigdelset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSigdelset001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.sigdelset(0,0);
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGDELSET_0200
     * @tc.name       : testMuslSignalSigdelset002
     * @tc.desc       : test sigdelset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSigdelset002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.sigdelset(-1, 99999);
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGDELSET_0300
     * @tc.name       : testMuslSignalSigdelset003
     * @tc.desc       : test sigdelset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSigdelset003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.sigdelset(-1, 0);
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGEMPTYSET_0100
     * @tc.name       : testMuslSignalSigemptyset001
     * @tc.desc       : test sigemptyset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSigemptyset001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.sigemptyset();
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGFILLSET_0100
     * @tc.name       : testMuslSignalSigfillset001
     * @tc.desc       : test sigfillset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSigfillset001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.sigfillset();
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGADDSET_0100
     * @tc.name       : testMuslSignalSigaddset001
     * @tc.desc       : test sigaddset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSigaddset001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.sigaddset(0,0);
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGADDSET_0200
     * @tc.name       : testMuslSignalSigaddset002
     * @tc.desc       : test sigaddset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSigaddset002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.sigaddset(-1, 99999);
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGADDSET_0300
     * @tc.name       : testMuslSignalSigaddset003
     * @tc.desc       : test SignalTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSigaddset003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.sigaddset(-1, 0);
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGACTION_0100
     * @tc.name       : testMuslSignalSigaction001
     * @tc.desc       : test SignalTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSigaction001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.sigaction(0,0);
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGACTION_0200
     * @tc.name       : testMuslSignalSigaction002
     * @tc.desc       : test SignalTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSigaction002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.sigaction(-1, 99999);
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGACTION_0300
     * @tc.name       : testMuslSignalSigaction003
     * @tc.desc       : test SignalTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSigaction003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.sigaction(-1, 0);
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGALTSTACK_0100
     * @tc.name       : testMuslSignalSigaltstack001
     * @tc.desc       : test SignalTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSigaltstack001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.sigaltstack(0);
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGALTSTACK_0200
     * @tc.name       : testMuslSignalSigaltstack002
     * @tc.desc       : test SignalTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSigaltstack002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.sigaltstack(-1);
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGIGNORE_0100
     * @tc.name       : testMuslSignalSigignore001
     * @tc.desc       : test SignalTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSigignore001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.sigignore(0,0);
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGIGNORE_0200
     * @tc.name       : testMuslSignalSigignore002
     * @tc.desc       : test SignalTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSigignore002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.sigignore(-1, 99999);
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGIGNORE_0300
     * @tc.name       : testMuslSignalSigignore003
     * @tc.desc       : test SignalTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSigignore003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.sigignore(-1, 0);
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGPAUSE_0100
     * @tc.name       : testMuslSignalSigpause001
     * @tc.desc       : test SignalTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSigpause001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.sigpause();
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGPENDING_0100
     * @tc.name       : testMuslSignalSigpending001
     * @tc.desc       : test sigpending
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSigpending001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.sigpending();
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGPROCMASK_0100
     * @tc.name       : testMuslSignalSigprocmask001
     * @tc.desc       : test sigprocmask
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSigprocmask001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.sigprocmask(0,0);
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGPROCMASK_0200
     * @tc.name       : testMuslSignalSigprocmask002
     * @tc.desc       : test sigprocmask
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSigprocmask002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.sigprocmask(-1, 99999);
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGPROCMASK_0300
     * @tc.name       : testMuslSignalSigprocmask003
     * @tc.desc       : test sigprocmask
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSignalSigprocmask003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.sigprocmask(-1, -1);
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGISMEMBER_0100
     * @tc.name       : testMuslSignalSigismember001
     * @tc.desc       : test sigismember
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSignalSigismember001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.sigismember(0,0);
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGISMEMBER_0200
     * @tc.name       : testMuslSignalSigismember002
     * @tc.desc       : test sigismember
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSignalSigismember002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.sigismember(-1, 99999);
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGWAIT_0100
     * @tc.name       : testMuslSignalSigwait001
     * @tc.desc       : test sigwait
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSignalSigwait001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.sigwait();
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGWAITINFO_0100
     * @tc.name       : testMuslSignalSigwaitinfo001
     * @tc.desc       : test sigwaitinfo
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSignalSigwaitinfo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.sigwaitinfo();
      expect(a).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGISMEMBER_0300
     * @tc.name       : testMuslSignalSigismember003
     * @tc.desc       : test sigismember
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSignalSigismember003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.sigismember(-1, 0);
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGISMEMBER_0400
     * @tc.name       : testMuslSignalSigismember004
     * @tc.desc       : test sigismember
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSignalSigismember004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.sigismember(1,0);
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGNAL_0100
     * @tc.name       : testMuslSignalSignal001
     * @tc.desc       : test signal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSignal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.signal();
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGNALFD_0100
     * @tc.name       : testMuslSignalSignalfd001
     * @tc.desc       : test signalfd
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSignalfd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.signalfd();
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGINTERRUPT_0100
     * @tc.name       : testMuslSignalSiginterrupt001
     * @tc.desc       : test siginterrupt
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSiginterrupt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.siginterrupt();
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGSET_0100
     * @tc.name       : testMuslSignalSigset001
     * @tc.desc       : test sigset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSignalSigset001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.sigset(0);
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGSET_0200
     * @tc.name       : testMuslSignalSigset002
     * @tc.desc       : test sigset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSignalSigset002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.sigset(1);
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGTIMEDWAIT_0100
     * @tc.name       : testMuslSignalSigtimedwait001
     * @tc.desc       : test sigtimedwait
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSigtimedwait001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.sigtimedwait();
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_SIGNAL_KILL_0100
     * @tc.name     : testMuslSignalKill001
     * @tc.desc     : test kill
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslSignalKill001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.kill();
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_SIGNAL_KILLPG_0100
     * @tc.name     : testMuslSignalKillpg001
     * @tc.desc     : test killpg
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslSignalKillpg001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.killpg();
      expect(a).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_PSIGNAL_0100
     * @tc.name       : testMuslSignalPsignal001
     * @tc.desc       : test psignal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalPsignal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = 10, b = "SIGUSR1";
      let data: number = signal.psignal(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_PSIGNAL_0200
     * @tc.name       : testMuslSignalPsignal002
     * @tc.desc       : test psignal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalPsignal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = 10, b = " ";
      let data: number = signal.psignal(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_PSIGNAL_0300
     * @tc.name       : testMuslSignalPsignal003
     * @tc.desc       : test psignal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalPsignal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = -1, b = " ";
      let data: number = signal.psignal(a, b);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_PSIGINFO_0100
     * @tc.name       : testMuslSignalPsiginfo001
     * @tc.desc       : test psigInfo
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalPsiginfo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = signal.pSigInfo();
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_SIGNAL_RAISE_0100
     * @tc.name     : testMuslSignalRaise001
     * @tc.desc     : test raise
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslSignalRaise001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = signal.raise();
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_BSD_SIGNAL_0100
     * @tc.name       : testMuslSignalBsdSignal001
     * @tc.desc       : test bsd_signal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalBsdSignal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number= signal.bsdSignal();
      expect(a).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGSUSPEND_0100
     * @tc.name       : testMuslSignalSigsuspend001
     * @tc.desc       : test sigsuspend
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSigsuspend001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number= signal.sigsuspend();
      expect(a).assertEqual(0);
      done();
    });
  })
}