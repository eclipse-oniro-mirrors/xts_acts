/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { describe, beforeAll, it, expect } from '@ohos/hypium'
import image from '@ohos.multimedia.image'

let ERROR_CODE = 202;
let context;
export default function abilityContextTest() {
  describe('abilityContextTest', function () {
    beforeAll(function () {
      context = globalThis.abilityContext;
    })

    /**
     * @tc.number: System_API_Test_AbilityContext_0100
     * @tc.name: callback form startAbilityWithAccount system interface interception test
     * @tc.desc:  Test third-party applications calling startAbilityWithAccount will be blocked
     * @tc.level   3
     */
    it('System_API_Test_AbilityContext_0100', 0, function (done) {
      let TAG = 'System_API_Test_AbilityContext_0100';
      let want = {
        abilityName: "aaa",
        bundleName: "bbb"
      }
      let account = 110;
      context.startAbilityWithAccount(want, account, (error) => {
        if (error.code) {
          console.log(TAG + " error: " + error.code + ", " + error.message);
          expect(error.code).assertEqual(ERROR_CODE);
          done();
        }
      })
    })

    /**
     * @tc.number: System_API_Test_AbilityContext_0200
     * @tc.name: Multi-parameter startAbilityWithAccount system interface interception test in the form of callback
     * @tc.desc:  Test third-party applications calling startAbilityWithAccount will be blocked
     * @tc.level   3
     */
    it('System_API_Test_AbilityContext_0200', 0, function (done) {
      let TAG = 'System_API_Test_AbilityContext_0200';
      let want = {
        abilityName: "aaa",
        bundleName: "bbb"
      }
      let account = 110;
      let options = {
        windowMode: 0
      };
      context.startAbilityWithAccount(want, account, options, (error) => {
        if (error.code) {
          console.log(TAG + " error: " + error.code + ", " + error.message);
          expect(error.code).assertEqual(ERROR_CODE);
          done();
        }
      })
    })

    /**
     * @tc.number: System_API_Test_AbilityContext_0300
     * @tc.name: The promise form startAbilityWithAccount system interface interception test
     * @tc.desc:  Test third-party applications calling startAbilityWithAccount will be blocked
     * @tc.level   3
     */
    it('System_API_Test_AbilityContext_0300', 0, function (done) {
      let TAG = 'System_API_Test_AbilityContext_0300';
      let want = {
        abilityName: "aaa",
        bundleName: "bbb"
      }
      let account = 110;
      context.startAbilityWithAccount(want, account)
        .then(() => { })
        .catch(error => {
          console.log(TAG + " error: " + error.code + ", " + error.message);
          expect(error.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_AbilityContext_0400
     * @tc.name: Multiple input arguments in the form of promise, startAbilityWithAccount system interface interception test
     * @tc.desc:  Test third-party applications calling startAbilityWithAccount will be blocked
     * @tc.level   3
     */
    it('System_API_Test_AbilityContext_0400', 0, function (done) {
      let TAG = 'System_API_Test_AbilityContext_0400';
      let want = {
        abilityName: "aaa",
        bundleName: "bbb"
      }
      let account = 110;
      let options = {
        windowMode: 0
      };
      context.startAbilityWithAccount(want, account, options)
        .then(() => { })
        .catch(error => {
          console.log(TAG + " error: " + error.code + ", " + error.message);
          expect(error.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_AbilityContext_0500
     * @tc.name: callback form startAbilityForResultWithAccount system interface interception test
     * @tc.desc:  Test the third-party application call startAbilityForResultWithAccount will be blocked
     * @tc.level   3
     */
    it('System_API_Test_AbilityContext_0500', 0, function (done) {
      let TAG = 'System_API_Test_AbilityContext_0500';
      let want = {
        abilityName: "aaa",
        bundleName: "bbb"
      }
      let account = 110;
      try {
        context.startAbilityForResultWithAccount(want, account, (error) => {

        })
      } catch (error) {
        console.log(TAG + " error: " + error.code + ", " + error.message);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_AbilityContext_0600
     * @tc.name: Multi-parameter startAbilityForResultWithAccount system interface interception test in the form of callback
     * @tc.desc:  Test the third-party application call startAbilityForResultWithAccount will be blocked
     * @tc.level   3
     */
    it('System_API_Test_AbilityContext_0600', 0, function (done) {
      let TAG = 'System_API_Test_AbilityContext_0600';
      let want = {
        abilityName: "aaa",
        bundleName: "bbb"
      }
      let account = 110;
      let options = {
        windowMode: 0
      };
      try {
        context.startAbilityForResultWithAccount(want, account, options, (error) => {

        })
      } catch (error) {
        console.log(TAG + " error: " + error.code + ", " + error.message);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_AbilityContext_0700
     * @tc.name: promise form startAbilityForResultWithAccount system interface interception test
     * @tc.desc:  Test the third-party application call startAbilityForResultWithAccount will be blocked
     * @tc.level   3
     */
    it('System_API_Test_AbilityContext_0700', 0, function (done) {
      let TAG = 'System_API_Test_AbilityContext_0700';
      let want = {
        abilityName: "aaa",
        bundleName: "bbb"
      }
      let account = 110;
      try {
        context.startAbilityForResultWithAccount(want, account)
          .then(() => { })
          .catch(error => {

          })
      } catch (error) {
        console.log(TAG + " error: " + error.code + ", " + error.message);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_AbilityContext_0800
     * @tc.name: Multi-parameter startAbilityForResultWithAccount system interface interception test in the form of promise
     * @tc.desc:  Test the third-party application call startAbilityForResultWithAccount will be blocked
     * @tc.level   3
     */
    it('System_API_Test_AbilityContext_0800', 0, function (done) {
      let TAG = 'System_API_Test_AbilityContext_0800';
      let want = {
        abilityName: "aaa",
        bundleName: "bbb"
      }
      let account = 110;
      let options = {
        windowMode: 0
      };
      try {
        context.startAbilityForResultWithAccount(want, account, options)
          .then(() => { })
          .catch(error => {

          })
      } catch (error) {
        console.log(TAG + " error: " + error.code + ", " + error.message);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_AbilityContext_0900
     * @tc.name: callback form startServiceExtensionAbility system interface interception test
     * @tc.desc:  Test the third-party application call startServiceExtensionAbility will be blocked
     * @tc.level   3
     */
    it('System_API_Test_AbilityContext_0900', 0, function (done) {
      let TAG = 'System_API_Test_AbilityContext_0900';
      let want = {
        abilityName: "aaa",
        bundleName: "bbb"
      }
      context.startServiceExtensionAbility(want, (error) => {
        if (error.code) {
          console.log(TAG + " error: " + error.code + ", " + error.message);
          expect(error.code).assertEqual(ERROR_CODE);
          done();
        }
      })
    })

    /**
     * @tc.number: System_API_Test_AbilityContext_1000
     * @tc.name: promise form startServiceExtensionAbility system interface interception test
     * @tc.desc:  Test the third-party application call startServiceExtensionAbility will be blocked
     * @tc.level   3
     */
    it('System_API_Test_AbilityContext_1000', 0, function (done) {
      let TAG = 'System_API_Test_AbilityContext_1000';
      let want = {
        abilityName: "aaa",
        bundleName: "bbb"
      }
      context.startServiceExtensionAbility(want)
        .then(() => { })
        .catch(error => {
          console.log(TAG + " error: " + error.code + ", " + error.message);
          expect(error.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_AbilityContext_1100
     * @tc.name: callback form startServiceExtensionAbilityWithAccount system interface interception test
     * @tc.desc:  Test the third-party application call startServiceExtensionAbilityWithAccount will be blocked
     * @tc.level   3
     */
    it('System_API_Test_AbilityContext_1100', 0, function (done) {
      let TAG = 'System_API_Test_AbilityContext_1100';
      let want = {
        abilityName: "aaa",
        bundleName: "bbb"
      }
      let account = 110;
      context.startServiceExtensionAbilityWithAccount(want, account, (error) => {
        if (error.code) {
          console.log(TAG + " error: " + error.code + ", " + error.message);
          expect(error.code).assertEqual(ERROR_CODE);
          done();
        }
      })
    })

    /**
     * @tc.number: System_API_Test_AbilityContext_1200
     * @tc.name: promise form startServiceExtensionAbilityWithAccount system interface interception test
     * @tc.desc:  Test the third-party application call startServiceExtensionAbilityWithAccount will be blocked
     * @tc.level   3
     */
    it('System_API_Test_AbilityContext_1200', 0, function (done) {
      let TAG = 'System_API_Test_AbilityContext_1200';
      let want = {
        abilityName: "aaa",
        bundleName: "bbb"
      }
      let account = 110;
      context.startServiceExtensionAbilityWithAccount(want, account)
        .then(() => { })
        .catch(error => {
          console.log(TAG + " error: " + error.code + ", " + error.message);
          expect(error.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_AbilityContext_1300
     * @tc.name: callback form stopServiceExtensionAbility system interface interception test
     * @tc.desc:  Test the third-party application call stopServiceExtensionAbility will be blocked
     * @tc.level   3
     */
    it('System_API_Test_AbilityContext_1300', 0, function (done) {
      let TAG = 'System_API_Test_AbilityContext_1300';
      let want = {
        abilityName: "aaa",
        bundleName: "bbb"
      }
      context.stopServiceExtensionAbility(want, (error) => {
        if (error.code) {
          console.log(TAG + " error: " + error.code + ", " + error.message);
          expect(error.code).assertEqual(ERROR_CODE);
          done();
        }
      })
    })

    /**
     * @tc.number: System_API_Test_AbilityContext_1400
     * @tc.name: promise form stopServiceExtensionAbility system interface interception test
     * @tc.desc:  Test the third-party application call stopServiceExtensionAbility will be blocked
     * @tc.level   3
     */
    it('System_API_Test_AbilityContext_1400', 0, function (done) {
      let TAG = 'System_API_Test_AbilityContext_1400';
      let want = {
        abilityName: "aaa",
        bundleName: "bbb"
      }
      context.stopServiceExtensionAbility(want)
        .then(() => { })
        .catch(error => {
          console.log(TAG + " error: " + error.code + ", " + error.message);
          expect(error.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_AbilityContext_1500
     * @tc.name: calback form stopServiceExtensionAbilityWithAccount system interface interception test
     * @tc.desc:  Test the third-party application call stopServiceExtensionAbilityWithAccount will be blocked
     * @tc.level   3
     */
    it('System_API_Test_AbilityContext_1500', 0, function (done) {
      let TAG = 'System_API_Test_AbilityContext_1500';
      let want = {
        abilityName: "aaa",
        bundleName: "bbb"
      }
      let account = 110;
      context.stopServiceExtensionAbilityWithAccount(want, account, (error) => {
        if (error.code) {
          console.log(TAG + " error: " + error.code + ", " + error.message);
          expect(error.code).assertEqual(ERROR_CODE);
          done();
        }
      })
    })

    /**
     * @tc.number: System_API_Test_AbilityContext_1600
     * @tc.name: promise form stopServiceExtensionAbilityWithAccount system interface interception test
     * @tc.desc:  Test the third-party application call stopServiceExtensionAbilityWithAccount will be blocked
     * @tc.level   3
     */
    it('System_API_Test_AbilityContext_1600', 0, function (done) {
      let TAG = 'System_API_Test_AbilityContext_1600';
      let want = {
        abilityName: "aaa",
        bundleName: "bbb"
      }
      let account = 110;
      context.stopServiceExtensionAbilityWithAccount(want, account)
        .then(() => { 
          expect().assertFail();
          done();
        })
        .catch(error => {
          console.log(TAG + " error: " + error.code + ", " + error.message);
          expect(error.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_AbilityContext_1700
     * @tc.name: promise form connectServiceExtensionAbilityWithAccount system interface interception test
     * @tc.desc:  Test the third-party application call connectServiceExtensionAbilityWithAccount will be blocked
     * @tc.level   3
     */
    it('System_API_Test_AbilityContext_1700', 0, function (done) {
      let TAG = 'System_API_Test_AbilityContext_1700';
      let want = {
        abilityName: "aaa",
        bundleName: "bbb"
      }
      let accountId = 110;
      let options = {
        onConnect(elementName, remote) { console.log('----------- onConnect -----------') },
        onDisconnect(elementName) { console.log('----------- onDisconnect -----------') },
        onFailed(code) {
          console.log(TAG + " error: " + code);
          expect(code).assertEqual(ERROR_CODE);
          done();
        }
      }

      try {
        context.connectServiceExtensionAbilityWithAccount(want, accountId, options);
      } catch (paramError) {
        console.log('error.code: ' + JSON.stringify(paramError.code) +
          ' error.message: ' + JSON.stringify(paramError.message));
      }
    })

    /**
     * @tc.number: System_API_Test_AbilityContext_1800
     * @tc.name: callback form setMissionIcon system interface interception test
     * @tc.desc:  Test the third-party application call setMissionIcon will be blocked
     * @tc.level   3
     */
    it('System_API_Test_AbilityContext_1800', 0, async function (done) {
      let TAG = 'System_API_Test_AbilityContext_1800';

      const color = new ArrayBuffer(96);
      let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } };
      image.createPixelMap(color, opts).then((pixelmap) => {
        console.log(TAG + ' Succeeded in creating pixelmap.');
        context.setMissionIcon(pixelmap, (error) => {
          console.log(TAG + ' ---------- setMissionIcon fail, err: -----------', error);
          if (error.code) {
            console.log(TAG + " error: " + error.code + ", " + error.message);
            expect(error.code).assertEqual(ERROR_CODE);
            done();
          }
        })
      }).catch(error => {
        console.log(TAG + ' Failed to create pixelmap.');
      })
    })

    /**
     * @tc.number: System_API_Test_AbilityContext_1900
     * @tc.name: promise form setMissionIcon system interface interception test
     * @tc.desc:  Test the third-party application call setMissionIcon will be blocked
     * @tc.level   3
     */
    it('System_API_Test_AbilityContext_1900', 0, function (done) {
      let TAG = 'System_API_Test_AbilityContext_1900';
      const color = new ArrayBuffer(96);
      let bufferArr = new Uint8Array(color);
      let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } };
      image.createPixelMap(color, opts).then((pixelmap) => {
        console.log(TAG + ' Succeeded in creating pixelmap.');
        context.setMissionIcon(pixelmap)
          .then(() => {
            console.log('-------------- setMissionIcon success -------------');
          })
          .catch((error) => {
            console.log(TAG + " error: " + error.code + ", " + error.message);
            expect(error.code).assertEqual(ERROR_CODE);
            done();
          });
      }).catch(error => {
        console.log(TAG + ' Failed to create pixelmap.');
      })
    })
  })
}