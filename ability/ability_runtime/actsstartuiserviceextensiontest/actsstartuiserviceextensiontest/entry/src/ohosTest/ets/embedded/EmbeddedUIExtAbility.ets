import { EmbeddedUIExtensionAbility, UIExtensionContentSession, Want } from '@kit.AbilityKit';
import { commonEventManager } from '@kit.BasicServicesKit';
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';

const TAG: string = '[ExampleEmbeddedAbility]'

export default class ExampleEmbeddedAbility extends EmbeddedUIExtensionAbility {
  onCreate() {
    console.log(TAG, `onCreate`);
  }

  onForeground() {
    console.log(TAG, `onForeground`);
  }

  onBackground() {
    console.log(TAG, `onBackground`);
  }

  onDestroy() {
    console.log(TAG, `onDestroy`);
  }

  onSessionCreate(want: Want, session: UIExtensionContentSession) {
    console.log(TAG, `onSessionCreate, want: ${JSON.stringify(want)}`);
    let param: Record<string, UIExtensionContentSession> = {
      'session': session
    };
    let tag = want?.parameters?.caseName as string;
    hilog.info(0x0000, TAG, '%{public}s', `onSessionCreate tag: ${tag}`);
    let storage: LocalStorage = new LocalStorage(param);
    if(want?.parameters?.case == 'startUIService'){
      hilog.info(0x0000, tag, '%{public}s', `startUIService with param: ${JSON.stringify(want?.parameters?.param)}`);
      try{
        let param = want?.parameters?.param;
        this.context.startUIServiceExtensionAbility(param).then((data)=>{
          hilog.info(0x0000, tag, '%{public}s', `startUIServiceExtensionAbility success: ${JSON.stringify(data)}`);
        }).catch((err:BusinessError)=>{
          hilog.info(0x0000, tag, '%{public}s', `startUIServiceExtensionAbility failed: ${JSON.stringify(err)}`);
        })
      }catch(err){
        hilog.error(0x0000, tag, '%{public}s', `startUIServiceExtensionAbility catch failed, code is ${JSON.stringify(err)}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish(tag, commonEventData, (result) => {
          hilog.info(0x0000, tag, '%{public}s', `publish event result: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }

    }else if(want?.parameters?.case == 'connectUIService'){
      hilog.info(0x0000, tag, '%{public}s', `connectUIService with param: ${JSON.stringify(want?.parameters?.param)}`);
      try{
        let param = want?.parameters?.param;
        let dataCallBack : common.UIServiceExtensionConnectCallback = {
          // 接收数据
          onData: (data: Record<string, Object>) => {
            hilog.info(0x0000, tag, '%{public}s', `dataCallBack received data: ${JSON.stringify(data)}`);
          },
          // 连接断开
          onDisconnect: () => {
            hilog.info(0x0000, tag, '%{public}s', `dataCallBack onDisconnect`);
          }
        }
        this.context.connectUIServiceExtensionAbility(param, dataCallBack).then((proxy: common.UIServiceProxy)=>{
          hilog.info(0x0000, tag, '%{public}s', `connectUIServiceExtensionAbility success: ${JSON.stringify(proxy)}`);
        }).catch((err:BusinessError)=>{
          hilog.info(0x0000, tag, '%{public}s', `connectUIServiceExtensionAbility failed: ${JSON.stringify(err)}`);
        })
      }catch(err){
        hilog.error(0x0000, tag, '%{public}s', `connectUIServiceExtensionAbility catch failed, code is ${JSON.stringify(err)}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish(tag, commonEventData, (result) => {
          hilog.info(0x0000, tag, '%{public}s', `publish event result: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }

    }else if(want?.parameters?.case == 'disconnectUIServiceNull'){
      hilog.info(0x0000, tag, '%{public}s', `disconnectUIServiceNull with param: null`);
      try{
        this.context.disconnectUIServiceExtensionAbility(null)
        .then(() => {
          hilog.info(0x0000, tag, '%{public}s', `disconnectUIServiceExtensionAbility succeed`);
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, tag, '%{public}s', `disconnectUIServiceExtensionAbility failed: ${JSON.stringify(err)}`);
        });
      }catch(err){
        hilog.error(0x0000, tag, '%{public}s', `disconnectUIServiceExtensionAbility catch failed, code is ${JSON.stringify(err)}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish(tag, commonEventData, (result) => {
          hilog.info(0x0000, tag, '%{public}s', `publish event result: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }

    }else if(want?.parameters?.case == 'disconnectUIServiceUndefined'){
      hilog.info(0x0000, tag, '%{public}s', `disconnectUIServiceUndefined with param: undefined`);
      try{
        this.context.disconnectUIServiceExtensionAbility(undefined)
        .then(() => {
          hilog.info(0x0000, tag, '%{public}s', `disconnectUIServiceExtensionAbility succeed`);
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, tag, '%{public}s', `disconnectUIServiceExtensionAbility failed: ${JSON.stringify(err)}`);
        });
      }catch(err){
        hilog.error(0x0000, tag, '%{public}s', `disconnectUIServiceExtensionAbility catch failed, code is ${JSON.stringify(err)}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish(tag, commonEventData, (result) => {
          hilog.info(0x0000, tag, '%{public}s', `publish event result: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }

    }
    session.loadContent('testability/pages/Index', storage);
  }

  onSessionDestroy(session: UIExtensionContentSession) {
    console.log(TAG, `onSessionDestroy`);
  }
}