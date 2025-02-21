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
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import StartOptions from '@ohos.app.ability.StartOptions';
import { BusinessError } from '@ohos.base';

let ERROR_CODE = 202;
let context: common.UIAbilityContext;

export default function abilityContextTest() {
  describe('abilityContextTest', () => {
    beforeAll(() => {
      context = globalThis.abilityContext;
    })

    /**
     * @tc.number: System_API_Test_AbilityContext_0100
     * @tc.name: callback form startAbilityWithAccount system interface interception test
     * @tc.desc: Test third-party applications calling startAbilityWithAccount will be blocked
     * @tc.level 3
     */
    it('System_API_Test_AbilityContext_0100', 0, (done: Function) => {
      let TAG = 'System_API_Test_AbilityContext_0100';
      let want: Want = {
        abilityName: "aaa",
        bundleName: "bbb"
      }
      let account: number = 110;
      context.startAbilityWithAccount(want, account, (error: BusinessError) => {
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
     * @tc.desc: Test third-party applications calling startAbilityWithAccount will be blocked
     * @tc.level 3
     */
    it('System_API_Test_AbilityContext_0200', 0, (done: Function) => {
      let TAG = 'System_API_Test_AbilityContext_0200';
      let want: Want = {
        abilityName: "aaa",
        bundleName: "bbb"
      }
      let account: number = 110;
      let options: StartOptions = {
        windowMode: 0
      };
      context.startAbilityWithAccount(want, account, options, (error: BusinessError) => {
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
     * @tc.desc: Test third-party applications calling startAbilityWithAccount will be blocked
     * @tc.level 3
     */
    it('System_API_Test_AbilityContext_0300', 0, (done: Function) => {
      let TAG = 'System_API_Test_AbilityContext_0300';
      let want: Want = {
        abilityName: "aaa",
        bundleName: "bbb"
      }
      let account: number = 110;
      context.startAbilityWithAccount(want, account)
        .then(() => {
        })
        .catch((error: BusinessError) => {
          console.log(TAG + " error: " + error.code + ", " + error.message);
          expect(error.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_AbilityContext_0400
     * @tc.name: Multiple input arguments in the form of promise, startAbilityWithAccount system interface interception test
     * @tc.desc: Test third-party applications calling startAbilityWithAccount will be blocked
     * @tc.level 3
     */
    it('System_API_Test_AbilityContext_0400', 0, (done: Function) => {
      let TAG = 'System_API_Test_AbilityContext_0400';
      let want: Want = {
        abilityName: "aaa",
        bundleName: "bbb"
      }
      let account: number = 110;
      let options: StartOptions = {
        windowMode: 0
      };
      context.startAbilityWithAccount(want, account, options)
        .then(() => {
        })
        .catch((error: BusinessError) => {
          console.log(TAG + " error: " + error.code + ", " + error.message);
          expect(error.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_AbilityContext_0500
     * @tc.name: callback form startAbilityForResultWithAccount system interface interception test
     * @tc.desc: Test the third-party application call startAbilityForResultWithAccount will be blocked
     * @tc.level 3
     */
    it('System_API_Test_AbilityContext_0500', 0, (done: Function) => {
      let TAG = 'System_API_Test_AbilityContext_0500';
      let want: Want = {
        abilityName: "aaa",
        bundleName: "bbb"
      }
      let account: number = 110;
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
     * @tc.desc: Test the third-party application call startAbilityForResultWithAccount will be blocked
     * @tc.level 3
     */
    it('System_API_Test_AbilityContext_0600', 0, (done: Function) => {
      let TAG = 'System_API_Test_AbilityContext_0600';
      let want: Want = {
        abilityName: "aaa",
        bundleName: "bbb"
      }
      let account: number = 110;
      let options: StartOptions = {
        windowMode: 0
      };
      try {
        context.startAbilityForResultWithAccount(want, account, options, (error: BusinessError) => {

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
     * @tc.desc: Test the third-party application call startAbilityForResultWithAccount will be blocked
     * @tc.level 3
     */
    it('System_API_Test_AbilityContext_0700', 0, (done: Function) => {
      let TAG = 'System_API_Test_AbilityContext_0700';
      let want: Want = {
        abilityName: "aaa",
        bundleName: "bbb"
      }
      let account: number = 110;
      try {
        context.startAbilityForResultWithAccount(want, account)
          .then(() => {
          })
          .catch((error: BusinessError) => {

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
     * @tc.desc: Test the third-party application call startAbilityForResultWithAccount will be blocked
     * @tc.level 3
     */
    it('System_API_Test_AbilityContext_0800', 0, (done: Function) => {
      let TAG = 'System_API_Test_AbilityContext_0800';
      let want: Want = {
        abilityName: "aaa",
        bundleName: "bbb"
      }
      let account: number = 110;
      let options: StartOptions = {
        windowMode: 0
      };
      try {
        context.startAbilityForResultWithAccount(want, account, options)
          .then(() => {
          })
          .catch((error: BusinessError) => {

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
     * @tc.desc: Test the third-party application call startServiceExtensionAbility will be blocked
     * @tc.level 3
     */
    it('System_API_Test_AbilityContext_0900', 0, (done: Function) => {
      let TAG = 'System_API_Test_AbilityContext_0900';
      let want: Want = {
        abilityName: "aaa",
        bundleName: "bbb"
      }
      context.startServiceExtensionAbility(want, (error: BusinessError) => {
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
     * @tc.desc: Test the third-party application call startServiceExtensionAbility will be blocked
     * @tc.level 3
     */
    it('System_API_Test_AbilityContext_1000', 0, (done: Function) => {
      let TAG = 'System_API_Test_AbilityContext_1000';
      let want: Want = {
        abilityName: "aaa",
        bundleName: "bbb"
      }
      context.startServiceExtensionAbility(want)
        .then(() => {
        })
        .catch((error: BusinessError) => {
          console.log(TAG + " error: " + error.code + ", " + error.message);
          expect(error.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_AbilityContext_1100
     * @tc.name: callback form startServiceExtensionAbilityWithAccount system interface interception test
     * @tc.desc: Test the third-party application call startServiceExtensionAbilityWithAccount will be blocked
     * @tc.level 3
     */
    it('System_API_Test_AbilityContext_1100', 0, (done: Function) => {
      let TAG = 'System_API_Test_AbilityContext_1100';
      let want: Want = {
        abilityName: "aaa",
        bundleName: "bbb"
      }
      let account: number = 110;
      context.startServiceExtensionAbilityWithAccount(want, account, (error: BusinessError) => {
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
     * @tc.desc: Test the third-party application call startServiceExtensionAbilityWithAccount will be blocked
     * @tc.level 3
     */
    it('System_API_Test_AbilityContext_1200', 0, (done: Function) => {
      let TAG = 'System_API_Test_AbilityContext_1200';
      let want: Want = {
        abilityName: "aaa",
        bundleName: "bbb"
      }
      let account: number = 110;
      context.startServiceExtensionAbilityWithAccount(want, account)
        .then(() => {
        })
        .catch((error: BusinessError) => {
          console.log(TAG + " error: " + error.code + ", " + error.message);
          expect(error.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_AbilityContext_1300
     * @tc.name: callback form stopServiceExtensionAbility system interface interception test
     * @tc.desc: Test the third-party application call stopServiceExtensionAbility will be blocked
     * @tc.level 3
     */
    it('System_API_Test_AbilityContext_1300', 0, (done: Function) => {
      let TAG = 'System_API_Test_AbilityContext_1300';
      let want: Want = {
        abilityName: "aaa",
        bundleName: "bbb"
      }
      context.stopServiceExtensionAbility(want, (error: BusinessError) => {
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
     * @tc.desc: Test the third-party application call stopServiceExtensionAbility will be blocked
     * @tc.level 3
     */
    it('System_API_Test_AbilityContext_1400', 0, (done: Function) => {
      let TAG = 'System_API_Test_AbilityContext_1400';
      let want: Want = {
        abilityName: "aaa",
        bundleName: "bbb"
      }
      context.stopServiceExtensionAbility(want)
        .then(() => {
        })
        .catch((error: BusinessError) => {
          console.log(TAG + " error: " + error.code + ", " + error.message);
          expect(error.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_AbilityContext_1500
     * @tc.name: calback form stopServiceExtensionAbilityWithAccount system interface interception test
     * @tc.desc: Test the third-party application call stopServiceExtensionAbilityWithAccount will be blocked
     * @tc.level 3
     */
    it('System_API_Test_AbilityContext_1500', 0, (done: Function) => {
      let TAG = 'System_API_Test_AbilityContext_1500';
      let want: Want = {
        abilityName: "aaa",
        bundleName: "bbb"
      }
      let account: number = 110;
      context.stopServiceExtensionAbilityWithAccount(want, account, (error: BusinessError) => {
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
     * @tc.desc: Test the third-party application call stopServiceExtensionAbilityWithAccount will be blocked
     * @tc.level 3
     */
    it('System_API_Test_AbilityContext_1600', 0, (done: Function) => {
      let TAG = 'System_API_Test_AbilityContext_1600';
      let want: Want = {
        abilityName: "aaa",
        bundleName: "bbb"
      }
      let account: number = 110;
      context.stopServiceExtensionAbilityWithAccount(want, account)
        .then(() => {
          expect().assertFail();
          done();
        })
        .catch((error: BusinessError) => {
          console.log(TAG + " error: " + error.code + ", " + error.message);
          expect(error.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_AbilityContext_1700
     * @tc.name: promise form connectServiceExtensionAbilityWithAccount system interface interception test
     * @tc.desc: Test the third-party application call connectServiceExtensionAbilityWithAccount will be blocked
     * @tc.level 3
     */
    it('System_API_Test_AbilityContext_1700', 0, (done: Function) => {
      let TAG = 'System_API_Test_AbilityContext_1700';
      let want: Want = {
        abilityName: "aaa",
        bundleName: "bbb"
      }
      let accountId: number = 110;
      let options = {
        onConnect(elementName, remote) {
          console.log('----------- onConnect -----------')
        },
        onDisconnect(elementName) {
          console.log('----------- onDisconnect -----------')
        },
        onFailed(code) {
          console.log(TAG + " error: " + code);
        }
      }

      try {
        context.connectServiceExtensionAbilityWithAccount(want, accountId, options);
      } catch (paramError) {
        console.log('error.code: ' + JSON.stringify(paramError.code) +
          ' error.message: ' + JSON.stringify(paramError.message));
        expect(paramError.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_AbilityContext_1800
     * @tc.name: callback form setMissionIcon system interface interception test
     * @tc.desc: Test the third-party application call setMissionIcon will be blocked
     * @tc.level 3
     */
    it('System_API_Test_AbilityContext_1800', 0, async (done: Function) => {
      let TAG = 'System_API_Test_AbilityContext_1800';

      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      };
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
      }).catch((error: BusinessError) => {
        console.log(TAG + ' Failed to create pixelmap.');
      })
    })

    /**
     * @tc.number: System_API_Test_AbilityContext_1900
     * @tc.name: promise form setMissionIcon system interface interception test
     * @tc.desc: Test the third-party application call setMissionIcon will be blocked
     * @tc.level 3
     */
    it('System_API_Test_AbilityContext_1900', 0, (done: Function) => {
      let TAG = 'System_API_Test_AbilityContext_1900';
      const color = new ArrayBuffer(96);
      let bufferArr = new Uint8Array(color);
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      };
      image.createPixelMap(color, opts).then((pixelmap) => {
        console.log(TAG + ' Succeeded in creating pixelmap.');
        context.setMissionIcon(pixelmap)
          .then(() => {
            console.log('-------------- setMissionIcon success -------------');
          })
          .catch((error: BusinessError) => {
            console.log(TAG + " error: " + error.code + ", " + error.message);
            expect(error.code).assertEqual(ERROR_CODE);
            done();
          });
      }).catch((error: BusinessError) => {
        console.log(TAG + ' Failed to create pixelmap.');
      })
    })
  })
}