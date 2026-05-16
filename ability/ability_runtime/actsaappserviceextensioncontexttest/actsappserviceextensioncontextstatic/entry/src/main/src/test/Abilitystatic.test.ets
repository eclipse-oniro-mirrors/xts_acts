/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import commonEventManager from '@ohos.commonEventManager';
import rpc from '@ohos.rpc';
import common from '@ohos.app.ability.common';
import { BusinessError, RecordData } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { ElementName } from 'bundleManager.ElementName'

let DOMAIN: int = 0x0000;
let TAG: string = 'testTag';
const TEST_RESULT_KEY = 'result';
const TEST_SUITE_NAME: string = 'ActsAppServiceExtensionContextStaticTest';
const BUNDLE_NAME: string = 'com.acts.context.appserviceextension.static';
const BUNDLE_NAME_RELY: string = 'com.acts.context.aappserviceextensionrely.static';
const WAIT_TIME2000: int = 2000;
const ERROR_CODE_801: int = 801;
const ERROR_CODE_16000001: int = 16000001;
const ERROR_CODE_16000002: int = 16000002;
const ERROR_CODE_16000004: int = 16000004;
const ERROR_CODE_16000005: int = 16000005;
const ERROR_CODE_16000010: int = 16000010;
const ERROR_CODE_16000019: int = 16000019;
const ERROR_CODE_16000050: int = 16000050;
const ERROR_CODE_16000200: int = 16000200;

async function stopAppServiceExtAbility(want: Want, context: common.UIAbilityContext|null, testCaseName: string) {
  if (!context) {
    hilog.info(DOMAIN, TAG, `${testCaseName} context is null`);
    return;
   }
  try {
    await context.stopAppServiceExtensionAbility(want)
      .then(() => {
        hilog.info(DOMAIN, TAG, `${testCaseName} stopAppServiceExtensionAbility success`);
      })
      .catch((error: Error) => {
        let err = error as BusinessError;
        hilog.info(DOMAIN, TAG, `${testCaseName} stopAppServiceExtensionAbility failed, code is ${err.code}`);
      });
  } catch (error) {
    let err = error as BusinessError;
    hilog.info(DOMAIN, TAG, `${testCaseName} stopAppServiceExtensionAbility failed, code is ${err.code}`);
  }
}

