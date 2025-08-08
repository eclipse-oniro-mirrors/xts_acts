/**
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "@ohos/hypium";
import socket from '@ohos.bluetooth.socket';
import hilog from '@ohos.hilog';

const PERMISSION_DENIED_CODE = 201
const PARAM_ERROR_CODE = 401
const OPERATION_FAILED_CODE = 2900099
const TAG: string = 'BtSocketTestTag';
const Domain: number = 0x0000;

export default function btSocketNopUiJsunit() {
  describe('btSocketNopUiJsunit', () => {

    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number: testSppListenNop
     * @tc.name: testSppListen
     * @tc.desc: test sppListen without permission
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it("testSppListenNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let sppOption: socket.SppOptions = {
          uuid: '00001810-0000-1000-8000-00805F9B34FB', secure: false, type: 0
        };
        let functionSppListen = async ()=>{
          return new Promise<number>((resolve,reject)=>{
            socket.sppListen('server1', sppOption, (error, number: number) => {
              if (error) {
                reject(error)
              } else {
                resolve(number);
              }
            });
          })
        }
        let number = await functionSppListen();
        hilog.info(Domain, TAG, `sppListen without permission ret = ${number}`);
        expect(true).assertFalse();
      }catch (error){
        hilog.error(Domain, TAG, `sppListen error, error code is: ${error.code}, error message is: ${error.message}`);
        expect(Number(error.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })
    /**
     * @tc.number: testSppSppConnectNop
     * @tc.name: testSppConnect
     * @tc.desc: test sppConnect without permission
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it("testSppSppConnectNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let sppOption: socket.SppOptions = {
          uuid: '00001810-0000-1000-8000-00805F9B34FB', secure: false, type: 0
        };
        let functionSppConnect = async ()=>{
          return new Promise<number>((resolve,reject)=>{
            socket.sppConnect('server1', sppOption, (error, number: number) => {
              if (error) {
                reject(error)
              } else {
                resolve(number);
              }
            });
          })
        }
        let number = await functionSppConnect();
        hilog.info(Domain, TAG, `sppConnect ${number}`);
        expect(true).assertFalse();
      }catch (error){
        hilog.error(Domain, TAG, `sppConnect error, error code is: ${error.code}, error message is: ${error.message}`);
        expect(Number(error.code)).assertEqual(OPERATION_FAILED_CODE);
      }
      done();
    })
  })
}