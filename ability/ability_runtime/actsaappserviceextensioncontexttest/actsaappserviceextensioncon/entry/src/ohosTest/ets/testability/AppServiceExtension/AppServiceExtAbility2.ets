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
import { wantConstant, Want } from '@kit.AbilityKit';
import AppServiceExtensionAbility from '@ohos.app.ability.AppServiceExtensionAbility'
import { rpc } from '@kit.IPCKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';

const TAG: string = 'testTag';

function sleep(time: number) {
  return new Promise<string>((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve('ok')
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

class StubTest extends rpc.RemoteObject{
  constructor(des: string) {
    hilog.info(0x0000, TAG, 'AppService2 StubTest');
    super(des);
  }
  onConnect(code: number, data: rpc.MessageSequence, reply: rpc.MessageSequence, option: rpc.MessageOption) {
    hilog.info(0x0000, TAG, 'AppService2 StubTest onConnect');
  }
}

function successReturn(type: string, name: string) {
  let commonEventData: commonEventManager.CommonEventPublishData = {
    parameters: {
      'result': 200
    }
  }
  commonEventManager.publish(`${name}`, commonEventData, (result) => {
    hilog.info(0x0000, TAG, `${type} publish ${name} result: ${JSON.stringify(result)}`);
  });
}

function errorReturn(type: string, name: string, error: BusinessError) {
  let commonEventData: commonEventManager.CommonEventPublishData = {
    parameters: {
      'result': error?.code
    }
  }
  commonEventManager.publish(`${name}`, commonEventData, (result) => {
    hilog.info(0x0000, TAG, `${type} publish ${name} result: ${JSON.stringify(result)}`);
  });
}

export default class AppService2 extends AppServiceExtensionAbility {

  onCreate(want: Want): void {
    hilog.info(0x0000, TAG, `AppService2 onCreate, want: ${JSON.stringify(want)}`);
  }

  async onRequest(want: Want, startId: number) {
    hilog.info(0x0000, TAG, `AppService2 onRequest, want: ${JSON.stringify(want)}, startId: ${startId}`);
    if (want.parameters?.TestFlag === 'startAppServiceDefault') {
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'MyUIAbility2'
      };
      try {
        this.context.startAbility(wantInfo).then(() => {
          successReturn('startAppServiceDefault', 'AppServiceExtension_1900');
          try { 
            this.context.terminateSelf(); 
          } catch (err) {}
        }).catch((error: BusinessError) => {
          errorReturn('startAppServiceDefault', 'AppServiceExtension_1900', error);
        });
      } catch (error) {
        errorReturn('startAppServiceDefault', 'AppServiceExtension_1900', error);
      }
    } else if(want.parameters?.TestFlag === 'startAppServiceErrorBundleName') {
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextensionError',
        abilityName: 'MyUIAbility2'
      };
      try {
        this.context.startAbility(wantInfo).then(() => {
          successReturn('startAppServiceErrorBundleName', 'AppServiceExtension_2000');
        }).catch((error: BusinessError) => {
          errorReturn('startAppServiceErrorBundleName', 'AppServiceExtension_2000', error);
        });
      } catch (error) {
          errorReturn('startAppServiceErrorBundleName', 'AppServiceExtension_2000', error);
      }
    } else if(want.parameters?.TestFlag === 'startAppServiceUndefinedAbilityName') {
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: undefined
      };
      try {
        this.context.startAbility(wantInfo).then(() => {
          successReturn('startAppServiceUndefinedAbilityName', 'AppServiceExtension_2100');
        }).catch((error: BusinessError) => {
          errorReturn('startAppServiceUndefinedAbilityName', 'AppServiceExtension_2100', error);
        });
      } catch (error) {
        errorReturn('startAppServiceUndefinedAbilityName', 'AppServiceExtension_2100', error);
      }
    } else if(want.parameters?.TestFlag === 'startAppServiceExportedFalse') {
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextensionrely',
        abilityName: 'MyUIAbility'
      };
      try {
        this.context.startAbility(wantInfo).then(() => {
          successReturn('startAppServiceExportedFalse', 'AppServiceExtension_2200');
        }).catch((error: BusinessError) => {
          errorReturn('startAppServiceExportedFalse', 'AppServiceExtension_2200', error);
        });
      } catch (error) {
          errorReturn('startAppServiceExportedFalse', 'AppServiceExtension_2200', error);
      }
    } else if(want.parameters?.TestFlag === 'startAppServiceErrorTypeAbility') {
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'AppServiceExtAbility'
      };
      try {
        this.context.startAbility(wantInfo).then(() => {
          successReturn('startAppServiceErrorTypeAbility', 'AppServiceExtension_2300');
        }).catch((error: BusinessError) => {
          errorReturn('startAppServiceErrorTypeAbility', 'AppServiceExtension_2300', error);
        });
      } catch (error) {
          errorReturn('startAppServiceErrorTypeAbility', 'AppServiceExtension_2300', error);
      }
    } else if(want.parameters?.TestFlag === 'startAppServiceInternalError') {
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextensionrely',
        abilityName: 'MyUIAbility2',
        parameters: {
          'keyFd': { 'type': 'FD', 'value': -1 }
        }
      };
      try {
        this.context.startAbility(wantInfo).then(() => {
          successReturn('startAppServiceInternalError', 'AppServiceExtension_2400');
        }).catch((error: BusinessError) => {
          errorReturn('startAppServiceInternalError', 'AppServiceExtension_2400', error);
        });
      } catch (error) {
        errorReturn('startAppServiceInternalError', 'AppServiceExtension_2400', error);
      }
    } else if(want.parameters?.TestFlag === 'startAppServiceNotPermission') {
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextensionrely',
        abilityName: 'MyUIAbility3'
      };
      try {
        this.context.startAbility(wantInfo).then(() => {
          successReturn('startAppServiceNotPermission', 'AppServiceExtension_2500');
        }).catch((error: BusinessError) => {
          errorReturn('startAppServiceNotPermission', 'AppServiceExtension_2500', error);
        });
      } catch (error) {
        errorReturn('startAppServiceNotPermission', 'AppServiceExtension_2500', error);
      }
    } else if(want.parameters?.TestFlag === 'startAppServiceForbidden') {
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'MyUIAbility2',
        flags: -1
      };
      try {
        this.context.startAbility(wantInfo).then(() => {
          successReturn('startAppServiceForbidden', 'AppServiceExtension_2600');
        }).catch((error: BusinessError) => {
          errorReturn('startAppServiceForbidden', 'AppServiceExtension_2600', error);
        });
      } catch (error) {
        errorReturn('startAppServiceForbidden', 'AppServiceExtension_2600', error);
      }
    } else if(want.parameters?.TestFlag === 'startAbilityMultiInstance') {
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'EntryAbility',
        parameters:{
          [wantConstant.Params.CREATE_APP_INSTANCE_KEY] : true
        }
      };
      try {
        this.context.startAbility(wantInfo).then(() => {
          successReturn('startAbilityMultiInstance', 'AppServiceExtension_3500');
        }).catch((error: BusinessError) => {
          errorReturn('startAbilityMultiInstance', 'AppServiceExtension_3500', error);
        });
      } catch (error) {
        errorReturn('startAbilityMultiInstance', 'AppServiceExtension_3500', error);
      }
    } else if(want.parameters?.TestFlag === 'startAbilityAppInstanceKeyError') {
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextensionrely',
        abilityName: 'MainAbility',
        parameters:{
          [wantConstant.Params.APP_INSTANCE_KEY]: 'app_instance_100',
          [wantConstant.Params.CREATE_APP_INSTANCE_KEY]: true,
        }
      };
      try {
        this.context.startAbility(wantInfo).then(() => {
          successReturn('startAbilityAppInstanceKeyError', 'AppServiceExtension_3600');
        }).catch((error: BusinessError) => {
          errorReturn('startAbilityAppInstanceKeyError', 'AppServiceExtension_3600', error);
        });
      } catch (error) {
        errorReturn('startAbilityAppInstanceKeyError', 'AppServiceExtension_3600', error);
      }
    } else if(want.parameters?.TestFlag === 'startAbilityMultiAppModeTypeError') {
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextensionrely2',
        abilityName: 'MainAbility',
        parameters:{
          [wantConstant.Params.APP_INSTANCE_KEY]: 'app_instance_0',
        }
      };
      try {
        this.context.startAbility(wantInfo).then(() => {
          successReturn('startAbilityMultiAppModeTypeError', 'AppServiceExtension_3700');
        }).catch((error: BusinessError) => {
          errorReturn('startAbilityMultiAppModeTypeError', 'AppServiceExtension_3700', error);
        });
      } catch (error) {
        errorReturn('startAbilityMultiAppModeTypeError', 'AppServiceExtension_3700', error);
      }
    } else if(want.parameters?.TestFlag === 'startAbilityInstancesReachLimitError') {
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextensionrely',
        abilityName: 'MainAbility',
        parameters:{
          [wantConstant.Params.CREATE_APP_INSTANCE_KEY] : true
        }
      };
      for ( let i = 0; i < 2; i++ ) {
        try {
          this.context.startAbility(wantInfo).then(() => {
            hilog.info(0x0000, TAG, `startAbilityInstancesReachLimitError ${i + 1} success`);
          }).catch((error: BusinessError) => {
            hilog.info(0x0000, TAG, `startAbilityInstancesReachLimitError ${i + 1} error: ${JSON.stringify(error)}`);
          });
        } catch (error) {
            hilog.info(0x0000, TAG, `startAbilityInstancesReachLimitError ${i + 1} failed: ${JSON.stringify(error)}`);
        }
        await sleep(1000);
      }
      try {
        this.context.startAbility(wantInfo).then(() => {
          successReturn('startAbilityInstancesReachLimitError', 'AppServiceExtension_3800');
        }).catch((error: BusinessError) => {
          errorReturn('startAbilityInstancesReachLimitError', 'AppServiceExtension_3800', error);
        });
      } catch (error) {
        errorReturn('startAbilityInstancesReachLimitError', 'AppServiceExtension_3800', error);
      }
    } else if(want.parameters?.TestFlag === 'startAbilityAppInstanceKeyInvalid') {
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextensionrely',
        abilityName: 'MainAbility',
        parameters:{
          [wantConstant.Params.APP_INSTANCE_KEY]: 'app_instance_100',
        }
      };
      try {
        this.context.startAbility(wantInfo).then(() => {
          successReturn('startAbilityAppInstanceKeyInvalid', 'AppServiceExtension_3900');
        }).catch((error: BusinessError) => {
          errorReturn('startAbilityAppInstanceKeyInvalid', 'AppServiceExtension_3900', error);
        });
      } catch (error) {
        errorReturn('startAbilityAppInstanceKeyInvalid', 'AppServiceExtension_3900', error);
      }
    } else if(want.parameters?.TestFlag === 'startAbilityAppCloneIndexInvalid') {
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextensionrely2',
        abilityName: 'MainAbility',
        parameters:{
          [wantConstant.Params.APP_CLONE_INDEX_KEY]: 1001,
        }
      };
      try {
        this.context.startAbility(wantInfo).then(() => {
          successReturn('startAbilityAppCloneIndexInvalid', 'AppServiceExtension_4000');
        }).catch((error: BusinessError) => {
          errorReturn('startAbilityAppCloneIndexInvalid', 'AppServiceExtension_4000', error);
        });
      } catch (error) {
        errorReturn('startAbilityAppCloneIndexInvalid', 'AppServiceExtension_4000', error);
      }
    } else if(want.parameters?.TestFlag === 'startAbilityMultiInstanceNotSupported') {
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'EntryAbility',
        parameters:{
          [wantConstant.Params.APP_INSTANCE_KEY]: 'app_instance_0',
        }
      };
      try {
        this.context.startAbility(wantInfo).then(() => {
          successReturn('startAbilityMultiInstanceNotSupported', 'AppServiceExtension_4100');
        }).catch((error: BusinessError) => {
          errorReturn('startAbilityMultiInstanceNotSupported', 'AppServiceExtension_4100', error);
        });
      } catch (error) {
        errorReturn('startAbilityMultiInstanceNotSupported', 'AppServiceExtension_4100', error);
      }
    } else if(want.parameters?.TestFlag === 'startAbilityAppCloneNotSupported') {
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'EntryAbility',
        parameters:{
          [wantConstant.Params.APP_CLONE_INDEX_KEY]: 1,
        }
      };
      try {
        this.context.startAbility(wantInfo).then(() => {
          successReturn('startAbilityAppCloneNotSupported', 'AppServiceExtension_4200');
        }).catch((error: BusinessError) => {
          errorReturn('startAbilityAppCloneNotSupported', 'AppServiceExtension_4200', error);
        });
      } catch (error) {
        errorReturn('startAbilityAppCloneNotSupported', 'AppServiceExtension_4200', error);
      }
    }
  }

  onConnect(want: Want): rpc.RemoteObject {
    hilog.info(0x0000, TAG, `AppService2 onConnect, want: ${JSON.stringify(want)}`);
    return new StubTest('test');
  }

  onDisconnect(want: Want): void {
    hilog.info(0x0000, TAG, `AppService2 onDisconnect, want: ${JSON.stringify(want)}`);
  }

  onDestroy(): void {
    hilog.info(0x0000, TAG, 'AppService2 onDestroy');
  }
};