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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType} from '@ohos/hypium'
import ncAPI from 'libnetconnectionauthtest.so'
import { clickRequestPermission } from './ClickRequestPermission.test';

function sleep(delay : number) : Promise<number> {
  return new Promise(resovle => setTimeout(resovle, delay))
}

const ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(`exportFail failed err: ${JSON.stringify(err)}`);
  }
};

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(`exportTrue failed err: ${JSON.stringify(err)}`);
  }
};

export default function PingTraceRouteNDKTest() {

  describe('PingTraceRouteNDKTest', () => {

    beforeAll(async (done : Function) => {
      await clickRequestPermission("使用");
      console.info('beforealltest start');
      await sleep(3000);
      done()
    });
    beforeEach(() => {
      console.info('beforeEachtest start');
    });
    afterEach(() => {
      console.info('afterEachtest start');
    });
    afterAll(() => {
      console.info('afterAlltest start');
    });

    /**
     * @tc.name   testNetworkManagerTraceRoute_0100
     * @tc.number SUB_NetworkManager_TraceRoute_0100
     * @tc.desc   Test TraceRoute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkManagerTraceRoute_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      if (!canIUse("SystemCapability.Location.Location.Core")) {
        console.log("skipping test");
        done();
        return;
      }
      const caseName: string = 'testNetworkManagerTraceRoute_0100';
      console.info(`${caseName}---Start`);
      const pac: string = "www.baidu.com";
      try{
        let re: number = ncAPI.OHQueryTraceRoute(pac)
        console.log(`${caseName} --test result is `, re);
        ExpectTrue(re == 0);
        done();
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(false);
        done();
      }
    });

  });
}