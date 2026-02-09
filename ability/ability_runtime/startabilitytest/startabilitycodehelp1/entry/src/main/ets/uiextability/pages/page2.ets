import { common, OpenLinkOptions, StartOptions, wantConstant } from '@kit.AbilityKit';
import { BusinessError, commonEventManager, systemParameterEnhance } from '@kit.BasicServicesKit';
import { rpc } from '@kit.IPCKit';

@Entry
@Component
struct page2 {
  @State message: string = 'UIExtAbility';
  context = this.getUIContext().getHostContext() as common.UIExtensionContext

  build() {
    Row() {
      Row() {
        Text('page2')
        Column() {

          Button('connectServiceExtensionAbilityOptions_16000001')
            .onClick(() => {
              let want: Want = {
                bundleName: 'com.example.startabilityerrorcode1',
                abilityName: 'ServiceExtAbility0',
              };
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
                  console.info('onFailed...' + JSON.stringify(code));
                  let options: commonEventManager.CommonEventPublishData = {
                    code: code, // 公共事件的初始代码
                    isOrdered: true   // 有序公共事件
                  }
                  commonEventManager.publish('StartAbility', options, () => {
                  })
                }
              };
              let connection: number;

              try {
                connection = this.context.connectServiceExtensionAbility(want, options);
              } catch (err) {
                // 处理入参错误异常
                let code = (err as BusinessError).code;
                let message = (err as BusinessError).message;
                console.error(`connectServiceExtensionAbility failed, code is ${code}, message is ${message}`);
              }

            })
          Button('connectServiceExtensionAbilityOptions_16000002')
            .onClick(() => {
              let want: Want = {
                bundleName: 'com.example.startabilityerrorcode1',
                abilityName: 'ServiceExtAbility',
              };
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
                  console.info('onFailed...' + JSON.stringify(code));
                  let options: commonEventManager.CommonEventPublishData = {
                    code: code, // 公共事件的初始代码
                    isOrdered: true   // 有序公共事件
                  }
                  commonEventManager.publish('StartAbility', options, () => {
                  })
                }
              };
              let connection: number;

              try {
                connection = this.context.connectServiceExtensionAbility(want, options);
              } catch (err) {
                // 处理入参错误异常
                let code = (err as BusinessError).code;
                let message = (err as BusinessError).message;
                console.error(`connectServiceExtensionAbility failed, code is ${code}, message is ${message}`);
              }

            })

          Button('disconnectServiceExtensionAbilityCallback_16000050')
            .onClick(() => {
              this.context.disconnectServiceExtensionAbility(-1).then(() => {
                // 执行正常业务
                console.info('disconnectServiceExtensionAbility succeed');
              }).catch((err: BusinessError) => {
                // 处理业务逻辑错误
                console.error(`disconnectServiceExtensionAbility failed, code is ${err.code}, message is ${err.message}`);
                let options: commonEventManager.CommonEventPublishData = {
                  code: err.code, // 公共事件的初始代码
                  isOrdered: true   // 有序公共事件
                }
                commonEventManager.publish('StartAbility', options, () => {
                })
              });
            })
          Button('disconnectServiceExtensionAbilityPromise_16000050')
            .onClick(() => {
              this.context.disconnectServiceExtensionAbility(-1, (err: BusinessError) => {
                if (err.code) {
                  // 处理业务逻辑错误
                  console.error(`disconnectServiceExtensionAbility failed, code is ${err.code}, message is ${err.message}`);
                  let options: commonEventManager.CommonEventPublishData = {
                    code: err.code, // 公共事件的初始代码
                    isOrdered: true   // 有序公共事件
                  }
                  commonEventManager.publish('StartAbility', options, () => {
                  })
                }
                // 执行正常业务
                console.info('disconnectServiceExtensionAbility succeed');
              });
            })

