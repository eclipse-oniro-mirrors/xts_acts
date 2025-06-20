import { Want, Configuration,common } from '@kit.AbilityKit';
import AppServiceExtensionAbility from '@ohos.app.ability.AppServiceExtensionAbility'
import { rpc } from '@kit.IPCKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError,commonEventManager } from '@kit.BasicServicesKit';

const TAG: string = '[AppServiceExtAbility]';
const TAG2: string = '[AppServiceExtContext]';
const DOMAIN_NUMBER: number = 0xFF00

class StubTest extends rpc.RemoteObject{
  constructor(des: string) {
    hilog.info(0x0000, TAG, '%{public}s', ' StubTest');
    super(des);
  }
  onConnect(code: number, data: rpc.MessageSequence, reply: rpc.MessageSequence, option: rpc.MessageOption) {
    hilog.info(0x0000, TAG, '%{public}s', ' StubTest onConnect');
  }
}

function sleep(time:number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve('ok');
    }, time)
  });
}

export default class AppServiceExtAbility extends AppServiceExtensionAbility {

  onCreate(want: Want): void {
    hilog.info(DOMAIN_NUMBER, TAG, `onCreate, want: ${want.abilityName}`);
    hilog.info(DOMAIN_NUMBER, TAG2, `cacheDir: ${this.context.cacheDir}`);
    hilog.info(DOMAIN_NUMBER, TAG2, `resourceDir: ${this.context.resourceDir}`);
    hilog.info(DOMAIN_NUMBER, TAG2, `filesDir: ${this.context.filesDir}`);
    hilog.info(DOMAIN_NUMBER, TAG2, `databaseDir: ${this.context.databaseDir}`);
    hilog.info(DOMAIN_NUMBER, TAG2, `preferencesDir: ${this.context.preferencesDir}`);
    hilog.info(DOMAIN_NUMBER, TAG2, `bundleCodeDir: ${this.context.bundleCodeDir}`);
    hilog.info(DOMAIN_NUMBER, TAG2, `distributedFilesDir: ${this.context.distributedFilesDir}`);
    hilog.info(DOMAIN_NUMBER, TAG2, `cloudFileDir: ${this.context.cloudFileDir}`);
    hilog.info(DOMAIN_NUMBER, TAG2, `eventHub: ${this.context.eventHub}`);
    hilog.info(DOMAIN_NUMBER, TAG2, `area: ${this.context.area}`);
    hilog.info(DOMAIN_NUMBER, TAG2, `processName: ${this.context.processName}`);
  };

  async  onRequest(want: Want, startId: number) {
    hilog.info(DOMAIN_NUMBER, TAG, `onRequest, want: ${want.abilityName}`);
    let commRemote: rpc.IRemoteObject;
    let options: common.ConnectOptions = {
      onConnect(elementName, remote) {
        commRemote = remote;
        console.info('onConnect...');
      },
      onDisconnect(elementName) {
        console.info('onDisconnect...');
      },
      onFailed(code) {
        console.info('onFailed...');
        if(code === 801) {
          let commonEventData: commonEventManager.CommonEventPublishData = {
            parameters: {
              'result': 801
            }
          }
          commonEventManager.publish('commonEventManager_0600', commonEventData, (result) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `onConnect50--:--:${JSON.stringify(result)}`);
          });
        }
      }
    };
    console.info('want.parameters', want.parameters);
    if (want.parameters?.case === '0600') {
      let wantInfo: Want = {
        deviceId: '',
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'ServiceExtensionAbility'
      };
      try {
        let connection = this.context.connectServiceExtensionAbility(wantInfo, options);
        await sleep(2000);
        this.context.disconnectServiceExtensionAbility(connection).then(() => {
          hilog.info(0x0000, TAG, '----------- disconnectServiceExtensionAbility success -----------');
          let commonEventData: commonEventManager.CommonEventPublishData = {
            parameters: {
              'result': 200
            }
          }
          commonEventManager.publish('commonEventManager_0600', commonEventData, (result) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `onConnect50--:--:${JSON.stringify(result)}`);
            this.context.terminateSelf();
          });
        }).catch((error: BusinessError) => {
          hilog.error(0x0000, TAG, `disconnectServiceExtensionAbility failed, error.code: ${error.code}, error.message: ${error.message}`);
        });
      } catch (error) {
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': error?.code
          }
        }
        commonEventManager.publish('commonEventManager_0600', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect50--:--:${JSON.stringify(result)}`);
          this.context.terminateSelf();
        });
      }
    }else if(want.parameters?.case === '0700') {
      let wantInfo: Want = {
        deviceId: '',
        bundleName: 'com.acts.context.aappserviceextensionError',
        abilityName: 'ServiceExtensionAbility'
      };
      try {
        this.context.connectServiceExtensionAbility(wantInfo, options);
      } catch (error) {
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': error?.code
          }
        }
        commonEventManager.publish('commonEventManager_0700', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect50--:--:${JSON.stringify(result)}`);
          this.context.terminateSelf();
        });
      }
    }else if(want.parameters?.case === '0800') {
      try {
        this.context.disconnectServiceExtensionAbility(-1);
      } catch (error) {
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': error?.code
          }
        }
        commonEventManager.publish('commonEventManager_0800', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect50--:--:${JSON.stringify(result)}`);
          this.context.terminateSelf();
        });
      }
    }
  }

  onConnect(want: Want): rpc.RemoteObject {
    hilog.info(DOMAIN_NUMBER, TAG, `onConnect, want: ${want.abilityName}`);
    switch (want.parameters?.h) {
      case '1' :

        break;
      case '1' :

        break;
      default :
        break;
    }

    return new StubTest('test');
  };

  onDisconnect(want: Want): void {
    hilog.info(DOMAIN_NUMBER, TAG, `onDis connect, want: ${want.abilityName}`);
  };

  onDestroy(): void {
    hilog.info(DOMAIN_NUMBER, TAG, 'onDestroy');
  };

  onConfigurationUpdate(newConfig: Configuration) {
    console.log(`onConfigurationUpdate, config: ${JSON.stringify(newConfig)}`);
  }

  onDump(params: Array<string>) {
    console.log(`dump, params: ${JSON.stringify(params)}`);
    return ['params'];
  }

};