export default function ActsAppServiceExtensionContextStaticTest() {
  describe('ActsAppServiceExtensionContextStaticTest', (): void => {
    let context: common.UIAbilityContext|null = null;
    beforeAll(async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#beforeAll start`);
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await Utils.msSleep(WAIT_TIME2000);
      abilityDelegator.executeShellCommand(`aa start -a EntryAbility -b ${BUNDLE_NAME}`);
      await Utils.msSleep(WAIT_TIME2000);
      context = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext;
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#beforeAll end`);
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_static_0400
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_static_0400
     * @tc.desc   UIAbilityContext startAppServiceExtensionAbility  expect 16000001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const tcNumber: string = 'SUB_AA_ABILITY_NewRule_AppServiceExtension_static_0400';
      hilog.info(DOMAIN, TAG, `${tcNumber} Begin`);
      let want: Want = {
        bundleName: "test1111",
        abilityName: 'AppServiceExtAbility'
      };
      context?.startAppServiceExtensionAbility(want).then((): void => {
        hilog.info(DOMAIN, TAG, `${tcNumber} startAppServiceExtensionAbility success`);
        expect().assertFail();
        done();
      }).catch((error: Error) => {
        let err = error as BusinessError;
        hilog.info(DOMAIN, TAG, `${tcNumber} startAppServiceExtensionAbility, code is ${err.code}`);
        let ret: boolean = err.code === ERROR_CODE_801 || err.code === ERROR_CODE_16000001;
        expect(ret).assertTrue();
        done();
      });
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1500
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1500
     * @tc.desc   UIAbilityContext startAppServiceExtensionAbility  expect 16000002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const tcNumber: string = 'SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1500';
      hilog.info(DOMAIN, TAG, `${tcNumber} Begin`);
      let want: Want = {
        bundleName: BUNDLE_NAME,
        abilityName: 'MyUIAbility'
      };
      context?.startAppServiceExtensionAbility(want).then((): void => {
        hilog.info(DOMAIN, TAG, `${tcNumber} startAppServiceExtensionAbility success`);
        expect().assertFail();
        done();
      }).catch((error: Error) => {
        let err = error as BusinessError;
        hilog.info(DOMAIN, TAG, `${tcNumber} startAppServiceExtensionAbility, code is ${err.code}`);
        let result: boolean = err.code === ERROR_CODE_801 || err.code === ERROR_CODE_16000002;
        expect(result).assertTrue();
        done();
      });
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1800
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1800
     * @tc.desc   UIAbilityContext startAppServiceExtensionAbility  expect 16000019
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const tcNumber: string = 'SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1800';
      hilog.info(DOMAIN, TAG, `${tcNumber} Begin`);
      let want: Want = {
        action: 'action',
        entities: ['entity'],
      }
      context?.startAppServiceExtensionAbility(want).then((): void => {
        hilog.info(DOMAIN, TAG, `${tcNumber} startAppServiceExtensionAbility success`);
        expect().assertFail();
        done();
      }).catch((error: Error) => {
        let err = error as BusinessError;
        hilog.info(DOMAIN, TAG, `${tcNumber} startAppServiceExtensionAbility, code is ${err.code}`);
        let result: boolean = err.code === ERROR_CODE_801 || err.code === ERROR_CODE_16000019;
        expect(result).assertTrue();
        done();
      });
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1600
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1600
     * @tc.desc   UIAbilityContext startAppServiceExtensionAbility  expect 16000050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const tcNumber: string = 'SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1600';
      hilog.info(DOMAIN, TAG, `${tcNumber} Begin`);
      let parameters = {
        'keyFd': { 'type': 'FD', 'value': -1
        } as Record<string, RecordData>
      } as Record<string, RecordData>
      let want: Want = {
        bundleName: BUNDLE_NAME,
        abilityName: 'AppServiceExtAbility',
        parameters:parameters
      };
      context?.startAppServiceExtensionAbility(want).then((): void => {
        hilog.info(DOMAIN, TAG, `${tcNumber} startAppServiceExtensionAbility success`);
        expect().assertFail();
        done();
      }).catch((error: Error) => {
        let err = error as BusinessError;
        hilog.info(DOMAIN, TAG, `${tcNumber} startAppServiceExtensionAbility, code is ${err.code}`);
        let result: boolean = err.code === ERROR_CODE_801 || err.code === ERROR_CODE_16000050;
        expect(result).assertTrue();
        done();
      });
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1400
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1400
     * @tc.desc   UIAbilityContext startAppServiceExtensionAbility  expect 16000200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const tcNumber: string = 'SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1400';
      hilog.info(DOMAIN, TAG, `${tcNumber} Begin`);
      let want: Want = {
        bundleName: BUNDLE_NAME_RELY,
        abilityName: 'AppServiceExtAbility2',
      };
      context?.startAppServiceExtensionAbility(want).then((): void => {
        hilog.info(DOMAIN, TAG, `${tcNumber} startAppServiceExtensionAbility success`);
        expect().assertFail();
        done();
      }).catch((error: Error) => {
        let err = error as BusinessError;
        hilog.info(DOMAIN, TAG, `${tcNumber} startAppServiceExtensionAbility, code is ${err.code}`);
        let result: boolean = err.code === ERROR_CODE_801 || err.code === ERROR_CODE_16000200;
        expect(result).assertTrue();
        done();      
      });
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1700
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1700
     * @tc.desc   UIAbilityContext startAppServiceExtensionAbility  expect 16000005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const tcNumber: string = 'SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1700';
      hilog.info(DOMAIN, TAG, `${tcNumber} Begin`);
      let want: Want = {
        bundleName: BUNDLE_NAME_RELY,
        abilityName: 'AppServiceExtAbility3',
      };
      context?.startAppServiceExtensionAbility(want).then((): void => {
        hilog.info(DOMAIN, TAG, `${tcNumber} startAppServiceExtensionAbility success`);
        expect().assertFail();
        done();
      }).catch((error: Error) => {
        let err = error as BusinessError;
        hilog.info(DOMAIN, TAG, `${tcNumber} startAppServiceExtensionAbility, code is ${err.code}`);
        let result: boolean = err.code === ERROR_CODE_801 || err.code === ERROR_CODE_16000005;
        expect(result).assertTrue();
        done();
      });
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_static_0900
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_static_0900
     * @tc.desc   UIAbilityContext stopAppServiceExtensionAbility  expect 16000001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const tcNumber: string = 'SUB_AA_ABILITY_NewRule_AppServiceExtension_static_0900';
      hilog.info(DOMAIN, TAG, `${tcNumber} Begin`);
      let want: Want = {
        bundleName: "test1111",
        abilityName: 'AppServiceExtAbility'
      };
      context?.stopAppServiceExtensionAbility(want).then((): void => {
        hilog.info(DOMAIN, TAG, `${tcNumber} stopAppServiceExtensionAbility success`);
        expect().assertFail();
        done();
      }).catch((error: Error) => {
        let err = error as BusinessError;
        hilog.info(DOMAIN, TAG, `${tcNumber} stopAppServiceExtensionAbility, code is ${err.code}`);
        let result: boolean = err.code === ERROR_CODE_801 || err.code === ERROR_CODE_16000001;
        expect(result).assertTrue();
        done();       
      });
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2800
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2800
     * @tc.desc   UIAbilityContext stopAppServiceExtensionAbility  expect 16000002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const tcNumber: string = 'SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2800';
      hilog.info(DOMAIN, TAG, `${tcNumber} Begin`);
      let want: Want = {
        bundleName: BUNDLE_NAME,
        abilityName: 'MyUIAbility'
      };
      context?.stopAppServiceExtensionAbility(want).then((): void => {
        hilog.info(DOMAIN, TAG, `${tcNumber} stopAppServiceExtensionAbility success`);
        expect().assertFail();
        done();
      }).catch((error: Error) => {
        let err = error as BusinessError;
        hilog.info(DOMAIN, TAG, `${tcNumber} stopAppServiceExtensionAbility, code is ${err.code}`);
        let result: boolean = err.code === ERROR_CODE_801 || err.code === ERROR_CODE_16000002;
        expect(result).assertTrue();
        done();
      });
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_static_3000
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_static_3000
     * @tc.desc   UIAbilityContext stopAppServiceExtensionAbility 16000005.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const tcNumber: string = 'SUB_AA_ABILITY_NewRule_AppServiceExtension_static_3000';
      hilog.info(DOMAIN, TAG, `${tcNumber} Begin`);
      let want: Want = {
        bundleName: BUNDLE_NAME_RELY,
        abilityName: 'AppServiceExtAbility3',
      };
      context?.stopAppServiceExtensionAbility(want).then((): void => {
        hilog.info(DOMAIN, TAG, `${tcNumber} stopAppServiceExtensionAbility success`);
        expect().assertFail();
        done();
      }).catch((error: Error) => {
        let err = error as BusinessError;
        hilog.info(DOMAIN, TAG, `${tcNumber} stopAppServiceExtensionAbility, code is ${err.code}`);
        let result: boolean = err.code === ERROR_CODE_801 || err.code === ERROR_CODE_16000005;
        expect(result).assertTrue();
        done();
      });
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2900
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2900
     * @tc.desc   UIAbilityContext stopAppServiceExtensionAbility 16000050.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const tcNumber: string = 'SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2900';
      hilog.info(DOMAIN, TAG, `${tcNumber} Begin`);
      let parameters = {
        'keyFd': { 'type': 'FD', 'value': -1 } as Record<string, RecordData>
      } as Record<string, RecordData>
      let want: Want = {
        bundleName: BUNDLE_NAME,
        abilityName: 'AppServiceExtAbility',
        parameters:parameters
      };
      context?.stopAppServiceExtensionAbility(want).then((): void => {
        hilog.info(DOMAIN, TAG, `${tcNumber} stopAppServiceExtensionAbility success`);
        expect().assertFail();
        done();
      }).catch((error: Error) => {
        let err = error as BusinessError;
        hilog.info(DOMAIN, TAG, `stopAppServiceExtensionAbility, code is ${err.code}`);
        let result: boolean = err.code === ERROR_CODE_801 || err.code === ERROR_CODE_16000050;
        expect(result).assertTrue();
        done();
      });
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2700
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2700
     * @tc.desc   UIAbilityContext stopAppServiceExtensionAbility 16000200.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const tcNumber: string = 'SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2700';
      hilog.info(DOMAIN, TAG, `${tcNumber} Begin`);
      let want: Want = {
        bundleName: BUNDLE_NAME_RELY,
        abilityName: 'AppServiceExtAbility2',
      };
      context?.stopAppServiceExtensionAbility(want).then((): void => {
        hilog.info(DOMAIN, TAG, `${tcNumber} stopAppServiceExtensionAbility success`);
        expect().assertFail();
        done();
      }).catch((error: Error) => {
        let err = error as BusinessError;
        hilog.info(DOMAIN, TAG, `${tcNumber} stopAppServiceExtensionAbility, code is ${err.code}`);
        let result: boolean = err.code === ERROR_CODE_801 || err.code === ERROR_CODE_16000200;
        expect(result).assertTrue();
        done();
      });
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_static_0200
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_static_0200
     * @tc.desc   UIAbilityContext connectAppServiceExtensionAbility  expect 16000001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const tcNumber: string = 'SUB_AA_ABILITY_NewRule_AppServiceExtension_static_0200';
      let connectId: Long|undefined = 0;
      hilog.info(DOMAIN, TAG, `${tcNumber} Begin`);
      let want: Want = {
        bundleName: "test1111",
        abilityName: 'AppServiceExtAbility'
      };
      connectId = context?.connectAppServiceExtensionAbility(want, {
        onConnect: (elementName: ElementName |  null,
          remote: rpc.IRemoteObject) => {
          hilog.info(DOMAIN, TAG, `${tcNumber} ConnectOptions onConnect`);
          expect().assertFail();
          done();
        },
        onDisconnect: (elementName: ElementName | null ) => {
          hilog.info(DOMAIN, TAG, `${tcNumber} ConnectOptions onDisconnect`);
          expect().assertFail();
          done();
        },
        onFailed: (code: int) => {
          hilog.info(DOMAIN, TAG, `${tcNumber} ConnectOptions onFailed, code is ` + code);
          let result: boolean = code === ERROR_CODE_801 || code === ERROR_CODE_16000001;
          expect(result).assertTrue();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1200
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1200
     * @tc.desc   UIAbilityContext connectAppServiceExtensionAbility 16000002.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const tcNumber: string = 'SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1200';
      hilog.info(DOMAIN, TAG, `${tcNumber} Begin`);
      let want: Want = {
        bundleName: BUNDLE_NAME,
        abilityName: 'MyUIAbility2'
      };

      try {
        let connectId: Long|undefined = context?.connectAppServiceExtensionAbility(want, {
          onConnect: (elementName: ElementName |  null,
            remote: rpc.IRemoteObject) => {
            hilog.info(DOMAIN, TAG, `${tcNumber} ConnectOptions onConnect`);
            expect().assertFail();
            done();
          },
          onDisconnect: (elementName: ElementName | null ) => {
            hilog.info(DOMAIN, TAG, `${tcNumber} ConnectOptions onDisconnect`);
            expect().assertFail();
            done();
          },
          onFailed: (code: int) => {
            hilog.info(DOMAIN, TAG, `${tcNumber} ConnectOptions onFailed, code is ` + code);
            let result: boolean = code === ERROR_CODE_801 || code === ERROR_CODE_16000002;
            expect(result).assertTrue();
            done();
          }
        })
        hilog.info(DOMAIN, TAG, `connectAppServiceExtensionAbility result: ${connectId}`);
        expect(connectId).assertEqual(-1);
        done();
      } catch (err) {
        hilog.info(DOMAIN, TAG, `connectAppServiceExtensionAbility failed: ${(err as BusinessError).code}`);
        expect().assertFail();
        done();
      }      
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1100
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1100
     * @tc.desc   UIAbilityContext connectAppServiceExtensionAbility 16000004.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const tcNumber: string = 'SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1100';
      let connectId: Long|undefined = 0;
      hilog.info(DOMAIN, TAG, `${tcNumber} Begin`);
      let want: Want = {
        bundleName: BUNDLE_NAME_RELY,
        abilityName: 'AppServiceExtAbility',
      };
      let want1: Want = {
        bundleName: BUNDLE_NAME_RELY,
        abilityName: 'MainAbility',
        parameters: {
          'caseTag': tcNumber
        } as Record<string, RecordData>
      };
      context?.startAbility(want1).then(() => {
        hilog.info(DOMAIN, TAG, `${tcNumber} startAbility success`);
      }).catch((error: Error) => {
        let err = error as BusinessError;
        hilog.info(DOMAIN, TAG, `${tcNumber} startAbility, code is ${err.code}`);
      });
      connectId = context?.connectAppServiceExtensionAbility(want, {
        onConnect: (elementName: ElementName |  null,
          remote: rpc.IRemoteObject) => {
          hilog.info(DOMAIN, TAG, `${tcNumber} ConnectOptions onConnect`);
          expect().assertFail();
          done();
        },
        onDisconnect: (elementName: ElementName | null ) => {
          hilog.info(DOMAIN, TAG, `${tcNumber} ConnectOptions onDisconnect`);
          expect().assertFail();
          done();
        },
        onFailed: (code: int) => {
          hilog.info(DOMAIN, TAG, `${tcNumber} ConnectOptions onFailed, code is ` + code);
          let result: boolean = code === ERROR_CODE_801 || code === ERROR_CODE_16000004;
          expect(result).assertTrue();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1000
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1000
     * @tc.desc   UIAbilityContext connectAppServiceExtensionAbility 16000005.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const tcNumber: string = 'SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1000';
      let connectId: Long|undefined = 0;
      hilog.info(DOMAIN, TAG, `${tcNumber} Begin`);
      let want: Want = {
        bundleName: BUNDLE_NAME_RELY,
        abilityName: 'AppServiceExtAbility3',
      };
      connectId = context?.connectAppServiceExtensionAbility(want, {
        onConnect: (elementName: ElementName |  null,
          remote: rpc.IRemoteObject) => {
          hilog.info(DOMAIN, TAG, `${tcNumber} ConnectOptions onConnect`);
          expect().assertFail();
          done();
        },
        onDisconnect: (elementName: ElementName | null ) => {
          hilog.info(DOMAIN, TAG, `${tcNumber} ConnectOptions onDisconnect`);
          expect().assertFail();
          done();
        },
        onFailed: (code: int) => {
          hilog.info(DOMAIN, TAG, `${tcNumber} ConnectOptions onFailed, code is ` + code);
          let result: boolean = code === ERROR_CODE_801 || code === ERROR_CODE_16000005;
          expect(result).assertTrue();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1300
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1300
     * @tc.desc   UIAbilityContext connectAppServiceExtensionAbility 16000050.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const tcNumber: string = 'SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1300';
      let connectId: Long|undefined = 0;
      hilog.info(DOMAIN, TAG, `${tcNumber} Begin`);
      let parameters = {
        'keyFd': { 'type': 'FD', 'value': -1 } as Record<string, RecordData>
      } as Record<string, RecordData>
      let want: Want = {
        bundleName: BUNDLE_NAME,
        abilityName: 'AppServiceExtAbility',
        parameters:parameters
      };
      connectId = context?.connectAppServiceExtensionAbility(want, {
        onConnect: (elementName: ElementName |  null,
          remote: rpc.IRemoteObject) => {
          hilog.info(DOMAIN, TAG, `${tcNumber} ConnectOptions onConnect`);
          expect().assertFail();
          done();
        },
        onDisconnect: (elementName: ElementName | null ) => {
          hilog.info(DOMAIN, TAG, `${tcNumber} ConnectOptions onDisconnect`);
          expect().assertFail();
          done();
        },
        onFailed: (code: int) => {
          hilog.info(DOMAIN, TAG, `${tcNumber} ConnectOptions onFailed, code is ` + code);
          let result: boolean = code === ERROR_CODE_801 || code === ERROR_CODE_16000050;
          expect(result).assertTrue();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_static_0500
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_static_0500
     * @tc.desc   UIAbilityContext disconnectAppServiceExtensionAbility  expect 16000050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const tcNumber: string = 'SUB_AA_ABILITY_NewRule_AppServiceExtension_static_0500';
      hilog.info(DOMAIN, TAG, `${tcNumber} Begin`);
      context?.disconnectAppServiceExtensionAbility(-1).then((): void => {
        hilog.info(DOMAIN, TAG, `${tcNumber} disconnectAppServiceExtensionAbility success`);
        expect().assertFail();
        done();
      }).catch((error: Error) => {
        let err = error as BusinessError;
        hilog.info(DOMAIN, TAG, `${tcNumber}disconnectAppServiceExtensionAbility, code is ${err.code}`);
        let result: boolean = err.code === ERROR_CODE_801 || err.code === ERROR_CODE_16000050;
        expect(result).assertTrue();
        done();      
      });
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_static_0700
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_static_0700
     * @tc.desc   AppServiceExtensionContext connectServiceExtensionAbility  expect 16000001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const tcNumber: string = 'SUB_AA_ABILITY_NewRule_AppServiceExtension_static_0700';
      hilog.info(DOMAIN, TAG, `${tcNumber} Begin`);
      let want: Want = {
        deviceId: '',
        bundleName: BUNDLE_NAME,
        abilityName: 'AppServiceExtAbility',
        parameters:{
          'caseTag': tcNumber
        } as Record<string, RecordData>
      };

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [tcNumber]
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        hilog.info(DOMAIN, TAG, `${tcNumber} createSubscriber success`);
        commonEventManager.subscribe(subscriber, (err: BusinessError<void>|null,
          eventData: commonEventManager.CommonEventData|undefined) => {
          hilog.info(DOMAIN, TAG, `${tcNumber} subscribe callback result: ${err?.code}`);
          let result: int = 0;
          if (eventData?.parameters?.[TEST_RESULT_KEY]) {
            result = eventData?.parameters?.[TEST_RESULT_KEY] as int;
          }
          hilog.info(DOMAIN, TAG, `${tcNumber} subscribeCB result:` + result);
          expect(result).assertEqual(ERROR_CODE_16000001);
          stopAppServiceExtAbility(want, context, tcNumber);
          commonEventManager.unsubscribe(subscriber, (err, data) => {
            done();
          });
        });
        try {
          context?.startAppServiceExtensionAbility(want).then(() => {
            hilog.info(DOMAIN, TAG, `${tcNumber} startAppServiceExtensionAbility success`);
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(DOMAIN, TAG, `${tcNumber} startAppServiceExtensionAbility, code is ${err.code}`);
            if (err.code !== ERROR_CODE_801) {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(DOMAIN, TAG, `${tcNumber} startAppServiceExtensionAbility failed: ${(err as BusinessError).code}`);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_static_3200
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_static_3200
     * @tc.desc   AppServiceExtensionContext connectServiceExtensionAbility  expect 16000002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const tcNumber: string = 'SUB_AA_ABILITY_NewRule_AppServiceExtension_static_3200';
      hilog.info(DOMAIN, TAG, `${tcNumber} Begin`);
      let want: Want = {
        deviceId: '',
        bundleName: BUNDLE_NAME,
        abilityName: 'AppServiceExtAbility',
        parameters:{
          'caseTag': tcNumber
        } as Record<string, RecordData>
      };

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [tcNumber]
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        hilog.info(DOMAIN, TAG, `${tcNumber}  createSubscriber success`);
        commonEventManager.subscribe(subscriber, (err: BusinessError<void>|null,
          eventData: commonEventManager.CommonEventData|undefined) => {
          hilog.info(DOMAIN, TAG, `${tcNumber}  subscribe callback result: ${err?.code}`);
          let result: int = 0;
          if (eventData?.parameters?.[TEST_RESULT_KEY]) {
            result = eventData?.parameters?.[TEST_RESULT_KEY] as int;
          }
          hilog.info(DOMAIN, TAG, `${tcNumber} subscribeCB result:` + result);
          expect(result).assertEqual(ERROR_CODE_16000002);
          stopAppServiceExtAbility(want, context, tcNumber);
          commonEventManager.unsubscribe(subscriber, (err, data) => {
            done();
          });
        });
        try {
          context?.startAppServiceExtensionAbility(want).then(() => {
            hilog.info(DOMAIN, TAG, `${tcNumber}  startAppServiceExtensionAbility success`);
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(DOMAIN, TAG, `${tcNumber} startAppServiceExtensionAbility, code is ${err.code}`);
            if (err.code !== ERROR_CODE_801) {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(DOMAIN, TAG, `${tcNumber} startAppServiceExtensionAbility failed: ${(err as BusinessError).code}`);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_static_3300
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_static_3300
     * @tc.desc   AppServiceExtensionContext connectServiceExtensionAbility 16000004.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const tcNumber: string = 'SUB_AA_ABILITY_NewRule_AppServiceExtension_static_3300';
      hilog.info(DOMAIN, TAG, `${tcNumber} Begin`);
      let want: Want = {
        deviceId: '',
        bundleName: BUNDLE_NAME,
        abilityName: 'AppServiceExtAbility',
        parameters:{
          'caseTag': tcNumber
        } as Record<string, RecordData>
      };

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [tcNumber]
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        hilog.info(DOMAIN, TAG, `${tcNumber}  createSubscriber success`);
        commonEventManager.subscribe(subscriber, (err: BusinessError<void>|null,
          eventData: commonEventManager.CommonEventData|undefined) => {
          hilog.info(DOMAIN, TAG, `${tcNumber}  subscribe callback result: ${err?.code}`);
          let result: int = 0;
          if (eventData?.parameters?.[TEST_RESULT_KEY]) {
            result = eventData?.parameters?.[TEST_RESULT_KEY] as int;
          }
          hilog.info(DOMAIN, TAG, `${tcNumber} subscribeCB result:` + result);
          expect(result).assertEqual(ERROR_CODE_16000004);
          stopAppServiceExtAbility(want, context, tcNumber);
          commonEventManager.unsubscribe(subscriber, (err, data) => {
            done();
          });
        });
        try {
          context?.startAppServiceExtensionAbility(want).then(() => {
            hilog.info(DOMAIN, TAG, `${tcNumber}  startAppServiceExtensionAbility success`);
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(DOMAIN, TAG, `startAppServiceExtensionAbility, code is ${err.code}`);
            if (err.code !== ERROR_CODE_801) {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(DOMAIN, TAG, `${tcNumber} startAppServiceExtensionAbility failed: ${(err as BusinessError).code}`);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_static_3400
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_static_3400
     * @tc.desc   AppServiceExtensionContext connectServiceExtensionAbility  expect 16000050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const tcNumber: string = 'SUB_AA_ABILITY_NewRule_AppServiceExtension_static_3400';
      let want: Want = {
        bundleName: BUNDLE_NAME,
        abilityName: 'AppServiceExtAbility',
        parameters: {      
          'caseTag': tcNumber
        } as Record<string, RecordData>
      };
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [tcNumber]
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {

        hilog.info(DOMAIN, TAG, `${tcNumber}  createSubscriber success`);
        commonEventManager.subscribe(subscriber, (err: BusinessError<void>|null,
          eventData: commonEventManager.CommonEventData|undefined) => {
          hilog.info(DOMAIN, TAG, `${tcNumber}  subscribe callback result: ${err?.code}`);
          let result: int = 0;
          if (eventData?.parameters?.[TEST_RESULT_KEY]) {
            result = eventData?.parameters?.[TEST_RESULT_KEY] as int;
          }
          hilog.info(DOMAIN, TAG, `${tcNumber} subscribeCB result:` + result);
          expect(result).assertEqual(ERROR_CODE_16000050);
          stopAppServiceExtAbility(want, context, tcNumber);
          commonEventManager.unsubscribe(subscriber, (err, data) => {
            done();
          });
        });
        try {
          context?.startAppServiceExtensionAbility(want).then(() => {
            hilog.info(DOMAIN, TAG, `${tcNumber}  startAppServiceExtensionAbility success`);
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(DOMAIN, TAG, `startAppServiceExtensionAbility, code is ${err.code}`);
            if (err.code !== ERROR_CODE_801) {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(DOMAIN, TAG, `${tcNumber} startAppServiceExtensionAbility failed: ${(err as BusinessError).code}`);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_static_0800
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_static_0800
     * @tc.desc   AppServiceExtensionContext disconnectServiceExtensionAbility  expect 16000050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const tcNumber: string = 'SUB_AA_ABILITY_NewRule_AppServiceExtension_static_0800';
      hilog.info(DOMAIN, TAG, `${tcNumber} Begin`);
      let want: Want = {
        deviceId: '',
        bundleName: BUNDLE_NAME,
        abilityName: 'AppServiceExtAbility',
        parameters: {
          'caseTag': tcNumber
        } as Record<string, RecordData>
      };
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [tcNumber]
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        hilog.info(DOMAIN, TAG, `${tcNumber}  createSubscriber success`);
        commonEventManager.subscribe(subscriber, (err: BusinessError<void>|null,
          eventData: commonEventManager.CommonEventData|undefined) => {
          hilog.info(DOMAIN, TAG, `${tcNumber}  subscribe callback result: ${err?.code}`);
          let result: int = 0;
          if (eventData?.parameters?.[TEST_RESULT_KEY]) {
            result = eventData?.parameters?.[TEST_RESULT_KEY] as int;
          }
          hilog.info(DOMAIN, TAG, `${tcNumber} subscribeCB result:` + result);
          expect(result).assertEqual(ERROR_CODE_16000050);
          stopAppServiceExtAbility(want, context, tcNumber);
          commonEventManager.unsubscribe(subscriber, (err, data) => {
            done();
          });
        });
        try {
          context?.startAppServiceExtensionAbility(want).then(() => {
            hilog.info(DOMAIN, TAG, `${tcNumber}  startAppServiceExtensionAbility success`);
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(DOMAIN, TAG, `startAppServiceExtensionAbility, code is ${err.code}`);
            if (err.code !== ERROR_CODE_801) {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(DOMAIN, TAG, `${tcNumber} startAppServiceExtensionAbility failed: ${(err as BusinessError).code}`);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2000
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2000
     * @tc.desc   AppServiceExtensionContext startAbility  expect 16000001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const tcNumber: string = 'SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2000';
      hilog.info(DOMAIN, TAG, `${tcNumber} Begin`);
      let want : Want = {
        bundleName: BUNDLE_NAME,
        abilityName: 'AppServiceExtAbility',
        parameters: {       
          'caseTag': tcNumber
        } as Record<string, RecordData>
      };
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [tcNumber]
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        hilog.info(DOMAIN, TAG, `${tcNumber}  createSubscriber success`);
        commonEventManager.subscribe(subscriber, (err: BusinessError<void>|null,
          eventData: commonEventManager.CommonEventData|undefined) => {
          hilog.info(DOMAIN, TAG, `${tcNumber}  subscribe callback result: ${err?.code}`);
          let result: int = 0;
          if (eventData?.parameters?.[TEST_RESULT_KEY]) {
            result = eventData?.parameters?.[TEST_RESULT_KEY] as int;
          }
          hilog.info(DOMAIN, TAG, `${tcNumber} subscribeCB result:` + result);
          expect(result).assertEqual(ERROR_CODE_16000001);
          stopAppServiceExtAbility(want, context, tcNumber);
          commonEventManager.unsubscribe(subscriber, (err, data) => {
            done();
          });
        });
        try {
          context?.startAppServiceExtensionAbility(want).then(() => {
            hilog.info(DOMAIN, TAG, `${tcNumber}  startAppServiceExtensionAbility success`);
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(DOMAIN, TAG, `startAppServiceExtensionAbility, code is ${err.code}`);
            if (err.code !== ERROR_CODE_801) {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(DOMAIN, TAG, `${tcNumber} startAppServiceExtensionAbility failed: ${(err as BusinessError).code}`);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2400
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2400
     * @tc.desc   AppServiceExtensionContext startAbility  expect 16000050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const tcNumber: string = 'SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2400';
      hilog.info(DOMAIN, TAG, `${tcNumber} Begin`);
      let want : Want = {
        bundleName: BUNDLE_NAME,
        abilityName: 'AppServiceExtAbility',
        parameters: {     
          'caseTag': tcNumber
        } as Record<string, RecordData>
      };
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [tcNumber]
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        hilog.info(DOMAIN, TAG, `${tcNumber}  createSubscriber success`);
        commonEventManager.subscribe(subscriber, (err: BusinessError<void>|null,
          eventData: commonEventManager.CommonEventData|undefined) => {
          hilog.info(DOMAIN, TAG, `${tcNumber}  subscribe callback result: ${err?.code}`);
          let result: int = 0;
          if (eventData?.parameters?.[TEST_RESULT_KEY]) {
            result = eventData?.parameters?.[TEST_RESULT_KEY] as int;
          }
          hilog.info(DOMAIN, TAG, `${tcNumber} subscribeCB result:` + result);
          expect(result).assertEqual(ERROR_CODE_16000050);
          stopAppServiceExtAbility(want, context, tcNumber);
          commonEventManager.unsubscribe(subscriber, (err, data) => {
            done();
          });
        });
        try {
          context?.startAppServiceExtensionAbility(want).then(() => {
            hilog.info(DOMAIN, TAG, `${tcNumber}  startAppServiceExtensionAbility success`);
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(DOMAIN, TAG, `startAppServiceExtensionAbility, code is ${err.code}`);
            if (err.code !== ERROR_CODE_801) {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(DOMAIN, TAG, `${tcNumber} startAppServiceExtensionAbility failed: ${(err as BusinessError).code}`);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2500
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2500
     * @tc.desc   AppServiceExtensionContext startAbility  expect 16000005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const tcNumber: string = 'SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2500';
      hilog.info(DOMAIN, TAG, `${tcNumber} Begin`);
      let want : Want = {
        bundleName: BUNDLE_NAME,
        abilityName: 'AppServiceExtAbility',
        parameters: {
          'caseTag': tcNumber
        } as Record<string, RecordData>
      };
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [tcNumber]
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        hilog.info(DOMAIN, TAG, `${tcNumber}  createSubscriber success`);
        commonEventManager.subscribe(subscriber, (err: BusinessError<void>|null,
          eventData: commonEventManager.CommonEventData|undefined) => {
          hilog.info(DOMAIN, TAG, `${tcNumber}  subscribe callback result: ${err?.code}`);
          let result: int = 0;
          if (eventData?.parameters?.[TEST_RESULT_KEY]) {
            result = eventData?.parameters?.[TEST_RESULT_KEY] as int;
          }
          hilog.info(DOMAIN, TAG, `${tcNumber} subscribeCB result:` + result);
          expect(result).assertEqual(ERROR_CODE_16000005);
          stopAppServiceExtAbility(want, context, tcNumber);
          commonEventManager.unsubscribe(subscriber, (err, data) => {
            done();
          });
        });
        try {
          context?.startAppServiceExtensionAbility(want).then(() => {
            hilog.info(DOMAIN, TAG, `${tcNumber}  startAppServiceExtensionAbility success`);
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(DOMAIN, TAG, `startAppServiceExtensionAbility, code is ${err.code}`);
            if (err.code !== ERROR_CODE_801) {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(DOMAIN, TAG, `${tcNumber} startAppServiceExtensionAbility failed: ${(err as BusinessError).code}`);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2100
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2100
     * @tc.desc   AppServiceExtensionContext startAbility 16000019.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      const tcNumber: string = 'SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2100';
      hilog.info(DOMAIN, TAG, `${tcNumber} Begin`);
      let want: Want = {
        bundleName: BUNDLE_NAME,
        abilityName: 'AppServiceExtAbility',
        parameters: {
          'caseTag': tcNumber
        } as Record<string, RecordData>
      };
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [tcNumber]
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        hilog.info(DOMAIN, TAG, `${tcNumber}  createSubscriber success`);
        commonEventManager.subscribe(subscriber, (err: BusinessError<void>|null,
          eventData: commonEventManager.CommonEventData|undefined) => {
          hilog.info(DOMAIN, TAG, `${tcNumber}  subscribe callback result: ${err?.code}`);
          let result: int = 0;
          if (eventData?.parameters?.[TEST_RESULT_KEY]) {
            result = eventData?.parameters?.[TEST_RESULT_KEY] as int;
          }
          hilog.info(DOMAIN, TAG, `${tcNumber} subscribeCB result:` + result);
          expect(result).assertEqual(ERROR_CODE_16000019);
          stopAppServiceExtAbility(want, context, tcNumber);
          commonEventManager.unsubscribe(subscriber, (err, data) => {
            done();
          });
        });
        try {
          context?.startAppServiceExtensionAbility(want).then(() => {
            hilog.info(DOMAIN, TAG, `${tcNumber}  startAppServiceExtensionAbility success`);
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(DOMAIN, TAG, `startAppServiceExtensionAbility, code is ${err.code}, ` +
              `message is ${err?.message}`);
            if (err.code !== ERROR_CODE_801) {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(DOMAIN, TAG, `${tcNumber} startAppServiceExtensionAbility failed: ${(err as BusinessError).code}`);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2200
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2200
     * @tc.desc   AppServiceExtensionContext startAbility 16000004.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      const tcNumber: string = 'SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2200';
      hilog.info(DOMAIN, TAG, `${tcNumber} Begin`);
      let want: Want = {
        bundleName: BUNDLE_NAME,
        abilityName: 'AppServiceExtAbility',
        parameters: {
          'caseTag': tcNumber
        } as Record<string, RecordData>
      };
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [tcNumber]
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        hilog.info(DOMAIN, TAG, `${tcNumber}  createSubscriber success`);
        commonEventManager.subscribe(subscriber, (err: BusinessError<void>|null,
          eventData: commonEventManager.CommonEventData|undefined) => {
          hilog.info(DOMAIN, TAG, `${tcNumber}  subscribe callback result: ${err?.code}`);
          let result: int = 0;
          if (eventData?.parameters?.[TEST_RESULT_KEY]) {
            result = eventData?.parameters?.[TEST_RESULT_KEY] as int;
          }
          hilog.info(DOMAIN, TAG, `${tcNumber} subscribeCB result:` + result);
          expect(result).assertEqual(ERROR_CODE_16000004);
          stopAppServiceExtAbility(want, context, tcNumber);
          commonEventManager.unsubscribe(subscriber, (err, data) => {
            done();
          });
        });
        try {
          context?.startAppServiceExtensionAbility(want).then(() => {
            hilog.info(DOMAIN, TAG, `${tcNumber}  startAppServiceExtensionAbility success`);
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(DOMAIN, TAG, `startAppServiceExtensionAbility, code is ${err.code}, ` +
              `message is ${err?.message}`);
            if (err.code !== ERROR_CODE_801) {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(DOMAIN, TAG, `${tcNumber} startAppServiceExtensionAbility failed: ${(err as BusinessError).code}`);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2600
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2600
     * @tc.desc   AppServiceExtensionContext startAbility 16000010.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      const tcNumber: string = 'SUB_AA_ABILITY_NewRule_AppServiceExtension_static_2600';
      hilog.info(DOMAIN, TAG, `${tcNumber} Begin`);
      let want: Want = {
        bundleName: BUNDLE_NAME,
        abilityName: 'AppServiceExtAbility',
        parameters: {
          'caseTag': tcNumber
        } as Record<string, RecordData>
      };
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [tcNumber]
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        hilog.info(DOMAIN, TAG, `${tcNumber}  createSubscriber success`);
        commonEventManager.subscribe(subscriber, (err: BusinessError<void>|null,
          eventData: commonEventManager.CommonEventData|undefined) => {
          hilog.info(DOMAIN, TAG, `${tcNumber}  subscribe callback result: ${err?.code}`);
          let result: int = 0;
          if (eventData?.parameters?.[TEST_RESULT_KEY]) {
            result = eventData?.parameters?.[TEST_RESULT_KEY] as int;
          }
          hilog.info(DOMAIN, TAG, `${tcNumber} subscribeCB result:` + result);
          expect(result).assertEqual(ERROR_CODE_16000010);
          stopAppServiceExtAbility(want, context, tcNumber);
          commonEventManager.unsubscribe(subscriber, (err, data) => {
            done();
          });
        });
        try {
          context?.startAppServiceExtensionAbility(want).then(() => {
            hilog.info(DOMAIN, TAG, `${tcNumber}  startAppServiceExtensionAbility success`);
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(DOMAIN, TAG, `startAppServiceExtensionAbility, code is ${err.code}`);
            if (err.code !== ERROR_CODE_801) {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(DOMAIN, TAG, `${tcNumber} startAppServiceExtensionAbility failed: ${(err as BusinessError).code}`);
          expect().assertFail();
          done();
        }
      })
    })
  })
}