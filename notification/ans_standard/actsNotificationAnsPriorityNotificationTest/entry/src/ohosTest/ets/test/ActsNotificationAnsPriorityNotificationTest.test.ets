/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import { notificationManager } from '@kit.NotificationKit';

const bundleName = 'com.example.actsnotificationansprioritynotificationtest'

export default function actsnotificationansprioritynotificationtest() {
  describe('actsnotificationansprioritynotificationtest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_Notification_Ans_Priority_Notification_0100
     * @tc.number SUB_Notification_Ans_Priority_Notification_0100
     * @tc.desc   [setBundlePriorityConfig] When a third-party app invokes an interface, error 202 is reported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Priority_Notification_0100', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_Notification_Ans_Priority_Notification_0100';
      const bundleOption: notificationManager.BundleOption = { bundle: bundleName };
      try {
        await notificationManager.setBundlePriorityConfig(bundleOption, '小红')
          .then(() => {
            hilog.info(0x0000, 'testTag', `setBundlePriorityConfig success` + testNum);
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            hilog.error(0x0000, 'testTag', `setBundlePriorityConfig failed: ${err.code}, ${err.message},${testNum}`)
            if (err?.code == 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect(err?.code).assertEqual(202);
              expect(err?.message).assertEqual('Not system application to call the interface');
              done()
            }
          });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `setBundlePriorityConfig failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_Priority_Notification_0200
     * @tc.number SUB_Notification_Ans_Priority_Notification_0200
     * @tc.desc   [getBundlePriorityConfig] When a third-party application invokes the interface, error 202 is reported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Priority_Notification_0200', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_Notification_Ans_Priority_Notification_0200';
      const bundleName = 'com.example.actsnotificationansprioritynotificationtest'
      const bundleOption: notificationManager.BundleOption = { bundle: bundleName };
      try {
        await notificationManager.getBundlePriorityConfig(bundleOption)
          .then(() => {
            hilog.info(0x0000, 'testTag', `getBundlePriorityConfig success` + testNum);
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            hilog.error(0x0000, 'testTag', `getBundlePriorityConfig failed: ${err.code}, ${err.message},${testNum}`)
            if (err?.code == 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect(err?.code).assertEqual(202);
              expect(err?.message).assertEqual('Not system application to call the interface');
              done()
            }
          });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `getBundlePriorityConfig failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_Priority_Notification_0300
     * @tc.number SUB_Notification_Ans_Priority_Notification_0300
     * @tc.desc   [setPriorityEnabled] Error 202 Is Reported When a Third-Party App Invokes an API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Priority_Notification_0300', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_Notification_Ans_Priority_Notification_0300';
      try {
        await notificationManager.setPriorityEnabled(true)
          .then(() => {
            hilog.info(0x0000, 'testTag', `setPriorityEnabled success` + testNum);
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            hilog.error(0x0000, 'testTag', `setPriorityEnabled failed: ${err.code}, ${err.message},${testNum}`)
            if (err?.code == 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect(err?.code).assertEqual(202);
              expect(err?.message).assertEqual('Not system application to call the interface');
              done()
            }
          });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `setPriorityEnabled failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_Priority_Notification_0400
     * @tc.number SUB_Notification_Ans_Priority_Notification_0400
     * @tc.desc   [isPriorityEnabled] When a third-party application invokes an interface, error 202 is reported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Priority_Notification_0400', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_Notification_Ans_Priority_Notification_0400';
      try {
        await notificationManager.isPriorityEnabled()
          .then(() => {
            hilog.info(0x0000, 'testTag', `isPriorityEnabled success` + testNum);
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            hilog.error(0x0000, 'testTag', `isPriorityEnabled failed: ${err.code}, ${err.message},${testNum}`)
            if (err?.code == 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect(err?.code).assertEqual(202);
              expect(err?.message).assertEqual('Not system application to call the interface');
              done()
            }
          });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `isPriorityEnabled failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_Priority_Notification_0500
     * @tc.number SUB_Notification_Ans_Priority_Notification_0500
     * @tc.desc   [setPriorityEnabledByBundle] Error 202 Is Reported When a Third-Party Application Invokes an Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Priority_Notification_0500', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_Notification_Ans_Priority_Notification_0500';
      try {
        await notificationManager.setPriorityEnabledByBundle({ bundle: bundleName },
          notificationManager.PriorityEnableStatus.DISABLE)
          .then(() => {
            hilog.info(0x0000, 'testTag', `setPriorityEnabledByBundle success` + testNum);
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            hilog.error(0x0000, 'testTag', `setPriorityEnabledByBundle failed: ${err.code}, ${err.message},${testNum}`)
            if (err?.code == 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect(err?.code).assertEqual(202);
              expect(err?.message).assertEqual('Not system application to call the interface');
              done()
            }
          });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `setPriorityEnabledByBundle failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_Priority_Notification_0600
     * @tc.number SUB_Notification_Ans_Priority_Notification_0600
     * @tc.desc   [isPriorityEnabledByBundle] Error 202 Is Reported When a Third-Party Application Invokes an Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Priority_Notification_0600', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_Notification_Ans_Priority_Notification_0600';
      try {
        await notificationManager.isPriorityEnabledByBundle({ bundle: bundleName })
          .then(() => {
            hilog.info(0x0000, 'testTag', `isPriorityEnabledByBundle success` + testNum);
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            hilog.error(0x0000, 'testTag', `isPriorityEnabledByBundle failed: ${err.code}, ${err.message},${testNum}`)
            if (err?.code == 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect(err?.code).assertEqual(202);
              expect(err?.message).assertEqual('Not system application to call the interface');
              done()
            }
          });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `isPriorityEnabledByBundle failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_Priority_Notification_0700
     * @tc.number SUB_Notification_Ans_Priority_Notification_0700
     * @tc.desc   [setAdditionalConfig] When a third-party application invokes an interface, error 202 is reported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Priority_Notification_0700', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_Notification_Ans_Priority_Notification_0700';
      const value = '{"rules":[{"appAllowList":["com.example.actsnotificationansprioritynotificationtest"],"appDenyList":[],"id":502,"messageSource":0,"messageCategoryList":["IM"],"negativeKeywords":["地图","轿车"],"ruleLabelList":["ACCOUNT_ALERT"],"ruleName":"优先通知","ruleType":0,"textCondition":[["早报","晚报"],["晴","雨"]],"titleCondition":[["早报","晚报"],["晴","雨"]],"titleTextRelation":"and"}]}'
      try {
        await notificationManager.setAdditionalConfig('notificationRuleConfig',value)
          .then(() => {
            hilog.info(0x0000, 'testTag', `setAdditionalConfig success` + testNum);
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            hilog.error(0x0000, 'testTag', `setAdditionalConfig failed: ${err.code}, ${err.message},${testNum}`)
            if (err?.code == 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect(err?.code).assertEqual(202);
              expect(err?.message).assertEqual('Not system application to call the interface');
              done()
            }
          });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `setAdditionalConfig failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })
  })
}