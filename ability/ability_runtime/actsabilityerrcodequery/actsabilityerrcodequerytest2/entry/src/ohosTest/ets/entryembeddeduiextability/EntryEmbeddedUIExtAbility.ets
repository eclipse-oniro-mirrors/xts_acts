/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  AtomicServiceOptions,
  common, OpenLinkOptions, StartOptions, UIExtensionContentSession, UIExtensionAbility, Want } from '@kit.AbilityKit';
import EmbeddedUIExtensionAbility from '@ohos.app.ability.EmbeddedUIExtensionAbility';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { rpc } from '@kit.IPCKit';

const DOMAIN = 0x0000;
const TAG: string = '[ExampleEmbeddedAbility]';
const uiServiceProxy: common.UIServiceProxy | null = null;

export default class EntryEmbeddedUIExtAbility extends EmbeddedUIExtensionAbility {
  onCreate() {
    hilog.info(DOMAIN, 'testTag', `onCreate`);
  }

  onForeground() {
    hilog.info(DOMAIN, 'testTag', `onForeground`);
  }

  onBackground() {
    hilog.info(DOMAIN, 'testTag', `onBackground`);
  }

  onDestroy() {
    hilog.info(DOMAIN, 'testTag', `onDestroy`);
  }

  async onSessionCreate(want: Want, session: UIExtensionContentSession) {
    const storage: LocalStorage = new LocalStorage();
    let TAG = want?.parameters?.case as string;
    storage.setOrCreate('session', session);
    session.loadContent('entryembeddeduiextability/pages/EntryEmbeddedUIExtAbilityPage', storage);
    console.info(`[${TAG}] EntryEmbeddedUIExtAbility: onSessionCreate done`);

    if (TAG == 'SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0200') {
      let want: Want = {
        bundleName: 'com.rely.actsabilityerrcodequerytestrely2',
        abilityName: 'AbilityB',
      };
      let commonEventData: commonEventManager.CommonEventPublishData = {
        parameters: {
          'result': 0,
        }
      };
      try {
        this.context.startAbility(want, (err: BusinessError) => {
          if (err.code) {
            console.error(`[${TAG}] startAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
            commonEventData.parameters = {'result': err.code};
            commonEventManager.publish('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0200_event', commonEventData, (result) => {
              console.info(`[${TAG}] EntryEmbeddedUIExtAbility: Event publish succeed. Result: ${JSON.stringify(result)}`);
              this.context.terminateSelf()
            });
          } else {
            console.info(`[${TAG}] startAbility succeed`);
            commonEventManager.publish('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0200_event', commonEventData, (result) => {
              console.info(`[${TAG}] EntryEmbeddedUIExtAbility: Event publish succeed. Result: ${JSON.stringify(result)}`);
              this.context.terminateSelf()
            });
          }
        })
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        commonEventManager.publish('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0200_event', commonEventData, (result) => {
          console.info(`[${TAG}] EntryEmbeddedUIExtAbility: Event publish succeed. Result: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    }

    if (TAG == 'SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0300') {
      let want: Want = {
        bundleName: 'com.rely.actsabilityerrcodequerytestrely2',
        abilityName: 'AbilityA',
        flags: -1
      };
      let commonEventData: commonEventManager.CommonEventPublishData = {
        parameters: {
          'result': 0,
        }
      };
      try {
        this.context.startAbility(want, (err: BusinessError) => {
          if (err.code) {
            console.error(`[${TAG}] startAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
            commonEventData.parameters = {'result': err.code};
            commonEventManager.publish('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0300_event', commonEventData, (result) => {
              console.info(`[${TAG}] EntryEmbeddedUIExtAbility: Event publish succeed. Result: ${JSON.stringify(result)}`);
              this.context.terminateSelf()
            });
          } else {
            console.info(`[${TAG}] startAbility succeed`);
            commonEventManager.publish('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0300_event', commonEventData, (result) => {
              console.info(`[${TAG}] EntryEmbeddedUIExtAbility: Event publish succeed. Result: ${JSON.stringify(result)}`);
              this.context.terminateSelf()
            });
          }
        })
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        commonEventManager.publish('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0300_event', commonEventData, (result) => {
          console.info(`[${TAG}] EntryEmbeddedUIExtAbility: Event publish succeed. Result: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    }

    if (TAG == 'SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0500') {
      let want: Want = {
        bundleName: 'com.rely.actsabilityerrcodequerytestrely2',
        abilityName: 'AbilityB',
      };
      let options: StartOptions = {
        displayId: 0
      };
      let commonEventData: commonEventManager.CommonEventPublishData = {
        parameters: {
          'result': 0,
        }
      };
      try {
        this.context.startAbility(want, options, (err: BusinessError) => {
          if (err.code) {
            console.error(`[${TAG}] startAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
            commonEventData.parameters = {'result': err.code};
            commonEventManager.publish('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0500_event', commonEventData, (result) => {
              console.info(`[${TAG}] EntryEmbeddedUIExtAbility: Event publish succeed. Result: ${JSON.stringify(result)}`);
              this.context.terminateSelf()
            });
          } else {
            console.info(`[${TAG}] startAbility succeed`);
            commonEventManager.publish('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0500_event', commonEventData, (result) => {
              console.info(`[${TAG}] EntryEmbeddedUIExtAbility: Event publish succeed. Result: ${JSON.stringify(result)}`);
              this.context.terminateSelf()
            });
          }
        })
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        commonEventManager.publish('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0500_event', commonEventData, (result) => {
          console.info(`[${TAG}] EntryEmbeddedUIExtAbility: Event publish succeed. Result: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    }

    if (TAG == 'SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0700') {
      let want: Want = {
        bundleName: 'com.rely.actsabilityerrcodequerytestrely2',
        abilityName: 'AbilityB',
      };
      let options: StartOptions = {
        displayId: 0
      };
      let commonEventData: commonEventManager.CommonEventPublishData = {
        parameters: {
          'result': 0,
        }
      };
      let errObject = {} as BusinessError;
      try {
        await this.context.startAbility(want, options)
          .then(() => {
            console.info(`[${TAG}] startAbility succeed`);
          })
          .catch((err: BusinessError) => {
            console.error(`[${TAG}] startAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
            errObject = err;
          })
        commonEventData.parameters = {'result': errObject.code};
        commonEventManager.publish('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0700_event', commonEventData, (result) => {
          console.info(`[${TAG}] EntryEmbeddedUIExtAbility: Event publish succeed. Result: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        commonEventManager.publish('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0700_event', commonEventData, (result) => {
          console.info(`[${TAG}] EntryEmbeddedUIExtAbility: Event publish succeed. Result: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    }

    if (TAG == 'SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0800') {
      let want: Want = {
        bundleName: 'com.rely.actsabilityerrcodequerytestrely2',
        abilityName: 'AbilityA',
        flags: -1
      };
      let options: StartOptions = {
        displayId: 0
      };
      let errObject = {} as BusinessError;
      let commonEventData: commonEventManager.CommonEventPublishData = {
        parameters: {
          'result': 0,
        }
      };
      try {
        await this.context.startAbility(want, options)
          .then(() => {
            console.info(`[${TAG}] startAbility succeed`);
          })
          .catch((err: BusinessError) => {
            console.error(`[${TAG}] startAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
            errObject = err;
          })
        commonEventData.parameters = {'result': errObject.code};
        commonEventManager.publish('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0800_event', commonEventData, (result) => {
          console.info(`[${TAG}] EntryEmbeddedUIExtAbility: Event publish succeed. Result: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        commonEventManager.publish('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0800_event', commonEventData, (result) => {
          console.info(`[${TAG}] EntryEmbeddedUIExtAbility: Event publish succeed. Result: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    }

    if (TAG == 'SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0200') {
      let want: Want = {
        bundleName: 'com.rely.actsabilityerrcodequerytestrely2',
        abilityName: 'AbilityD',
      };
      let commonEventData: commonEventManager.CommonEventPublishData = {
        parameters: {
          'result': 0,
        }
      };
      try {
        this.context.startAbilityForResult(want, (err: BusinessError, result: common.AbilityResult) => {
          if (err.code) {
            console.error(`[${TAG}] startAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
            commonEventData.parameters = {'result': err.code};
            commonEventManager.publish('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0200_event', commonEventData, (result) => {
              console.info(`[${TAG}] EntryEmbeddedUIExtAbility: Event publish succeed. Result: ${JSON.stringify(result)}`);
              this.context.terminateSelf()
            });
          } else {
            console.info(`[${TAG}] startAbility succeed`);
            commonEventManager.publish('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0200_event', commonEventData, (result) => {
              console.info(`[${TAG}] EntryEmbeddedUIExtAbility: Event publish succeed. Result: ${JSON.stringify(result)}`);
              this.context.terminateSelf()
            });
          }
        })
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        commonEventManager.publish('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0200_event', commonEventData, (result) => {
          console.info(`[${TAG}] EntryEmbeddedUIExtAbility: Event publish succeed. Result: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    }

    if (TAG == 'SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0300') {
      let want: Want = {
        bundleName: 'com.rely.actsabilityerrcodequerytestrely2',
        abilityName: 'AbilityC',
        flags: -1
      };
      let commonEventData: commonEventManager.CommonEventPublishData = {
        parameters: {
          'result': 0,
        }
      };
      try {
        this.context.startAbilityForResult(want, (err: BusinessError, result: common.AbilityResult) => {
          if (err.code) {
            console.error(`[${TAG}] startAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
            commonEventData.parameters = {'result': err.code};
            commonEventManager.publish('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0300_event', commonEventData, (result) => {
              console.info(`[${TAG}] EntryEmbeddedUIExtAbility: Event publish succeed. Result: ${JSON.stringify(result)}`);
              this.context.terminateSelf()
            });
          } else {
            console.info(`[${TAG}] startAbility succeed`);
            commonEventManager.publish('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0300_event', commonEventData, (result) => {
              console.info(`[${TAG}] EntryEmbeddedUIExtAbility: Event publish succeed. Result: ${JSON.stringify(result)}`);
              this.context.terminateSelf()
            });
          }
        })
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        commonEventManager.publish('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0300_event', commonEventData, (result) => {
          console.info(`[${TAG}] EntryEmbeddedUIExtAbility: Event publish succeed. Result: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    }

    if (TAG == 'SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0500') {
      let want: Want = {
        bundleName: 'com.rely.actsabilityerrcodequerytestrely2',
        abilityName: 'AbilityD',
      };
      let options: StartOptions = {
        displayId: 0
      };
      let commonEventData: commonEventManager.CommonEventPublishData = {
        parameters: {
          'result': 0,
        }
      };
      try {
        this.context.startAbilityForResult(want, options, (err: BusinessError, result: common.AbilityResult) => {
          if (err.code) {
            console.error(`[${TAG}] startAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
            commonEventData.parameters = {'result': err.code};
            commonEventManager.publish('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0500_event', commonEventData, (result) => {
              console.info(`[${TAG}] EntryEmbeddedUIExtAbility: Event publish succeed. Result: ${JSON.stringify(result)}`);
              this.context.terminateSelf()
            });
          } else {
            console.info(`[${TAG}] startAbility succeed`);
            commonEventManager.publish('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0500_event', commonEventData, (result) => {
              console.info(`[${TAG}] EntryEmbeddedUIExtAbility: Event publish succeed. Result: ${JSON.stringify(result)}`);
              this.context.terminateSelf()
            });
          }
        })
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        commonEventManager.publish('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0500_event', commonEventData, (result) => {
          console.info(`[${TAG}] EntryEmbeddedUIExtAbility: Event publish succeed. Result: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    }

    if (TAG == 'SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0700') {
      let want: Want = {
        bundleName: 'com.rely.actsabilityerrcodequerytestrely2',
        abilityName: 'AbilityD',
      };
      let options: StartOptions = {
        displayId: 0
      };
      let errObject = {} as BusinessError;
      let commonEventData: commonEventManager.CommonEventPublishData = {
        parameters: {
          'result': 0,
        }
      };
      try {
        await this.context.startAbilityForResult(want, options)
          .then(() => {
            console.info(`[${TAG}] startAbility succeed`);
          })
          .catch((err: BusinessError) => {
            console.error(`[${TAG}] startAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
            errObject = err;
          })
        commonEventData.parameters = {'result': errObject.code};
        commonEventManager.publish('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0700_event', commonEventData, (result) => {
          console.info(`[${TAG}] EntryEmbeddedUIExtAbility: Event publish succeed. Result: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        commonEventManager.publish('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0700_event', commonEventData, (result) => {
          console.info(`[${TAG}] EntryEmbeddedUIExtAbility: Event publish succeed. Result: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    }

    if (TAG == 'SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0800') {
      let want: Want = {
        bundleName: 'com.rely.actsabilityerrcodequerytestrely2',
        abilityName: 'AbilityC',
        flags: -1
      };
      let options: StartOptions = {
        displayId: 0
      };
      let errObject = {} as BusinessError;
      let commonEventData: commonEventManager.CommonEventPublishData = {
        parameters: {
          'result': 0,
        }
      };
      try {
        await this.context.startAbilityForResult(want, options)
          .then(() => {
            console.info(`[${TAG}] startAbility succeed`);
          })
          .catch((err: BusinessError) => {
            console.error(`[${TAG}] startAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
            errObject = err;
          })
        commonEventData.parameters = {'result': errObject.code};
        commonEventManager.publish('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0800_event', commonEventData, (result) => {
          console.info(`[${TAG}] EntryEmbeddedUIExtAbility: Event publish succeed. Result: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        commonEventManager.publish('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0800_event', commonEventData, (result) => {
          console.info(`[${TAG}] EntryEmbeddedUIExtAbility: Event publish succeed. Result: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    }

    if (TAG == 'SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_openLink_0200') {
      let link: string = 'https://www.rely.AbilityB.com';
      let openLinkOptions: OpenLinkOptions = {};
      let errObject = {} as BusinessError;
      let commonEventData: commonEventManager.CommonEventPublishData = {
        parameters: {
          'result': 0,
        }
      };
      try {
        await this.context.openLink(link, openLinkOptions)
          .then(() => {
            console.info(`[${TAG}] startAbility succeed`);
          })
          .catch((err: BusinessError) => {
            console.error(`[${TAG}] startAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
            errObject = err;
          })
        commonEventData.parameters = {'result': errObject.code};
        commonEventManager.publish('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_openLink_0200_event', commonEventData, (result) => {
          console.info(`[${TAG}] EntryEmbeddedUIExtAbility: Event publish succeed. Result: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        commonEventManager.publish('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_openLink_0200_event', commonEventData, (result) => {
          console.info(`[${TAG}] EntryEmbeddedUIExtAbility: Event publish succeed. Result: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    }

  }

  onSessionDestroy(session: UIExtensionContentSession) {
    session.terminateSelf().catch(() => {
      // handle error
    });
    hilog.info(DOMAIN, 'testTag', `onSessionDestroy`);
  }
}
