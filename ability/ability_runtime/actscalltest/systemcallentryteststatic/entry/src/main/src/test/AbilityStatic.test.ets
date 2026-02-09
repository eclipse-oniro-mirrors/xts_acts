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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Caller } from '@ohos.app.ability.UIAbility';
import rpc from '@ohos.rpc';

let domain: int = 0x0000;
let tag: string = 'testTag';

class CustomParcelable implements rpc.Parcelable {
  marshalling(dataOut: rpc.MessageSequence) {
    return false;
  }

  unmarshalling(dataIn: rpc.MessageSequence) {
    return false;
  }
}

export default function AbilityStaticTest() {

  describe('AbilityStaticTest', (): void => {
    const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    const BUNDLE_NAME: string = 'com.example.systemcalltest.static';
    let caller: Caller;

    beforeAll(async () => {
      hilog.info(domain, tag, 'beforeAll start');
      hilog.info(domain, tag, 'beforeAll AbilityDelegator');
      abilityDelegator.executeShellCommand(`aa start -a EntryAbility -b ${BUNDLE_NAME}`);
      await Utils.msSleep(5000)
      caller = AppStorage.get<Caller>('Caller') as Caller;
      hilog.info(domain, tag, `beforeAll Caller: ${!!caller}`);
      hilog.info(domain, tag, 'beforeAll end');
    })

    /**
     * @tc.name   ACTS_CommonComponent_Call_Static_0100
     * @tc.number ACTS_CommonComponent_Call_Static_0100
     * @tc.desc   test release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_CommonComponent_Call_Static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const itName = 'ACTS_CommonComponent_Call_Static_0100';
      hilog.info(domain, tag, `${itName} start`);
      try {
        caller.release();
        done();
        hilog.info(domain, tag, `${itName} end`);
      } catch (e) {
        const err = e as BusinessError;
        hilog.info(domain, tag, `${itName} caller release fail error code: ${err?.code}, msg: ${err?.message}`);
        expect().assertFail();
        hilog.info(domain, tag, `${itName} end`);
      }
    })

    /**
     * @tc.name   ACTS_CommonComponent_Call_Static_0200
     * @tc.number ACTS_CommonComponent_Call_Static_0200
     * @tc.desc   test call 16200001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_CommonComponent_Call_Static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const itName = 'ACTS_CommonComponent_Call_Static_0200';
      hilog.info(domain, tag, `${itName} start`);
      const data = new CustomParcelable();
      caller.call('testCall', data).then(() => {
        hilog.info(domain, tag, `${itName} caller call success`);
        expect().assertFail();
      }).catch((e: Error) => {
        const err = e as BusinessError;
        hilog.info(domain, tag, `${itName} caller call fail error code: ${err?.code}, msg: ${err?.message}`);
        expect(`${err?.code}`).assertEqual('16200001');
        done();
        hilog.info(domain, tag, `${itName} end`);
      })
    })

    /**
     * @tc.name   ACTS_CommonComponent_Call_Static_0300
     * @tc.number ACTS_CommonComponent_Call_Static_0300
     * @tc.desc   test callWithResult 16200001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_CommonComponent_Call_Static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const itName = 'ACTS_CommonComponent_Call_Static_0300';
      hilog.info(domain, tag, `${itName} start`);
      const data = new CustomParcelable();
      caller.callWithResult('testCall', data).then((message: rpc.MessageSequence) => {
        hilog.info(domain, tag, `${itName} caller call success`);
        expect().assertFail();
      }).catch((e: Error) => {
        const err = e as BusinessError;
        hilog.info(domain, tag, `${itName} caller callWithResult fail error code: ${err?.code}, msg: ${err?.message}`);
        expect(`${err?.code}`).assertEqual('16200001');
        done();
        hilog.info(domain, tag, `${itName} end`);
      })
    })


    /**
     * @tc.name   ACTS_CommonComponent_Call_Static_0400
     * @tc.number ACTS_CommonComponent_Call_Static_0400
     * @tc.desc   test onRelease 16200001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_CommonComponent_Call_Static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const itName = 'ACTS_CommonComponent_Call_Static_0400';
      hilog.info(domain, tag, `${itName} start`);
      try {
        caller.onRelease((msg) => {});
        expect().assertFail();
        hilog.info(domain, tag, `${itName} end`);
      } catch (e) {
        const err = e as BusinessError;
        hilog.info(domain, tag, `${itName} caller onRelease fail error code: ${err?.code}, msg: ${err?.message}`);
        expect(`${err?.code}`).assertEqual('16200001');
        done();
        hilog.info(domain, tag, `${itName} end`);
      }
    })

    /**
     * @tc.name   ACTS_CommonComponent_Call_Static_0500
     * @tc.number ACTS_CommonComponent_Call_Static_0500
     * @tc.desc   test onRemoteStateChange 16200001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_CommonComponent_Call_Static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const itName = 'ACTS_CommonComponent_Call_Static_0500';
      hilog.info(domain, tag, `${itName} start`);
      try {
        caller.onRemoteStateChange((msg) => {});
        expect().assertFail();
        hilog.info(domain, tag, `${itName} end`);
      } catch (e) {
        const err = e as BusinessError;
        hilog.info(domain, tag, `${itName} caller onRemoteStateChange fail error code: ${err?.code}, msg: ${err?.message}`);
        expect(`${err?.code}`).assertEqual('16200001');
        done();
        hilog.info(domain, tag, `${itName} end`);
      }
    })

    /**
     * @tc.name   ACTS_CommonComponent_Call_Static_0600
     * @tc.number ACTS_CommonComponent_Call_Static_0600
     * @tc.desc   test on release 16200001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_CommonComponent_Call_Static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const itName = 'ACTS_CommonComponent_Call_Static_0600';
      hilog.info(domain, tag, `${itName} start`);
      try {
        caller.onRelease((msg) => {});
        expect().assertFail();
        hilog.info(domain, tag, `${itName} end`);
      } catch (e) {
        const err = e as BusinessError;
        hilog.info(domain, tag, `${itName} caller on release fail error code: ${err?.code}, msg: ${err?.message}`);
        expect(`${err?.code}`).assertEqual('16200001');
        done();
        hilog.info(domain, tag, `${itName} end`);
      }
    })

    /**
     * @tc.name   ACTS_CommonComponent_Call_Static_0700
     * @tc.number ACTS_CommonComponent_Call_Static_0700
     * @tc.desc   test off release with callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_CommonComponent_Call_Static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const itName = 'ACTS_CommonComponent_Call_Static_0700';
      hilog.info(domain, tag, `${itName} start`);
      try {
        caller.offRelease((msg) => {});
        done();
        hilog.info(domain, tag, `${itName} end`);
      } catch (e) {
        const err = e as BusinessError;
        hilog.info(domain, tag, `${itName} caller off release with callback fail error code: ${err?.code}, msg: ${err?.message}`);
        expect().assertFail();
        hilog.info(domain, tag, `${itName} end`);
      }
    })

    /**
     * @tc.name   ACTS_CommonComponent_Call_Static_0800
     * @tc.number ACTS_CommonComponent_Call_Static_0800
     * @tc.desc   test off release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_CommonComponent_Call_Static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const itName = 'ACTS_CommonComponent_Call_Static_0800';
      hilog.info(domain, tag, `${itName} start`);
      try {
        caller.offRelease();
        done();
        hilog.info(domain, tag, `${itName} end`);
      } catch (e) {
        const err = e as BusinessError;
        hilog.info(domain, tag, `${itName} caller off release fail error code: ${err?.code}, msg: ${err?.message}`);
        expect().assertFail();
        hilog.info(domain, tag, `${itName} end`);
      }
    })
  })
}
