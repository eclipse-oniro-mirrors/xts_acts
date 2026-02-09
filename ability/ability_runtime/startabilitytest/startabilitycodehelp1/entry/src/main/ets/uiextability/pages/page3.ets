import { common, OpenLinkOptions, StartOptions, wantConstant } from '@kit.AbilityKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { rpc } from '@kit.IPCKit';

@Entry
@Component
struct page3 {
  @State message: string = 'UIExtAbility';
  context = this.getUIContext().getHostContext() as common.UIExtensionContext

  build() {
    Row() {
      Text('UIExtAbilityPage')
      Row() {
        Column() {
          Button('startAbilityForResultOptions_16000001')
            .onClick(() => {
              let want: Want = {
                bundleName: 'com.example.startabilityerrorcode1',
                abilityName: 'EntryAbility0',
              };
              let options: StartOptions = {
                displayId: 0
              };
              this.context.startAbilityForResult(want, options, (err: BusinessError, result: common.AbilityResult) => {
                if (err.code) {
                  // 处理业务逻辑错误
                  console.error(`startAbilityForResult failed, code is ${err.code}, message is ${err.message}`);
                  let options: commonEventManager.CommonEventPublishData = {
                    code: err.code, // 公共事件的初始代码
                    isOrdered: true   // 有序公共事件
                  }
                  commonEventManager.publish('StartAbility', options, () => {

                  })
                }
              });
            })
          Button('startAbilityForResultOptions_16000004')
            .onClick(() => {
              let want: Want = {
                bundleName: 'com.example.startabilityerrorcode1',
                abilityName: 'EntryAbility1',
              };
              let options: StartOptions = {
                displayId: 0
              };
              this.context.startAbilityForResult(want, options, (err: BusinessError, result: common.AbilityResult) => {
                if (err.code) {
                  // 处理业务逻辑错误
                  console.error(`startAbilityForResult failed, code is ${err.code}, message is ${err.message}`);
                  let options: commonEventManager.CommonEventPublishData = {
                    code: err.code, // 公共事件的初始代码
                    isOrdered: true   // 有序公共事件
                  }
                  commonEventManager.publish('StartAbility', options, () => {

                  })
                }
              });
            })
          Button('startAbilityForResultOptions_16000019')
            .onClick(() => {
              let want: Want = {
                action: ''
              };
              let options: StartOptions = {
                displayId: 0
              };
              this.context.startAbilityForResult(want, options, (err: BusinessError, result: common.AbilityResult) => {
                if (err.code) {
                  // 处理业务逻辑错误
                  console.error(`startAbilityForResult failed, code is ${err.code}, message is ${err.message}`);
                  let options: commonEventManager.CommonEventPublishData = {
                    code: err.code, // 公共事件的初始代码
                    isOrdered: true   // 有序公共事件
                  }
                  commonEventManager.publish('StartAbility', options, () => {

                  })
                }
              });
            })
          Button('startAbilityForResultOptions_16000050')
            .onClick(() => {
              let want: Want = {
                bundleName: 'com.example.startabilityerrorcode1',
                abilityName: 'EntryAbility2',
                parameters: {
                  'keyFd': {
                    'type': 'FD',
                    'value': -1
                  }
                }
              };
              let options: StartOptions = {
                displayId: 0
              };
              this.context.startAbilityForResult(want, options, (err: BusinessError, result: common.AbilityResult) => {
                if (err.code) {
                  // 处理业务逻辑错误
                  console.error(`startAbilityForResult failed, code is ${err.code}, message is ${err.message}`);
                  let options: commonEventManager.CommonEventPublishData = {
                    code: err.code, // 公共事件的初始代码
                    isOrdered: true   // 有序公共事件
                  }
                  commonEventManager.publish('StartAbility', options, () => {

                  })
                }
              });
            })
          Button('startAbilityForResultOptions_16000073')
            .onClick(() => {
              let invalidAppCloneIndex: number = -1;
              let want: Want = {
                bundleName: 'com.example.startabilityerrorcode1',
                abilityName: 'EntryAbility1',
                parameters: {
                  [wantConstant.Params.APP_CLONE_INDEX_KEY]: invalidAppCloneIndex
                }
              };
              let options: StartOptions = {
                displayId: 0
              };
              this.context.startAbilityForResult(want, options, (err: BusinessError, result: common.AbilityResult) => {
                if (err.code) {
                  // 处理业务逻辑错误
                  console.error(`startAbilityForResult failed, code is ${err.code}, message is ${err.message}`);
                  let options: commonEventManager.CommonEventPublishData = {
                    code: err.code, // 公共事件的初始代码
                    isOrdered: true   // 有序公共事件
                  }
                  commonEventManager.publish('StartAbility', options, () => {

                  })
                }
              });
            })


          Button('startAbilityForResultPromise_16000001')
            .onClick(() => {
              let want: Want = {
                bundleName: 'com.example.startabilityerrorcode1',
                abilityName: 'EntryAbility0',
              };
              let options: StartOptions = {
                displayId: 0
              };
              this.context.startAbilityForResult(want, options)
                .then(() => {
                  // 执行正常业务
                  console.info('startAbility succeed');
                })
                .catch((err: BusinessError) => {
                  console.info('wxx err:' + JSON.stringify(err));

                  // 处理业务逻辑错误
                  let options: commonEventManager.CommonEventPublishData = {
                    code: err.code, // 公共事件的初始代码
                    isOrdered: true   // 有序公共事件
                  }
                  commonEventManager.publish('StartAbility', options, () => {

                  })
                });
            })
          Button('startAbilityForResultPromise_16000004')
            .onClick(() => {
              let want: Want = {
                bundleName: 'com.example.startabilityerrorcode1',
                abilityName: 'EntryAbility1',
              };
              let options: StartOptions = {
                displayId: 0
              };
              this.context.startAbilityForResult(want, options)
                .then(() => {
                  // 执行正常业务
                  console.info('startAbility succeed');
                })
                .catch((err: BusinessError) => {
                  console.info('wxx err:' + JSON.stringify(err));

                  // 处理业务逻辑错误
                  let options: commonEventManager.CommonEventPublishData = {
                    code: err.code, // 公共事件的初始代码
                    isOrdered: true   // 有序公共事件
                  }
                  commonEventManager.publish('StartAbility', options, () => {

                  })
                });
            })
          Button('startAbilityForResultPromise_16000019')
            .onClick(() => {
              let want: Want = {
                action: ''
              };
              let options: StartOptions = {
                displayId: 0
              };
              this.context.startAbilityForResult(want, options)
                .then(() => {
                  // 执行正常业务
                  console.info('startAbility succeed');
                })
                .catch((err: BusinessError) => {
                  console.info('wxx err:' + JSON.stringify(err));

                  // 处理业务逻辑错误
                  let options: commonEventManager.CommonEventPublishData = {
                    code: err.code, // 公共事件的初始代码
                    isOrdered: true   // 有序公共事件
                  }
                  commonEventManager.publish('StartAbility', options, () => {

                  })
                });
            })
          Button('startAbilityForResultPromise_16000050')
            .onClick(() => {
              let want: Want = {
                bundleName: 'com.example.startabilityerrorcode1',
                abilityName: 'EntryAbility2',
                parameters: {
                  'keyFd': {
                    'type': 'FD',
                    'value': -1
                  }
                }
              };
              let options: StartOptions = {
                displayId: 0
              };
              this.context.startAbilityForResult(want, options)
                .then(() => {
                  // 执行正常业务
                  console.info('startAbility succeed');
                })
                .catch((err: BusinessError) => {
                  console.info('wxx err:' + JSON.stringify(err));

                  // 处理业务逻辑错误
                  let options: commonEventManager.CommonEventPublishData = {
                    code: err.code, // 公共事件的初始代码
                    isOrdered: true   // 有序公共事件
                  }
                  commonEventManager.publish('StartAbility', options, () => {

                  })
                });
            })
          Button('startAbilityForResultPromise_16000073')
            .onClick(() => {
              let invalidAppCloneIndex: number = -1;
              let want: Want = {
                bundleName: 'com.example.startabilityerrorcode1',
                abilityName: 'EntryAbility1',
                parameters: {
                  [wantConstant.Params.APP_CLONE_INDEX_KEY]: invalidAppCloneIndex
                }
              };
              let options: StartOptions = {
                displayId: 0
              };
              this.context.startAbilityForResult(want, options)
                .then(() => {
                  // 执行正常业务
                  console.info('startAbility succeed');
                })
                .catch((err: BusinessError) => {
                  console.info('wxx err:' + JSON.stringify(err));

                  // 处理业务逻辑错误
                  let options: commonEventManager.CommonEventPublishData = {
                    code: err.code, // 公共事件的初始代码
                    isOrdered: true   // 有序公共事件
                  }
                  commonEventManager.publish('StartAbility', options, () => {

                  })
                });
            })


        }.alignItems(HorizontalAlign.Start)
      }
    }
    .height('100%')
  }
}

