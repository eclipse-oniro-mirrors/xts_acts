import { common, OpenLinkOptions, StartOptions, wantConstant } from '@kit.AbilityKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { rpc } from '@kit.IPCKit';

@Entry
@Component
struct UIExtAbilityPage {
  @State message: string = 'UIExtAbility';
  context = this.getUIContext().getHostContext() as common.UIExtensionContext

  build() {
    Row() {
      Text('UIExtAbilityPage')
      Row() {
        Column() {
          Button('startAbilityStartOptions_16000001')
            .onClick(() => {
              console.error('UIExtAbility startAbilityStartOptions_16000001 button')
              let want: Want = {
                bundleName: 'com.example.startabilityerrorcode1',
                abilityName: 'EntryAbility0',
              };
              let options: StartOptions = {
                displayId: 0
              };
              this.context.startAbility(want, options)
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
          Button('startAbilityStartOptions_16000004')
            .onClick(() => {
              console.error('UIExtAbility startAbilityStartOptions_16000004 button')
              let want: Want = {
                bundleName: 'com.example.startabilityerrorcode1',
                abilityName: 'EntryAbility1',
              };
              let options: StartOptions = {
                displayId: 0
              };
              this.context.startAbility(want, options)
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

          Button('startAbilityStartOptions_16000019')
            .onClick(() => {
              let want: Want = {
                action: 'ohos.account.appAccount.action.oauth',
              };
              let options: StartOptions = {
                displayId: 0
              };
              this.context.startAbility(want, options)
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
          Button('startAbilityStartOptions_16000050')
            .onClick(() => {
              let want: Want = {
                bundleName: 'com.example.startabilityerrorcode1',
                abilityName: 'EntryAbility2',
                parameters: {
                  'keyFd': {
                    'type': 'FD',
                    'value': '-1'
                  }
                }
              };
              let options: StartOptions = {
                displayId: 0
              };
              this.context.startAbility(want, options)
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
          Button('startAbilityStartOptions_16000073')
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
              this.context.startAbility(want, options)
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
          Button('openLink_16000004')
            .onClick(() => {
              let openLinkOptions: OpenLinkOptions = {
                appLinkingOnly: false,
              };
              this.context.openLink('example://test.open.link:8080/test', openLinkOptions)
                .then(() => {
                  console.log('openLink jump success')
                }).catch((err: BusinessError) => {
                console.error('openLink failed error code=>' + JSON.stringify(err))
                let options: commonEventManager.CommonEventPublishData = {
                  code: err.code, // 公共事件的初始代码
                  isOrdered: true   // 有序公共事件
                }
                commonEventManager.publish('StartAbility', options, () => {

                })
              })
            })
          Button('openLink_16000019')
            .onClick(() => {
              let openLinkOptions: OpenLinkOptions = {
                appLinkingOnly: false,
              };
              this.context.openLink('example://test.open.link:8080/test0', openLinkOptions)
                .then(() => {
                  console.log('openLink jump success')
                }).catch((err: BusinessError) => {
                console.error('openLink failed error code=>' + JSON.stringify(err))
                let options: commonEventManager.CommonEventPublishData = {
                  code: err.code, // 公共事件的初始代码
                  isOrdered: true   // 有序公共事件
                }
                commonEventManager.publish('StartAbility', options, () => {

                })
              })
            })

          Button('startAbilityForResultCallback_16000001')
            .onClick(() => {
              let want: Want = {
                bundleName: 'com.example.startabilityerrorcode1',
                abilityName: 'EntryAbility0',
              };
              this.context.startAbilityForResult(want, (err: BusinessError, result: common.AbilityResult) => {
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
          Button('startAbilityForResultCallback_16000004')
            .onClick(() => {
              let want: Want = {
                bundleName: 'com.example.startabilityerrorcode1',
                abilityName: 'EntryAbility1',
              };
              this.context.startAbilityForResult(want, (err: BusinessError, result: common.AbilityResult) => {
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
          Button('startAbilityForResultCallback_16000019')
            .onClick(() => {
              let want: Want = {
                action: ''
              };
              this.context.startAbilityForResult(want, (err: BusinessError, result: common.AbilityResult) => {
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
          Button('startAbilityForResultCallback_16000050')
            .onClick(() => {
              let want: Want = {
                bundleName: 'com.example.startabilityerrorcode1',
                abilityName: 'EntryAbility2',
                parameters: {
                  'keyFd': {
                    'type': 'FD',
                    'value': 'err'
                  }
                }
              };
              this.context.startAbilityForResult(want, (err: BusinessError, result: common.AbilityResult) => {
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
          Button('startAbilityForResultCallback_16000073')
            .onClick(() => {
              let invalidAppCloneIndex: number = -1;
              let want: Want = {
                bundleName: 'com.example.startabilityerrorcode1',
                abilityName: 'EntryAbility1',
                parameters: {
                  [wantConstant.Params.APP_CLONE_INDEX_KEY]: invalidAppCloneIndex
                }
              };
              this.context.startAbilityForResult(want, (err: BusinessError, result: common.AbilityResult) => {
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


        }.alignItems(HorizontalAlign.Start)
      }
    }
    .height('100%')
  }
}

