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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level } from "@ohos/hypium"

import napitest from 'libnapitest.so'
import utils from '@arkts.utils';

export default function nativeApiSendableJsunit() {

  describe('napiSendableTest', () => {
    /**
     * run after testcase
     */
    afterEach(async () => {
      console.info('[napiSendableTest] after each called')
    });

    /**
     * @tc.name   napiSendableTest003
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0003
     * @tc.desc   aceNapiEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiSendableTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('napiSendableTest003 START');
      console.info(`napiSendableTest003 napitest:${napitest}`);
      let value: ESObject = napitest.NapiCreateSendableObject();
      expect(napitest.NapiIsSendable(value)).assertEqual(true);
      expect(value.x).assertEqual(true);
      done();
    });

    /**
     * @tc.name   napiSendableTest012
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0012
     * @tc.desc   aceNapiEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiSendableTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('napiSendableTest012 START');
      let lockName = "queryTestLock";
      let lock = utils.locks.AsyncLock.request(lockName);
      let p = lock.lockAsync(async () => {
        let states = utils.locks.AsyncLock.queryAll();
        expect(states.length != 0).assertTrue();
        let state = utils.locks.AsyncLock.query(lock.name);
        expect(state.pending.length == 0).assertTrue();
        expect(state.held.length == 1).assertTrue();
        expect(state.held[0].name == lockName);
        expect(state.held[0].mode == utils.locks.AsyncLockMode.EXCLUSIVE);
      })
      await Promise.all([p])
      done();
    });

    /**
     * @tc.name   napiSendableTest013
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0013
     * @tc.desc   aceNapiEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiSendableTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('napiSendableTest013 START');
      let lock = new utils.locks.AsyncLock;
      let s: utils.locks.AbortSignal<string> = { aborted: false, reason: "Aborted" };
      let options = new utils.locks.AsyncLockOptions<string>();
      options.isAvailable = false;
      options.signal = s;
      let p = lock.lockAsync(async () => {
        return;
      }, utils.locks.AsyncLockMode.EXCLUSIVE, options);
      s.aborted = true;
      let p0 = p.then(() => {
        expect(true).assertFalse();
      }, () => {
      })
      await Promise.all([p0])
      done();
    });

    /**
     * @tc.name   testStrongSendableRef0100
     * @tc.number SUB_NAPI_STRONG_SENDABLE_REF_0100
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStrongSendableRef0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "testStrongSendableRef0100";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitest.NapiCreateStrongSendableRef();
        console.info('testStrongSendableRef0100 value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStrongSendableRef0200
     * @tc.number SUB_NAPI_STRONG_SENDABLE_REF_0200
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStrongSendableRef0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "testStrongSendableRef0200";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitest.NapiGetStrongSendableRef();
        console.info('testStrongSendableRef0200 value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStrongSendableRef0300
     * @tc.number SUB_NAPI_STRONG_SENDABLE_REF_0300
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStrongSendableRef0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "testStrongSendableRef0300";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitest.NapiDelStrongSendableRef();
        console.info('testStrongSendableRef0300 value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });
  })
}
