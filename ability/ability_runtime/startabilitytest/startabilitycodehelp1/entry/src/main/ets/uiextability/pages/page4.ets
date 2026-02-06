import { common, OpenLinkOptions, StartOptions, wantConstant } from '@kit.AbilityKit';
import { BusinessError, commonEventManager, systemParameterEnhance } from '@kit.BasicServicesKit';
import { rpc } from '@kit.IPCKit';

@Entry
@Component
struct page4 {
  @State message: string = 'UIExtAbility';
  context = this.getUIContext().getHostContext() as common.UIExtensionContext

  build() {
    Row() {
      Row() {
        Column() {

          Button('startAbilityForResultPromise_16000072')
            .fontSize(8)
            .height(12)
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
              } else {
                let options: commonEventManager.CommonEventPublishData = {
                  code: 16000072, // 公共事件的初始代码
                  isOrdered: true   // 有序公共事件
                }
                commonEventManager.publish('StartAbility', options, () => {

                })
              }
            })

          Button('startAbilityForResultPromise_16000076')
            .fontSize(8)
            .height(12)
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
              } else {
                let options: commonEventManager.CommonEventPublishData = {
                  code: 16000076, // 公共事件的初始代码
                  isOrdered: true   // 有序公共事件
                }
                commonEventManager.publish('StartAbility', options, () => {

                })
              }
            })

          Button('startAbilityForResultPromise_16000077')
            .fontSize(8)
            .height(12)
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
              } else {
                let options: commonEventManager.CommonEventPublishData = {
                  code: 16000077, // 公共事件的初始代码
                  isOrdered: true   // 有序公共事件
                }
                commonEventManager.publish('StartAbility', options, () => {

                })
              }
            })

          Button('startAbilityForResultPromise_16000078')
            .fontSize(8)
            .height(12)
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
              } else {
                let options: commonEventManager.CommonEventPublishData = {
                  code: 16000078, // 公共事件的初始代码
                  isOrdered: true   // 有序公共事件
                }
                commonEventManager.publish('StartAbility', options, () => {

                })
              }
            })
          Button('startAbilityForResultPromise_16000079')
            .fontSize(8)
            .height(12)
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
              } else {
                let options: commonEventManager.CommonEventPublishData = {
                  code: 16000079, // 公共事件的初始代码
                  isOrdered: true   // 有序公共事件
                }
                commonEventManager.publish('StartAbility', options, () => {

                })
              }
            })
          Button('startAbilityForResultPromise_16000080')
            .fontSize(8)
            .height(12)
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
              } else {
                let options: commonEventManager.CommonEventPublishData = {
                  code: 16000080, // 公共事件的初始代码
                  isOrdered: true   // 有序公共事件
                }
                commonEventManager.publish('StartAbility', options, () => {

                })
              }
            })


          Button('startAbilityForResultCallback_16000072')
            .fontSize(8)
            .height(12)
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

              } else {
                let options: commonEventManager.CommonEventPublishData = {
                  code: 16000072, // 公共事件的初始代码
                  isOrdered: true   // 有序公共事件
                }
                commonEventManager.publish('StartAbility', options, () => {

                })
              }
            })

          Button('startAbilityForResultCallback_16000076')
            .fontSize(8)
            .height(12)
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
              } else {
                let options: commonEventManager.CommonEventPublishData = {
                  code: 16000076, // 公共事件的初始代码
                  isOrdered: true   // 有序公共事件
                }
                commonEventManager.publish('StartAbility', options, () => {

                })
              }
            })

          Button('startAbilityForResultCallback_16000077')
            .fontSize(8)
            .height(12)
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
              } else {
                let options: commonEventManager.CommonEventPublishData = {
                  code: 16000077, // 公共事件的初始代码
                  isOrdered: true   // 有序公共事件
                }
                commonEventManager.publish('StartAbility', options, () => {

                })
              }
            })

          Button('startAbilityForResultCallback_16000078')
            .fontSize(8)
            .height(12)
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
              } else {
                let options: commonEventManager.CommonEventPublishData = {
                  code: 16000078, // 公共事件的初始代码
                  isOrdered: true   // 有序公共事件
                }
                commonEventManager.publish('StartAbility', options, () => {

                })
              }
            })
          Button('startAbilityForResultCallback_16000079')
            .fontSize(8)
            .height(12)
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
              } else {
                let options: commonEventManager.CommonEventPublishData = {
                  code: 16000079, // 公共事件的初始代码
                  isOrdered: true   // 有序公共事件
                }
                commonEventManager.publish('StartAbility', options, () => {

                })
              }
            })
          Button('startAbilityForResultCallback_16000080')
            .fontSize(8)
            .height(12)
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
              } else {
                let options: commonEventManager.CommonEventPublishData = {
                  code: 16000080, // 公共事件的初始代码
                  isOrdered: true   // 有序公共事件
                }
                commonEventManager.publish('StartAbility', options, () => {

                })
              }
            })


          Button('startAbilityForResultOptions_16000072')
            .fontSize(8)
            .height(12)
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
                this.context.startAbilityForResult(want, options,(err: BusinessError, result: common.AbilityResult) => {
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
              } else {
                let options: commonEventManager.CommonEventPublishData = {
                  code: 16000072, // 公共事件的初始代码
                  isOrdered: true   // 有序公共事件
                }
                commonEventManager.publish('StartAbility', options, () => {

                })
              }
            })

          Button('startAbilityForResultOptions_16000076')
            .fontSize(8)
            .height(12)
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
                this.context.startAbilityForResult(want, options,(err: BusinessError, result: common.AbilityResult) => {
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
              } else {
                let options: commonEventManager.CommonEventPublishData = {
                  code: 16000076, // 公共事件的初始代码
                  isOrdered: true   // 有序公共事件
                }
                commonEventManager.publish('StartAbility', options, () => {

                })
              }
            })

          Button('startAbilityForResultOptions_16000077')
            .fontSize(8)
            .height(12)
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
                this.context.startAbilityForResult(want, options,(err: BusinessError, result: common.AbilityResult) => {
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
              } else {
                let options: commonEventManager.CommonEventPublishData = {
                  code: 16000077, // 公共事件的初始代码
                  isOrdered: true   // 有序公共事件
                }
                commonEventManager.publish('StartAbility', options, () => {

                })
              }
            })

          Button('startAbilityForResultOptions_16000078')
            .fontSize(8)
            .height(12)
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
                this.context.startAbilityForResult(want, options,(err: BusinessError, result: common.AbilityResult) => {
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
              } else {
                let options: commonEventManager.CommonEventPublishData = {
                  code: 16000078, // 公共事件的初始代码
                  isOrdered: true   // 有序公共事件
                }
                commonEventManager.publish('StartAbility', options, () => {

                })
              }
            })
          Button('startAbilityForResultOptions_16000079')
            .fontSize(8)
            .height(12)
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
                this.context.startAbilityForResult(want, options,(err: BusinessError, result: common.AbilityResult) => {
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
              } else {
                let options: commonEventManager.CommonEventPublishData = {
                  code: 16000079, // 公共事件的初始代码
                  isOrdered: true   // 有序公共事件
                }
                commonEventManager.publish('StartAbility', options, () => {

                })
              }
            })
          Button('startAbilityForResultOptions_16000080')
            .fontSize(8)
            .height(12)
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
                this.context.startAbilityForResult(want, options,(err: BusinessError, result: common.AbilityResult) => {
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

