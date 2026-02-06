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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType} from '@ohos/hypium'
import ncAPI from 'libtestNetConnectNdk.so'
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
      console.info('beforealltest start');
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
     * @tc.number SUB_NetworkManager_Ping_ErrorCode401_0100
     * @tc.name testNetworkManagerPingErrorCode401_0100
     * @tc.desc Test Ping Error Code 401 of destination is null
     * @tc.level Level1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("testNetworkManagerPingErrorCode401_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkManagerPingErrorCode401_0100';
      console.info(`${caseName}---Start`);
      const pac: string = "www.example.com";
      try{
        let re: number = ncAPI.OHQueryProbeResult_destination_nullptr(pac)
        console.log(`${caseName} --test result is `, re);
        expect(re == 401).assertTrue();
        done();
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_NetworkManager_Ping_destination_int_0100
     * @tc.name testNetworkManagerPing_destination_int_0100
     * @tc.desc Test Ping destination is int
     * @tc.level Level1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("testNetworkManagerPing_destination_int_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkManagerPing_destination_int_0100';
      console.info(`${caseName}---Start`);
      const pac: number = 123;
      try{
        let re: number = ncAPI.OHQueryProbeResult_int(pac)
        console.log(`${caseName} --test result is `, re);
        expect(re == 0).assertTrue();
        done();
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

  });
}
