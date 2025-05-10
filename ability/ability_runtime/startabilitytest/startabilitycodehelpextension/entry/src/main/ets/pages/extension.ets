import { BusinessError, commonEventManager, systemParameterEnhance } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';
import { rpc } from '@kit.IPCKit';

@Entry
@Component
struct Extension {
  @State message: string = 'Hello World';
  context = this.getUIContext().getHostContext() as common.UIExtensionContext

  build() {
    Column({ space: 10 }) {
      Button('startUIServiceExtensionAbility 801')
        .onClick(() => {
          let tag = 'UIExtension_startUIServiceExtensionAbility_801'
          let want: Want = {
            bundleName: 'com.example.myapplication1',
            abilityName: 'UIServiceAbility'
          }
          this.context.startUIServiceExtensionAbility(want)
            .then(() => {
              console.log(`${tag}-try to startUIServiceExtensionAbility`);
            }).catch((err: Error) => {
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.log(`${tag}-startUIServiceExtensionAbility failed, code is ${code}, message is ${message}`);
            let options: commonEventManager.CommonEventPublishData = {
              code: code
            }
            commonEventManager.publish('UIExtension_startUIServiceExtensionAbility_801', options, (err) => {
              console.info(`${tag}-commonEventManager.publish error` + JSON.stringify(err));
            });
          });

        })
      Button('startUIServiceExtensionAbility 16000001')
        .onClick(() => {
          let tag = 'UIExtension_startUIServiceExtensionAbility_16000001'
          // want 内容不存在
          let want: Want = {
            bundleName: 'com.acts.myapplicationb',
            abilityName: 'UIServiceAbility1'
          }
          this.context.startUIServiceExtensionAbility(want)
            .then(() => {
              console.log(`${tag}-try to startUIServiceExtensionAbility`);
            }).catch((err: Error) => {
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.log(`${tag}-startUIServiceExtensionAbility 16000001 failed, code is ${code}, message is ${message}`);
            let options: commonEventManager.CommonEventPublishData = {
              code: code
            }
            commonEventManager.publish('UIExtension_startUIServiceExtensionAbility_16000001', options, (err) => {
              console.info(`${tag}-commonEventManager.publish error` + JSON.stringify(err));
            });
          });
        })

      Button('startUIServiceExtensionAbility 16000002')
        .onClick(() => {
          let tag = 'UIExtension_startUIServiceExtensionAbility_16000002'
          let want: Want = {
            bundleName: 'com.example.myapplication1',
            abilityName: 'EntryBackupAbility'
          }
          this.context.startUIServiceExtensionAbility(want)
            .then(() => {
              console.log(`${tag}-try to startUIServiceExtensionAbility`);
            }).catch((err: Error) => {
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.log(`${tag}-startUIServiceExtensionAbility 16000002 failed, code is ${code}, message is ${message}`);
            let options: commonEventManager.CommonEventPublishData = {
              code: code
            }
            commonEventManager.publish('UIExtension_startUIServiceExtensionAbility_16000002', options, (err) => {
              console.info(`${tag}-commonEventManager.publish error` + JSON.stringify(err));
            });
          });
        })
      Button('connectUIServiceExtensionAbility 16000019')
        .onClick(() => {
          let tag = 'UIExtension_connectUIServiceExtensionAbility_16000019'
          let want: Want = {
            entities: [
              'abc'
            ],
            action: 'bca'
          }
          let dataCallBack: common.UIServiceExtensionConnectCallback = {
            onData: (data: Record<string, Object>) => {
              console.log(`${tag}-dataCallBack received data`, JSON.stringify(data));
            },
            onDisconnect: () => {
              console.log(`${tag}-dataCallBack onDisconnect`);
            }
          }
          this.context.connectUIServiceExtensionAbility(want,
            dataCallBack)
            .then((proxy: common.UIServiceProxy) => {
              console.log(`${tag}-try to connectUIServiceExtensionAbility`, JSON.stringify(proxy));
            }).catch((err: Error) => {
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.log(`${tag}-connectUIServiceExtensionAbility failed, code is ${code}, message is ${message}`);
            commonEventManager.publish('UIExtension_connectUIServiceExtensionAbility_16000019', { code: code },
              (err) => {
                console.info(`${tag}-commonEventManager.publish error` + JSON.stringify(err));
              });
          });
        })

      Button('connectUIServiceExtensionAbility 16000001')
        .onClick(() => {
          let tag = 'UIExtension_connectUIServiceExtensionAbility_16000001'
          let want: Want = {
            bundleName: 'com.example.myapplication1',
            abilityName: 'UIServiceAbility1'
          }
          let dataCallBack: common.UIServiceExtensionConnectCallback = {
            onData: (data: Record<string, Object>) => {
              console.log(`${tag}-dataCallBack received data`, JSON.stringify(data));
            },
            onDisconnect: () => {
              console.log(`${tag}-dataCallBack onDisconnect`);
            }
          }
          this.context.connectUIServiceExtensionAbility(want,
            dataCallBack)
            .then((proxy: common.UIServiceProxy) => {
              console.log(`${tag}-try to connectUIServiceExtensionAbility`, JSON.stringify(proxy));
            }).catch((err: Error) => {
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.log(`${tag}-connectUIServiceExtensionAbility failed, code is ${code}, message is ${message}`);
            commonEventManager.publish('UIExtension_connectUIServiceExtensionAbility_16000001', { code: code },
              (err) => {
                console.info(`${tag}-commonEventManager.publish error` + JSON.stringify(err));
              });
          });
        })

      Button('connectServiceExtensionAbility 16000002')
        .onClick(() => {
          // want 启动本应用 一个不存在的ServiceAbility
          let tag = 'UIExtension_connectUIServiceExtensionAbility_16000002'
          let want: Want = {
            bundleName: 'com.example.myapplication1',
            abilityName: 'EntryFormAbility'
          }
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
              commonEventManager.publish('UIExtension_connectUIServiceExtensionAbility_16000002', { code: code },
                (err) => {
                  console.info(`${tag}-commonEventManager.publish error` + JSON.stringify(err));
                });
            }
          };
          try {
            this.context.connectServiceExtensionAbility(want, options)
          } catch (err) {
            console.error(`connectServiceExtensionAbility failed, error is ${JSON.stringify(err)}`);
          }
        })
      Button('connectUIServiceExtensionAbility 16000050')
        .onClick(() => {
          let tag = 'UIExtension_connectUIServiceExtensionAbility_16000050'
          let want: Want = {
            bundleName: 'com.acts.myapplicationb',
            abilityName: 'UIServiceExtAbility'
          }
          let dataCallBack: common.UIServiceExtensionConnectCallback = {
            onData: (data: Record<string, Object>) => {
              console.log(`${tag}-dataCallBack received data`, JSON.stringify(data));
            },
            onDisconnect: () => {
              console.log(`${tag}-dataCallBack onDisconnect`);
            }
          }
          this.context.connectUIServiceExtensionAbility(want,
            dataCallBack)
            .then((proxy: common.UIServiceProxy) => {
              console.log(`${tag}-try to connectUIServiceExtensionAbility`, JSON.stringify(proxy));
            }).catch((err: Error) => {
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.log(`${tag}-connectUIServiceExtensionAbility failed, code is ${code}, message is ${message}`);
            commonEventManager.publish('UIExtension_connectUIServiceExtensionAbility_16000050', { code: code },
              (err) => {
                console.info(`${tag}-commonEventManager.publish error` + JSON.stringify(err));
              });
          });
        })

      Button('connectUIServiceExtensionAbility 801')
        .onClick(() => {
          let tag = 'UIExtension_connectUIServiceExtensionAbility_801'
          let want: Want = {
            bundleName: 'com.acts.myapplicationb',
            abilityName: 'UIServiceExtAbility'
          }
          let dataCallBack: common.UIServiceExtensionConnectCallback = {
            onData: (data: Record<string, Object>) => {
              console.log(`${tag}-dataCallBack received data`, JSON.stringify(data));
            },
            onDisconnect: () => {
              console.log(`${tag}-dataCallBack onDisconnect`);
            }
          }
          this.context.connectUIServiceExtensionAbility(want,
            dataCallBack)
            .then((proxy: common.UIServiceProxy) => {
              console.log(`${tag}-try to connectUIServiceExtensionAbility`, JSON.stringify(proxy));
            }).catch((err: Error) => {
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.log(`${tag}-connectUIServiceExtensionAbility failed, code is ${code}, message is ${message}`);
            commonEventManager.publish('UIExtension_connectUIServiceExtensionAbility_801', { code: code }, (err) => {
              console.info(`${tag}-commonEventManager.publish error` + JSON.stringify(err));
            });
          });
        })
    }
    .height('100%')
    .width('100%')
  }
}