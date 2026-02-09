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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import { Want, common } from '@kit.AbilityKit';
import { commonEventManager } from '@kit.BasicServicesKit';
import { BusinessError, systemParameterEnhance } from '@kit.BasicServicesKit';

let context: common.UIAbilityContext;
let sub: commonEventManager.CommonEventSubscriber;
let mpEnable: string;

export default function abilityTest() {
  describe('startAbility', () => {
    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>('abilityContext') as common.UIAbilityContext;
      try {
        mpEnable = systemParameterEnhance.getSync('const.abilityms.support_multi_instance');
      } catch (err) {
        console.error(`ACTS_NativeStartChildProcess Get system parameter error: ${JSON.stringify(err)}`);
        mpEnable = 'fail';
      }
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_1900
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_1900
     * @tc.desc   AppServiceExtensionContext startAbility success.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_1900', Level.LEVEL0, async (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_1900`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} Begin`);
      let want: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'AppServiceExtAbility2',
        parameters: {
          TestFlag: 'startAppServiceDefault'
        }
      };
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['AppServiceExtension_1900']
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        sub = subscriber;
        hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} createSubscriber succeed`);
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', 
            `${tcNumber} subscribe callback result:${JSON.stringify(err)}`);
          expect(commonEventData.parameters?.result).assertEqual(200);
          commonEventManager.unsubscribe(subscriber);
          done();
        });
        try {
          context.startAppServiceExtensionAbility(want)
            .then(() => {
              hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility succeed`);
            })
            .catch((err: BusinessError) => {
              hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility error:${JSON.stringify(err)}`);
              if (err.code !== 801) {
                expect().assertFail();
              }
              done();
            });
        } catch (err) {
          hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility failed: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_2000
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_2000
     * @tc.desc   AppServiceExtensionContext startAbility 16000001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_2000', Level.LEVEL0, async (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_2000`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} Begin`);
      let want: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'AppServiceExtAbility2',
        parameters: {
          TestFlag: 'startAppServiceErrorBundleName'
        }
      };
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['AppServiceExtension_2000']
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        sub = subscriber;
        hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} createSubscriber succeed`);
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', 
            `${tcNumber} subscribe callback result:${JSON.stringify(err)}`);
          expect(commonEventData.parameters?.result).assertEqual(16000001);
          commonEventManager.unsubscribe(subscriber);
          done();
        });
        try {
          context.startAppServiceExtensionAbility(want)
            .then(() => {
              hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility succeed`);
            })
            .catch((err: BusinessError) => {
              hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility error:${JSON.stringify(err)}`);
              if (err.code !== 801) {
                expect().assertFail();
              }
              done();
            });
        } catch (err) {
          hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility failed: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_2100
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_2100
     * @tc.desc   AppServiceExtensionContext startAbility 16000019.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_2100', Level.LEVEL0, async (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_2100`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} Begin`);
      let want: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'AppServiceExtAbility2',
        parameters: {
          TestFlag: 'startAppServiceUndefinedAbilityName'
        }
      };
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['AppServiceExtension_2100']
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        sub = subscriber;
        hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} createSubscriber succeed`);
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', 
            `${tcNumber} subscribe callback result:${JSON.stringify(err)}`);
          let result: number = commonEventData.parameters?.result;
          let val: boolean = result === 201 || result === 16000019;
          expect(val).assertTrue();
          commonEventManager.unsubscribe(subscriber);
          done();
        });
        try {
          context.startAppServiceExtensionAbility(want)
            .then(() => {
              hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility succeed`);
            })
            .catch((err: BusinessError) => {
              hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility error:${JSON.stringify(err)}`);
              if (err.code !== 801) {
                expect().assertFail();
              }
              done();
            });
        } catch (err) {
          hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility failed: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_2200
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_2200
     * @tc.desc   AppServiceExtensionContext startAbility 16000004.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_2200', Level.LEVEL0, async (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_2200`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} Begin`);
      let want: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'AppServiceExtAbility2',
        parameters: {
          TestFlag: 'startAppServiceExportedFalse'
        }
      };
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['AppServiceExtension_2200']
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        sub = subscriber;
        hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} createSubscriber succeed`);
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', 
            `${tcNumber} subscribe callback result:${JSON.stringify(err)}`);
          expect(commonEventData.parameters?.result).assertEqual(16000004);
          commonEventManager.unsubscribe(subscriber);
          done();
        });
        try {
          context.startAppServiceExtensionAbility(want)
            .then(() => {
              hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility succeed`);
            })
            .catch((err: BusinessError) => {
              hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility error:${JSON.stringify(err)}`);
              if (err.code !== 801) {
                expect().assertFail();
              }
              done();
            });
        } catch (err) {
          hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility failed: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_2300
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_2300
     * @tc.desc   AppServiceExtensionContext startAbility 16000002.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_2300', Level.LEVEL0, async (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_2300`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} Begin`);
      let want: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'AppServiceExtAbility2',
        parameters: {
          TestFlag: 'startAppServiceErrorTypeAbility'
        }
      };
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['AppServiceExtension_2300']
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        sub = subscriber;
        hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} createSubscriber succeed`);
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', 
            `${tcNumber} subscribe callback result:${JSON.stringify(err)}`);
          expect(commonEventData.parameters?.result).assertEqual(16000002);
          commonEventManager.unsubscribe(subscriber);
          done();
        });
        try {
          context.startAppServiceExtensionAbility(want)
            .then(() => {
              hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility succeed`);
            })
            .catch((err: BusinessError) => {
              hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility error:${JSON.stringify(err)}`);
              if (err.code !== 801) {
                expect().assertFail();
              }
              done();
            });
        } catch (err) {
          hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility failed: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_2400
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_2400
     * @tc.desc   AppServiceExtensionContext startAbility 16000050.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_2400', Level.LEVEL0, async (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_2400`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} Begin`);
      let want: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'AppServiceExtAbility2',
        parameters: {
          TestFlag: 'startAppServiceInternalError'
        }
      };
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['AppServiceExtension_2400']
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        sub = subscriber;
        hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} createSubscriber succeed`);
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', 
            `${tcNumber} subscribe callback result:${JSON.stringify(err)}`);
          expect(commonEventData.parameters?.result).assertEqual(16000050);
          commonEventManager.unsubscribe(subscriber);
          done();
        });
        try {
          context.startAppServiceExtensionAbility(want)
            .then(() => {
              hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility succeed`);
            })
            .catch((err: BusinessError) => {
              hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility error:${JSON.stringify(err)}`);
              if (err.code !== 801) {
                expect().assertFail();
              }
              done();
            });
        } catch (err) {
          hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility failed: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_2500
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_2500
     * @tc.desc   AppServiceExtensionContext startAbility 16000005.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_2500', Level.LEVEL0, async (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_2500`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} Begin`);
      let want: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'AppServiceExtAbility2',
        parameters: {
          TestFlag: 'startAppServiceNotPermission'
        }
      };
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['AppServiceExtension_2500']
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        sub = subscriber;
        hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} createSubscriber succeed`);
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', 
            `${tcNumber} subscribe callback result:${JSON.stringify(err)}`);
          expect(commonEventData.parameters?.result).assertEqual(16000005);
          commonEventManager.unsubscribe(subscriber);
          done();
        });
        try {
          context.startAppServiceExtensionAbility(want)
            .then(() => {
              hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility succeed`);
            })
            .catch((err: BusinessError) => {
              hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility error:${JSON.stringify(err)}`);
              if (err.code !== 801) {
                expect().assertFail();
              }
              done();
            });
        } catch (err) {
          hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility failed: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })
    })
    
    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_2600
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_2600
     * @tc.desc   AppServiceExtensionContext startAbility 16000010.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_2600', Level.LEVEL0, async (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_2600`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} Begin`);
      let want: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'AppServiceExtAbility2',
        parameters: {
          TestFlag: 'startAppServiceForbidden'
        }
      };
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['AppServiceExtension_2600']
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        sub = subscriber;
        hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} createSubscriber succeed`);
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', 
            `${tcNumber} subscribe callback result:${JSON.stringify(err)}`);
          expect(commonEventData.parameters?.result).assertEqual(16000010);
          commonEventManager.unsubscribe(subscriber);
          done();
        });
        try {
          context.startAppServiceExtensionAbility(want)
            .then(() => {
              hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility succeed`);
            })
            .catch((err: BusinessError) => {
              hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility error:${JSON.stringify(err)}`);
              if (err.code !== 801) {
                expect().assertFail();
              }
              done();
            });
        } catch (err) {
          hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility failed: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })
    })
    
    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_3500
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_3500
     * @tc.desc   AppServiceExtensionContext startAbility 16000072.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_3500', Level.LEVEL0, async (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_3500`;
      if(mpEnable !== 'true') {
        hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} current device not support feature.`);
        done();
      }

      hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} Begin`);
      let want: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'AppServiceExtAbility2',
        parameters: {
          TestFlag: 'startAbilityMultiInstance'
        }
      };
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['AppServiceExtension_3500']
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        sub = subscriber;
        hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} createSubscriber succeed`);
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', 
            `${tcNumber} subscribe callback result:${JSON.stringify(err)}`);
          expect(commonEventData.parameters?.result).assertEqual(16000072);
          commonEventManager.unsubscribe(subscriber);
          done();
        });
        try {
          context.startAppServiceExtensionAbility(want)
            .then(() => {
              hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility succeed`);
            })
            .catch((err: BusinessError) => {
              hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility error:${JSON.stringify(err)}`);
              if (err.code !== 801) {
                expect().assertFail();
              }
              done();
            });
        } catch (err) {
          hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility failed: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })
    })
    
    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_3600
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_3600
     * @tc.desc   AppServiceExtensionContext startAbility 16000080.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_3600', Level.LEVEL0, async (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_3600`;
      if(mpEnable !== 'true') {
        hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} current device not support feature.`);
        done();
      }

      hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} Begin`);
      let want: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'AppServiceExtAbility2',
        parameters: {
          TestFlag: 'startAbilityAppInstanceKeyError'
        }
      };
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['AppServiceExtension_3600']
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        sub = subscriber;
        hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} createSubscriber succeed`);
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', 
            `${tcNumber} subscribe callback result:${JSON.stringify(err)}`);
          expect(commonEventData.parameters?.result).assertEqual(16000080);
          commonEventManager.unsubscribe(subscriber);
          done();
        });
        try {
          context.startAppServiceExtensionAbility(want)
            .then(() => {
              hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility succeed`);
            })
            .catch((err: BusinessError) => {
              hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility error:${JSON.stringify(err)}`);
              if (err.code !== 801) {
                expect().assertFail();
              }
              done();
            });
        } catch (err) {
          hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility failed: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })
    })
    
    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_3700
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_3700
     * @tc.desc   AppServiceExtensionContext startAbility 16000078.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_3700', Level.LEVEL0, async (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_3700`;
      if(mpEnable !== 'true') {
        hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} current device not support feature.`);
        done();
      }

      hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} Begin`);
      let want: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'AppServiceExtAbility2',
        parameters: {
          TestFlag: 'startAbilityMultiAppModeTypeError'
        }
      };
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['AppServiceExtension_3700']
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        sub = subscriber;
        hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} createSubscriber succeed`);
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', 
            `${tcNumber} subscribe callback result:${JSON.stringify(err)}`);
          expect(commonEventData.parameters?.result).assertEqual(16000078);
          commonEventManager.unsubscribe(subscriber);
          done();
        });
        try {
          context.startAppServiceExtensionAbility(want)
            .then(() => {
              hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility succeed`);
            })
            .catch((err: BusinessError) => {
              hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility error:${JSON.stringify(err)}`);
              if (err.code !== 801) {
                expect().assertFail();
              }
              done();
            });
        } catch (err) {
          hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility failed: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })
    })
    
    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_3800
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_3800
     * @tc.desc   AppServiceExtensionContext startAbility 16000080.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_3800', Level.LEVEL0, async (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_3800`;
      if(mpEnable !== 'true') {
        hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} current device not support feature.`);
        done();
      }

      hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} Begin`);
      let want: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'AppServiceExtAbility2',
        parameters: {
          TestFlag: 'startAbilityInstancesReachLimitError'
        }
      };
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['AppServiceExtension_3800']
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        sub = subscriber;
        hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} createSubscriber succeed`);
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', 
            `${tcNumber} subscribe callback result:${JSON.stringify(err)}`);
          expect(commonEventData.parameters?.result).assertEqual(16000080);
          commonEventManager.unsubscribe(subscriber);
          done();
        });
        try {
          context.startAppServiceExtensionAbility(want)
            .then(() => {
              hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility succeed`);
            })
            .catch((err: BusinessError) => {
              hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility error:${JSON.stringify(err)}`);
              if (err.code !== 801) {
                expect().assertFail();
              }
              done();
            });
        } catch (err) {
          hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility failed: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })
    })
    
    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_3900
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_3900
     * @tc.desc   AppServiceExtensionContext startAbility 16000076.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_3900', Level.LEVEL0, async (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_3900`;
      if(mpEnable !== 'true') {
        hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} current device not support feature.`);
        done();
      }

      hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} Begin`);
      let want: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'AppServiceExtAbility2',
        parameters: {
          TestFlag: 'startAbilityAppInstanceKeyInvalid'
        }
      };
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['AppServiceExtension_3900']
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        sub = subscriber;
        hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} createSubscriber succeed`);
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', 
            `${tcNumber} subscribe callback result:${JSON.stringify(err)}`);
          expect(commonEventData.parameters?.result).assertEqual(16000076);
          commonEventManager.unsubscribe(subscriber);
          done();
        });
        try {
          context.startAppServiceExtensionAbility(want)
            .then(() => {
              hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility succeed`);
            })
            .catch((err: BusinessError) => {
              hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility error:${JSON.stringify(err)}`);
              if (err.code !== 801) {
                expect().assertFail();
              }
              done();
            });
        } catch (err) {
          hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility failed: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })
    })
    
    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_4000
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_4000
     * @tc.desc   AppServiceExtensionContext startAbility 16000073.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_4000', Level.LEVEL0, async (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_4000`;
      if(mpEnable !== 'true') {
        hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} current device not support feature.`);
        done();
      }

      hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} Begin`);
      let want: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'AppServiceExtAbility2',
        parameters: {
          TestFlag: 'startAbilityAppCloneIndexInvalid'
        }
      };
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['AppServiceExtension_4000']
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        sub = subscriber;
        hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} createSubscriber succeed`);
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', 
            `${tcNumber} subscribe callback result:${JSON.stringify(err)}`);
          expect(commonEventData.parameters?.result).assertEqual(16000073);
          commonEventManager.unsubscribe(subscriber);
          done();
        });
        try {
          context.startAppServiceExtensionAbility(want)
            .then(() => {
              hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility succeed`);
            })
            .catch((err: BusinessError) => {
              hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility error:${JSON.stringify(err)}`);
              if (err.code !== 801) {
                expect().assertFail();
              }
              done();
            });
        } catch (err) {
          hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility failed: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })
    })
    
    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_4100
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_4100
     * @tc.desc   AppServiceExtensionContext startAbility 16000072.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_4100', Level.LEVEL0, async (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_4100`;
      if(mpEnable !== 'true') {
        hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} current device not support feature.`);
        done();
      }

      hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} Begin`);
      let want: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'AppServiceExtAbility2',
        parameters: {
          TestFlag: 'startAbilityMultiInstanceNotSupported'
        }
      };
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['AppServiceExtension_4100']
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        sub = subscriber;
        hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} createSubscriber succeed`);
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', 
            `${tcNumber} subscribe callback result:${JSON.stringify(err)}`);
          expect(commonEventData.parameters?.result).assertEqual(16000072);
          commonEventManager.unsubscribe(subscriber);
          done();
        });
        try {
          context.startAppServiceExtensionAbility(want)
            .then(() => {
              hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility succeed`);
            })
            .catch((err: BusinessError) => {
              hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility error:${JSON.stringify(err)}`);
              if (err.code !== 801) {
                expect().assertFail();
              }
              done();
            });
        } catch (err) {
          hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility failed: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })
    })
    
    /**
     * @tc.name   SUB_AA_ABILITY_NewRule_AppServiceExtension_4200
     * @tc.number SUB_AA_ABILITY_NewRule_AppServiceExtension_4200
     * @tc.desc   AppServiceExtensionContext startAbility 16000072.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_4200', Level.LEVEL0, async (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_4200`;
      if(mpEnable !== 'true') {
        hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} current device not support feature.`);
        done();
      }

      hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} Begin`);
      let want: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'AppServiceExtAbility2',
        parameters: {
          TestFlag: 'startAbilityAppCloneNotSupported'
        }
      };
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['AppServiceExtension_4200']
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        sub = subscriber;
        hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} createSubscriber succeed`);
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', 
            `${tcNumber} subscribe callback result:${JSON.stringify(err)}`);
          expect(commonEventData.parameters?.result).assertEqual(16000072);
          commonEventManager.unsubscribe(subscriber);
          done();
        });
        try {
          context.startAppServiceExtensionAbility(want)
            .then(() => {
              hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility succeed`);
            })
            .catch((err: BusinessError) => {
              hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility error:${JSON.stringify(err)}`);
              if (err.code !== 801) {
                expect().assertFail();
              }
              done();
            });
        } catch (err) {
          hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} startAppServiceExtensionAbility failed: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })
    })

  })
}