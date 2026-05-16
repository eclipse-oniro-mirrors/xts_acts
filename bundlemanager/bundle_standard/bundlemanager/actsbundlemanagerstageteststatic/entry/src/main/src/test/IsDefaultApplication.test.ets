/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or impligetProfileByAbilityEmptyAbilityCalled.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import defaultAppManager from '@ohos.bundle.defaultAppManager';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为


let boolResult: boolean;
let type = defaultAppManager.ApplicationType.BROWSER;

export default function isDefaultApplicationTest() {

  describe("isDefaultApplicationTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   Sub_Bms_Framework_Status_DefaultApp_static_0900
     * @tc.number Sub_Bms_Framework_Status_DefaultApp_static_0900
     * @tc.desc   No default image application is set. Query and return false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Sub_Bms_Framework_Status_DefaultApp_static_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          defaultAppManager.isDefaultApplication(type, (err: BusinessError<void> | null, result: boolean | undefined) => {
            if (err !== null && err.code != null && err.code != 0) {
              hilog.error(0x0000, 'bmsTag', 'Sub_Bms_Framework_Status_DefaultApp_static_0900 failed: %{public}s',
                JSON.stringify(err));
              expect().assertFail();
              done()
            } else {
              hilog.info(0x0000, 'bmsTag', 'Sub_Bms_Framework_Status_DefaultApp_static_0900 success, boolean: ' + result);
              expect(result).assertFalse();
              done();
            }
          });
        } catch (err: BusinessError<void>) {
          hilog.error(0x0000, 'bmsTag', 'Sub_Bms_Framework_Status_DefaultApp_static_0900 failed: %{public}s', JSON.stringify(err));
          expect(err.code == 801).assertTrue()
          done();
        }

        try {
          let damp1 = defaultAppManager.isDefaultApplication(type);
          damp1.then((result: boolean): boolean => {
            hilog.info(0x0000, 'bmsTag', 'Sub_Bms_Framework_Status_DefaultApp_static_1000 success, boolean: ' + result);
            expect(result).assertFalse();
            done();
          }, (err: Error): void => {
            if (err.code != 0) {
              hilog.error(0x0000, 'bmsTag', 'Sub_Bms_Framework_Status_DefaultApp_static_1000 failed: %{public}s',
                JSON.stringify(err));
              expect().assertFail();
              done()
            }
          });
        } catch (err: BusinessError<void>) {
          hilog.error(0x0000, 'bmsTag', 'Sub_Bms_Framework_Status_DefaultApp_static_1000 failed: %{public}s', JSON.stringify(err));
          expect(err.code == 801).assertTrue()
          done();
        }
      })

    /**
     * @tc.name   Sub_Bms_Framework_Status_DefaultApp_static_2550
     * @tc.number Sub_Bms_Framework_Status_DefaultApp_static_2550
     * @tc.desc   The parameter type is correct, the string format is incorrect, return false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Sub_Bms_Framework_Status_DefaultApp_static_2550", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          boolResult = defaultAppManager.isDefaultApplicationSync(type);
          hilog.info(0x0000, 'bmsTag', 'Sub_Bms_Framework_Status_DefaultApp_2550 success, boolean: ' + boolResult);
          expect(boolResult).assertFalse();
          done();
        } catch (err: BusinessError<void>) {
          if (err.code != 0) {
            hilog.error(0x0000, 'bmsTag', 'Sub_Bms_Framework_Status_DefaultApp_2550 failed: %{public}s', JSON.stringify(err));
            expect(err.code == 801).assertTrue()
            done()
          }
        }
      })

    /**
     * @tc.name   Sub_Bms_Framework_Status_DefaultApp_static_1200
     * @tc.number Sub_Bms_Framework_Status_DefaultApp_static_1200
     * @tc.desc   ApplicationType is string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Sub_Bms_Framework_Status_DefaultApp_static_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        expect(typeof (defaultAppManager.ApplicationType.BROWSER)).assertEqual('string');
        expect(defaultAppManager.ApplicationType.BROWSER + '').assertEqual('Web Browser');

        expect(typeof (defaultAppManager.ApplicationType.IMAGE)).assertEqual('string');
        expect(defaultAppManager.ApplicationType.IMAGE + '').assertEqual('Image Gallery');

        expect(typeof (defaultAppManager.ApplicationType.AUDIO)).assertEqual('string');
        expect(defaultAppManager.ApplicationType.AUDIO + '').assertEqual('Audio Player');

        expect(typeof (defaultAppManager.ApplicationType.VIDEO)).assertEqual('string');
        expect(defaultAppManager.ApplicationType.VIDEO + '').assertEqual('Video Player');

        expect(typeof (defaultAppManager.ApplicationType.PDF)).assertEqual('string');
        expect(defaultAppManager.ApplicationType.PDF + '').assertEqual('PDF Viewer');

        expect(typeof (defaultAppManager.ApplicationType.WORD)).assertEqual('string');
        expect(defaultAppManager.ApplicationType.WORD + '').assertEqual('Word Viewer');

        expect(typeof (defaultAppManager.ApplicationType.EXCEL)).assertEqual('string');
        expect(defaultAppManager.ApplicationType.EXCEL + '').assertEqual('Excel Viewer');

        expect(typeof (defaultAppManager.ApplicationType.PPT)).assertEqual('string');
        expect(defaultAppManager.ApplicationType.PPT + '').assertEqual('PPT Viewer');

        expect(typeof (defaultAppManager.ApplicationType.EMAIL)).assertEqual('string');
        expect(defaultAppManager.ApplicationType.EMAIL + '').assertEqual('Email');
        done()
      })
  })
}