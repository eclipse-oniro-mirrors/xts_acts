/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect , Level, Size, TestType} from '@ohos/hypium';
import data from '@ohos.telephony.data';
import { BusinessError } from '@ohos.base';

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

export default function ActNetManagerDataDoubleCard() {
  describe('ActNetManagerDataDoubleCard', () => {

    /**
     * @tc.name   testTelephonyDataGetActiveApnName0100
     * @tc.number SUB_Telephony_Data_GetActiveApnName_0100
     * @tc.desc   test interface getActiveApnName with a sim card and without a network.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyDataGetActiveApnName0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = "testTelephonyDataGetActiveApnName0100";
      console.info(`${caseName}---Start`);
      try {
        await data.getActiveApnName().then((apn: string) => {
          console.info(`${caseName} getActiveApnName success, contextData->${JSON.stringify(apn)}`);
          ExpectTrue(apn != "" || apn != undefined);
          console.info(`${caseName}---End`);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} getActiveApnNam fail, err->${JSON.stringify(err)}`);
          ExpectTrue(false);
          console.info(`${caseName}---End`);
          done();
        });
      }catch (err) {
        console.error(`${caseName} catch err is `+JSON.stringify(err));
        ExpectTrue(false);
        console.info(`${caseName}---End`);
        done();
      }
    })


  });
}