          Button('startAbilityStartOptions_16000072')
            .onClick(() => {
              let mpEnable = ''
              try {
                mpEnable = systemParameterEnhance.getSync('const.abilityms.support_multi_instance');
                console.info('wxx systemParameterEnhance.getSync(\'const.abilityms.support_multi_instance\'):' +
                JSON.stringify(systemParameterEnhance.getSync('const.abilityms.support_multi_instance')));
              } catch (err) {
                console.info('wxx err:' + JSON.stringify(err));
                mpEnable = 'false'
              }
              if (mpEnable == 'true') {
                let want: Want = {
                  bundleName: 'com.acts.myapplicationb_201',
                  abilityName: 'EntryAbility2',
                  parameters: {
                    [wantConstant.Params.APP_INSTANCE_KEY]: 'app_instance_0'
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
              } else {
                let options: commonEventManager.CommonEventPublishData = {
                  code: 16000072, // 公共事件的初始代码
                  isOrdered: true   // 有序公共事件
                }
                commonEventManager.publish('StartAbility', options, () => {

                })
              }
            })

          Button('startAbilityStartOptions_16000076')
            .onClick(() => {
              let mpEnable = ''
              try {
                mpEnable = systemParameterEnhance.getSync('const.abilityms.support_multi_instance');
                console.info('wxx systemParameterEnhance.getSync(\'const.abilityms.support_multi_instance\'):' +
                JSON.stringify(systemParameterEnhance.getSync('const.abilityms.support_multi_instance')));
              } catch (err) {
                console.info('wxx err:' + JSON.stringify(err));
                mpEnable = 'false'
              }
              if (mpEnable == 'true') {
                let want: Want = {
                  bundleName: 'com.example.startabilityerrorcode2',
                  abilityName: 'EntryAbility',
                  parameters: {
                    [wantConstant.Params.APP_INSTANCE_KEY]: 'app_instance_100'
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
              } else {
                let options: commonEventManager.CommonEventPublishData = {
                  code: 16000076, // 公共事件的初始代码
                  isOrdered: true   // 有序公共事件
                }
                commonEventManager.publish('StartAbility', options, () => {

                })
              }
            })

          Button('startAbilityStartOptions_16000077')
            .onClick(() => {
              let mpEnable = ''
              try {
                mpEnable = systemParameterEnhance.getSync('const.abilityms.support_multi_instance');
                console.info('wxx systemParameterEnhance.getSync(\'const.abilityms.support_multi_instance\'):' +
                JSON.stringify(systemParameterEnhance.getSync('const.abilityms.support_multi_instance')));
              } catch (err) {
                console.info('wxx err:' + JSON.stringify(err));
                mpEnable = 'false'
              }
              if (mpEnable == 'true') {
                let want: Want = {
                  bundleName: 'com.example.startabilityerrorcode2',
                  abilityName: 'EntryAbility',
                  parameters: {
                    [wantConstant.Params.CREATE_APP_INSTANCE_KEY]: true
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
              } else {
                let options: commonEventManager.CommonEventPublishData = {
                  code: 16000077, // 公共事件的初始代码
                  isOrdered: true   // 有序公共事件
                }
                commonEventManager.publish('StartAbility', options, () => {

                })
              }
            })

          Button('startAbilityStartOptions_16000078')
            .onClick(() => {
              let mpEnable = ''
              try {
                mpEnable = systemParameterEnhance.getSync('const.abilityms.support_multi_instance');
                console.info('wxx systemParameterEnhance.getSync(\'const.abilityms.support_multi_instance\'):' +
                JSON.stringify(systemParameterEnhance.getSync('const.abilityms.support_multi_instance')));
              } catch (err) {
                console.info('wxx err:' + JSON.stringify(err));
                mpEnable = 'false'
              }
              if (mpEnable == 'false') {
                let want: Want = {
                  bundleName: 'com.example.startabilityerrorcode2',
                  abilityName: 'EntryAbility',
                  parameters: {
                    [wantConstant.Params.CREATE_APP_INSTANCE_KEY]: true
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
              } else {
                let options: commonEventManager.CommonEventPublishData = {
                  code: 16000078, // 公共事件的初始代码
                  isOrdered: true   // 有序公共事件
                }
                commonEventManager.publish('StartAbility', options, () => {

                })
              }
            })
          Button('startAbilityStartOptions_16000079')
            .onClick(() => {
              let mpEnable = ''
              try {
                mpEnable = systemParameterEnhance.getSync('const.abilityms.support_multi_instance');
                console.info('wxx systemParameterEnhance.getSync(\'const.abilityms.support_multi_instance\'):' +
                JSON.stringify(systemParameterEnhance.getSync('const.abilityms.support_multi_instance')));
              } catch (err) {
                console.info('wxx err:' + JSON.stringify(err));
                mpEnable = 'false'
              }
              if (mpEnable == 'true') {
                let want: Want = {
                  bundleName: 'com.example.startabilityerrorcode2',
                  abilityName: 'EntryAbility',
                  parameters: {
                    [wantConstant.Params.CREATE_APP_INSTANCE_KEY]: true,
                    [wantConstant.Params.APP_INSTANCE_KEY]: 'app_instance_0',
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
              } else {
                let options: commonEventManager.CommonEventPublishData = {
                  code: 16000079, // 公共事件的初始代码
                  isOrdered: true   // 有序公共事件
                }
                commonEventManager.publish('StartAbility', options, () => {

                })
              }
            })
          Button('startAbilityStartOptions_16000080')
            .onClick(() => {
              let mpEnable = ''
              try {
                mpEnable = systemParameterEnhance.getSync('const.abilityms.support_multi_instance');
                console.info('wxx systemParameterEnhance.getSync(\'const.abilityms.support_multi_instance\'):' +
                JSON.stringify(systemParameterEnhance.getSync('const.abilityms.support_multi_instance')));
              } catch (err) {
                console.info('wxx err:' + JSON.stringify(err));
                mpEnable = 'false'
              }
              if (mpEnable == 'true') {
                let want: Want = {
                  bundleName: 'com.example.startabilityerrorcode1',
                  abilityName: 'EntryAbility',
                  parameters: {
                    [wantConstant.Params.CREATE_APP_INSTANCE_KEY]: true
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
              } else {
                let options: commonEventManager.CommonEventPublishData = {
                  code: 16000080, // 公共事件的初始代码
                  isOrdered: true   // 有序公共事件
                }
                commonEventManager.publish('StartAbility', options, () => {

                })
              }
            })

        }.alignItems(HorizontalAlign.Start)
      }
    }
    .height('100%')
  }
}

