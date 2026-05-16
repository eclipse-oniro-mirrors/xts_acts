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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium"
import { deviceAttest } from '@kit.BasicServicesKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { window } from '@kit.ArkUI';

export default function deviceAttestInfoAdditionalTest(context: Context, windowStage: window.WindowStage,
                                                      abilityStorage: LocalStorage) {
  describe('deviceAttestInfoAdditionalTest', () => {
    console.info('describe deviceAttestInfoAdditionalTest start!!!');
    beforeAll(() => {
      console.info('beforeAll');
    })
    beforeEach(() => {
      console.info('beforeEach');
    })
    afterEach(async (done: Function) => {
      console.info('afterEach');
      done();
    })
    afterAll(() => {
      console.info('afterAll');
    })

    /**
     * @tc.name   testGetAttestStatusError202Promise0100
     * @tc.number SUB_DEVICEATTEST_DEVICEATTEST_GETATTTESTSTATUS_ERROR_202_0100
     * @tc.desc   Test getAttestStatus permission verification failed (202) - Promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetAttestStatusError202Promise0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('test getAttestStatus permission verification failed (Promise) begin');
      try {
        deviceAttest.getAttestStatus().then((attestResultInfo: deviceAttest.AttestResultInfo) => {
          // For non-system app, this branch should not be reached
          console.info("!!!====>[AdditionalTest]1:data====>" + JSON.stringify(attestResultInfo));
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          // Expected: 202 error for non-system app (Permission verification failed)
          console.info("!!!====>[AdditionalTest]1:error====>" + JSON.stringify(err));
          expect(err.code).assertEqual(202);
          done();
        });
      } catch (err) {
        console.info("!!!====>[AdditionalTest]1:catch====>" + JSON.stringify(err));
        expect((err as BusinessError).code).assertEqual(202);
        done();
      }
    })

    /**
     * @tc.name   testGetAttestStatusError202Callback0200
     * @tc.number SUB_DEVICEATTEST_DEVICEATTEST_GETATTTESTSTATUS_ERROR_202_0200
     * @tc.desc   Test getAttestStatus permission verification failed (202) - callback mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetAttestStatusError202Callback0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('test getAttestStatus permission verification failed (Callback) begin');
      try {
        deviceAttest.getAttestStatus((err: BusinessError, attestResultInfo: deviceAttest.AttestResultInfo) => {
          if (err) {
            console.info("!!!====>[AdditionalTest]2:error====>" + JSON.stringify(err));
            // Expected: 202 error for non-system app (Permission verification failed)
            expect(err.code).assertEqual(202);
          } else {
            // For non-system app, this branch should not be reached
            console.info("!!!====>[AdditionalTest]2:data====>" + JSON.stringify(attestResultInfo));
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.info("!!!====>[AdditionalTest]2:catch====>" + JSON.stringify(err));
        expect((err as BusinessError).code).assertEqual(202);
        done();
      }
    })

    /**
     * @tc.name   testGetAttestStatusError202Sync0300
     * @tc.number SUB_DEVICEATTEST_DEVICEATTEST_GETATTTESTSTATUS_ERROR_202_0300
     * @tc.desc   Test getAttestStatusSync permission verification failed (202)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetAttestStatusError202Sync0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('test getAttestStatusSync permission verification failed begin');
      try {
        let attestResultInfo: deviceAttest.AttestResultInfo = deviceAttest.getAttestStatusSync();
        // For non-system app, this branch should not be reached
        console.info("!!!====>[AdditionalTest]3:data====>" + JSON.stringify(attestResultInfo));
        expect().assertFail();
        done();
      } catch (err) {
        console.info("!!!====>[AdditionalTest]3:error====>" + JSON.stringify(err));
        // Expected: 202 error for non-system app (Permission verification failed)
        expect((err as BusinessError).code).assertEqual(202);
        done();
      }
    })
  })
}
