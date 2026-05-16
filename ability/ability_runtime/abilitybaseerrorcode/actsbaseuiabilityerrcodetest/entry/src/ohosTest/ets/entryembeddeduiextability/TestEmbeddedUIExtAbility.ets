import { EmbeddedUIExtensionAbility, StartOptions, UIExtensionContentSession, Want ,wantConstant} from '@kit.AbilityKit';
import { commonEventManager } from '@kit.BasicServicesKit';
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
const TAG: string = '[ExampleEmbeddedAbility]'

export default class TestEmbeddedAbility extends EmbeddedUIExtensionAbility {
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
    let storage: LocalStorage = new LocalStorage(param);
    if(want?.parameters?.case == 'startErrorCodeCallBack1600001'){
      try{
        let want: Want = {
          bundleName: 'com.acts.ability.errcode',
          abilityName: 'xxx'
        };

        // test errcode
        try {
          this.context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
              // 处理业务逻辑错误
              console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
              let commonEventData: commonEventManager.CommonEventPublishData = {
                parameters: {
                  'result': err?.code,
                }
              }
              commonEventManager.publish(tag, commonEventData, (result) => {
                console.info(TAG + "common event success " + result);
              });

            } else {
              // 执行正常业务
              console.info('startAbility succeed');
            }
          });

        } catch(err) {
          // 处理入参错误异常
          let code = (err as BusinessError).code;
          let message = (err as BusinessError).message;
          console.error(TAG + `startAbility failed, code is ${code}, message is ${message}`);
        }

      } catch (error) {
        console.info(TAG + "error..." + error)
      }
    } else

      if(want?.parameters?.case == 'startErrorCodeCallBack16000050') {
        try{

          let want: Want = {
            bundleName: 'com.acts.ability.errcode',
            abilityName: 'NewAbility',
            parameters:  { 'keyFd': { 'type': 'FD', 'value': -1}}
          };

          // test errcode
          try {
            this.context.startAbility(want, (err: BusinessError) => {
              if (err.code) {
                // 处理业务逻辑错误
                console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
                let commonEventData: commonEventManager.CommonEventPublishData = {
                  parameters: {
                    'result': err?.code,
                  }
                }
                commonEventManager.publish(tag, commonEventData, (result) => {
                  console.info(TAG + "common event success " + result);
                });

              } else {
                // 执行正常业务
                console.info('startAbility succeed');
              }
            });

          } catch(err) {
            // 处理入参错误异常
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.error(TAG + `startAbility failed, code is ${code}, message is ${message}`);
          }

        } catch (error) {
          console.info(TAG + "error..." + error)
        }

      } else

      if (want?.parameters?.case == "startErrorCodeCallBack16000004") {
        try{

          let want: Want = {
            bundleName: 'com.ability.errcode.assist',
            abilityName: 'EntryAbility'
          };

          // test errcode
          try {
            this.context.startAbility(want, (err: BusinessError) => {
              if (err.code) {
                // 处理业务逻辑错误
                console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
                let commonEventData: commonEventManager.CommonEventPublishData = {
                  parameters: {
                    'result': err?.code,
                  }
                }
                commonEventManager.publish(tag, commonEventData, (result) => {
                  console.info(TAG + "common event success " + result);
                });

              } else {
                // 执行正常业务
                console.info('startAbility succeed');
              }
            });

          } catch(err) {
            // 处理入参错误异常
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.error(TAG + `startAbility failed, code is ${code}, message is ${message}`);
          }

        } catch (error) {
          console.info(TAG + "error..." + error)
        }

      } else

      if (want?.parameters?.case == "startErrorCodeCallBack16000019") {
        try{

          let want: Want = {
            action :"xxxx"
          };
          // test errcode
          try {
            this.context.startAbility(want, (err: BusinessError) => {
              if (err.code) {
                // 处理业务逻辑错误
                console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
                let commonEventData: commonEventManager.CommonEventPublishData = {
                  parameters: {
                    'result': err?.code,
                  }
                }
                commonEventManager.publish(tag, commonEventData, (result) => {
                  console.info(TAG + "common event success " + result);
                });

              } else {
                // 执行正常业务
                console.info('startAbility succeed');
              }
            });

          } catch(err) {
            // 处理入参错误异常
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.error(TAG + `startAbility failed, code is ${code}, message is ${message}`);
          }

        } catch (error) {
          console.info(TAG + "error..." + error)
        }

      } else
      if (want?.parameters?.case == "startErrorCodeCallBack16000072")  {
        try{

          let want: Want = {
            bundleName: 'com.acts.ability.errcode',
            abilityName: 'NewAbility',
            parameters: {
              [wantConstant.Params.CREATE_APP_INSTANCE_KEY]: true,
            }
          };
          // test errcode
          try {
            this.context.startAbility(want, (err: BusinessError) => {
              if (err.code) {
                // 处理业务逻辑错误
                console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
                let commonEventData: commonEventManager.CommonEventPublishData = {
                  parameters: {
                    'result': err?.code,
                  }
                }
                commonEventManager.publish(tag, commonEventData, (result) => {
                  console.info(TAG + "common event success " + result);
                });

              } else {
                // 执行正常业务
                console.info('startAbility succeed');
              }
            });

          } catch(err) {
            // 处理入参错误异常
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.error(TAG + `startAbility failed, code is ${code}, message is ${message}`);
          }

        } catch (error) {
          console.info(TAG + "error..." + error)
        }

      } else

      // if (want?.parameters?.case == "startErrorCodeCallBack16000076")  {
      //   try{
      //
      //     let want: Want = {
      //       bundleName: 'com.acts.ability.errcode',
      //       abilityName: 'NewAbility',
      //       parameters: {
      //         [wantConstant.Params.APP_INSTANCE_KEY]: "app_instance_100"}
      //     };
      //
      //     // test errcode
      //     try {
      //       this.context.startAbility(want, (err: BusinessError) => {
      //         if (err.code) {
      //           // 处理业务逻辑错误
      //           console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
      //           let commonEventData: commonEventManager.CommonEventPublishData = {
      //             parameters: {
      //               'result': err?.code,
      //             }
      //           }
      //           commonEventManager.publish(tag, commonEventData, (result) => {
      //             console.info(TAG + "common event success " + result);
      //           });
      //
      //         } else {
      //           // 执行正常业务
      //           console.info('startAbility succeed');
      //         }
      //       });
      //
      //     } catch(err) {
      //       // 处理入参错误异常
      //       let code = (err as BusinessError).code;
      //       let message = (err as BusinessError).message;
      //       console.error(TAG + `startAbility failed, code is ${code}, message is ${message}`);
      //     }
      //
      //   } catch (error) {
      //     console.info(TAG + "error..." + error)
      //   }
      //
      // } else
      //
      // if (want?.parameters?.case == "startErrorCodeCallBack16000077") {
      //   try{
      //     let want: Want = {
      //       bundleName: 'com.acts.ability.errcode',
      //       abilityName: 'NewAbility',
      //       parameters: {
      //         [wantConstant.Params.CREATE_APP_INSTANCE_KEY]: true,
      //       }
      //     };
      //
      //
      //     try {
      //       this.context.startAbility(want, (err: BusinessError) => {
      //         if (err.code) {
      //           // 处理业务逻辑错误
      //           console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
      //
      //         } else {
      //           // 执行正常业务
      //           console.info('startAbility succeed');
      //         }
      //       });
      //
      //     } catch(err) {
      //       // 处理入参错误异常
      //       let code = (err as BusinessError).code;
      //       let message = (err as BusinessError).message;
      //       console.error(TAG + `failed, code is ${code}, message is ${message}`);
      //     }
      //
      //     // test errcode
      //     try {
      //       this.context.startAbility(want, (err: BusinessError) => {
      //         if (err.code) {
      //           // 处理业务逻辑错误
      //           console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
      //           let commonEventData: commonEventManager.CommonEventPublishData = {
      //             parameters: {
      //               'result': err?.code,
      //             }
      //           }
      //           commonEventManager.publish(tag, commonEventData, (result) => {
      //             console.info(TAG + "common event success " + result);
      //           });
      //
      //         } else {
      //           // 执行正常业务
      //           console.info('startAbility succeed');
      //         }
      //       });
      //
      //     } catch(err) {
      //       // 处理入参错误异常
      //       let code = (err as BusinessError).code;
      //       let message = (err as BusinessError).message;
      //       console.error(TAG + `startAbility failed, code is ${code}, message is ${message}`);
      //     }
      //
      //   } catch (error) {
      //     console.info(TAG + "error..." + error)
      //   }
      //
      // } else
      // if (want?.parameters?.case == "startErrorCodeCallBack16000079") {
      //   try{
      //     let want: Want = {
      //       bundleName: 'com.ability.errcode.assist',
      //       abilityName: 'EntryAbility',
      //       parameters: {
      //         [wantConstant.Params.APP_INSTANCE_KEY]: "app_instance_100",
      //         [wantConstant.Params.CREATE_APP_INSTANCE_KEY]: true,
      //
      //       }
      //     };
      //
      //     try {
      //       this.context.startAbility(want, (err: BusinessError) => {
      //         if (err.code) {
      //           // 处理业务逻辑错误
      //           console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
      //           let commonEventData: commonEventManager.CommonEventPublishData = {
      //             parameters: {
      //               'result': err?.code,
      //             }
      //           }
      //           commonEventManager.publish(tag, commonEventData, (result) => {
      //             console.info(TAG + "common event success " + result);
      //           });
      //
      //         } else {
      //           // 执行正常业务
      //           console.info('startAbility succeed');
      //         }
      //       });
      //
      //     } catch(err) {
      //       // 处理入参错误异常
      //       let code = (err as BusinessError).code;
      //       let message = (err as BusinessError).message;
      //       console.error(TAG + `failed, code is ${code}, message is ${message}`);
      //     }
      //
      //
      //   } catch (error) {
      //     console.info(TAG + "error..." + error)
      //   }
      //
      // } else
      if (want?.parameters?.case == "startErrorCodeCallBack16000080") {
        try{
          let want: Want = {
            bundleName: 'com.ability.errcode.assist',
            abilityName: 'EntryAbility',
            parameters: {
              [wantConstant.Params.CREATE_APP_INSTANCE_KEY]: true,
            }
          };

          try {
            this.context.startAbility(want, (err: BusinessError) => {
              if (err.code) {
                // 处理业务逻辑错误
                console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
                let commonEventData: commonEventManager.CommonEventPublishData = {
                  parameters: {
                    'result': err?.code,
                  }
                }
                commonEventManager.publish(tag, commonEventData, (result) => {
                  console.info(TAG + "common event success " + result);
                });

              } else {
                // 执行正常业务
                console.info('startAbility succeed');
              }
            });

          } catch(err) {
            // 处理入参错误异常
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.error(TAG + `failed, code is ${code}, message is ${message}`);
          }

        } catch (error) {
          console.info(TAG + "error..." + error)
        }

      } else

      if (want?.parameters?.case == "startErrorCodeCallBack16000073") {
        try{
          let want: Want = {
            bundleName: 'com.ability.errcode.assist',
            abilityName: 'EntryAbility',
            parameters: {
              [wantConstant.Params.APP_CLONE_INDEX_KEY]: 1001,
            }
          };

          // test errcode
          try {
            this.context.startAbility(want, (err: BusinessError) => {
              if (err.code) {
                // 处理业务逻辑错误
                console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
                let commonEventData: commonEventManager.CommonEventPublishData = {
                  parameters: {
                    'result': err?.code,
                  }
                }
                commonEventManager.publish(tag, commonEventData, (result) => {
                  console.info(TAG + "common event success " + result);
                });

              } else {
                // 执行正常业务
                console.info('startAbility succeed');
              }
            });

          } catch(err) {
            // 处理入参错误异常
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.error(TAG + `startAbility failed, code is ${code}, message is ${message}`);
          }

        } catch (error) {
          console.info(TAG + "error..." + error)
        }

      } else
      if (want?.parameters?.case == "startErrorCodeCallBack16000078") {
        try {
          let want: Want = {
            bundleName: 'com.ability.errcode.assist3',
            abilityName: 'EntryAbility',
            parameters: {
              [wantConstant.Params.APP_INSTANCE_KEY]: "app_instance_0",
            }
          };
          // test errcode
          try {
            this.context.startAbility(want, (err: BusinessError) => {
              if (err.code) {
                // 处理业务逻辑错误
                console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
                let commonEventData: commonEventManager.CommonEventPublishData = {
                  parameters: {
                    'result': err?.code,
                  }
                }
                commonEventManager.publish(tag, commonEventData, (result) => {
                  console.info(TAG + "common event success " + result);
                });

              } else {
                // 执行正常业务
                console.info('startAbility succeed');
              }
            });

          } catch(err) {
            // 处理入参错误异常
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.error(TAG + `startAbility failed, code is ${code}, message is ${message}`);
          }

        } catch (error) {
          console.info(TAG + "error..." + error)
        }

      } else

      if(want?.parameters?.case == 'startErrorCodeCallBackOptions16000050') {
        try{

          let want: Want = {
            bundleName: 'com.acts.ability.errcode',
            abilityName: 'NewAbility',
            parameters:  { 'keyFd': { 'type': 'FD', 'value': -1}}
          };

          let options: StartOptions= {
            displayId: 0
          };
          // test errcode
          try {
            this.context.startAbility(want, options,(err: BusinessError) => {
              if (err.code) {
                // 处理业务逻辑错误
                console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
                let commonEventData: commonEventManager.CommonEventPublishData = {
                  parameters: {
                    'result': err?.code,
                  }
                }
                commonEventManager.publish(tag, commonEventData, (result) => {
                  console.info(TAG + "common event success " + result);
                });

              } else {
                // 执行正常业务
                console.info('startAbility succeed');
              }
            });
          } catch(err) {
            // 处理入参错误异常
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.error(TAG + `startAbility failed, code is ${code}, message is ${message}`);
          }

        } catch (error) {
          console.info(TAG + "error..." + error)
        }

      } else

      if (want?.parameters?.case == "startErrorCodeCallBackOptions16000004") {
        try{

          let want: Want = {
            bundleName: 'com.ability.errcode.assist',
            abilityName: 'EntryAbility'
          };

          let options: StartOptions= {
            displayId: 0
          };
          // test errcode
          try {
            this.context.startAbility(want, options,(err: BusinessError) => {
              if (err.code) {
                // 处理业务逻辑错误
                console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
                let commonEventData: commonEventManager.CommonEventPublishData = {
                  parameters: {
                    'result': err?.code,
                  }
                }
                commonEventManager.publish(tag, commonEventData, (result) => {
                  console.info(TAG + "common event success " + result);
                });

              } else {
                // 执行正常业务
                console.info('startAbility succeed');
              }
            });
          } catch(err) {
            // 处理入参错误异常
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.error(TAG + `startAbility failed, code is ${code}, message is ${message}`);
          }

        } catch (error) {
          console.info(TAG + "error..." + error)
        }

      } else

      if (want?.parameters?.case == "startErrorCodeCallBackOptions16000019") {
        try{

          let want: Want = {
            action :"xxxx"
          };

          let options: StartOptions= {
            displayId: 0
          };

          // test errcode
          try {
            this.context.startAbility(want, options,(err: BusinessError) => {
              if (err.code) {
                // 处理业务逻辑错误
                console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
                let commonEventData: commonEventManager.CommonEventPublishData = {
                  parameters: {
                    'result': err?.code,
                  }
                }
                commonEventManager.publish(tag, commonEventData, (result) => {
                  console.info(TAG + "common event success " + result);
                });

              } else {
                // 执行正常业务
                console.info('startAbility succeed');
              }
            });

          } catch(err) {
            // 处理入参错误异常
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.error(TAG + `startAbility failed, code is ${code}, message is ${message}`);
          }

        } catch (error) {
          console.info(TAG + "error..." + error)
        }

      } else

      if (want?.parameters?.case == "startErrorCodeCallBackOptions16000072")  {
        try{

          let want: Want = {
            bundleName: 'com.acts.ability.errcode',
            abilityName: 'NewAbility',
            parameters: {
              [wantConstant.Params.CREATE_APP_INSTANCE_KEY]: true,
            }
          };

          let options: StartOptions= {
            displayId: 0
          };
          // test errcode
          try {
            this.context.startAbility(want, options,(err: BusinessError) => {
              if (err.code) {
                // 处理业务逻辑错误
                console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
                let commonEventData: commonEventManager.CommonEventPublishData = {
                  parameters: {
                    'result': err?.code,
                  }
                }
                commonEventManager.publish(tag, commonEventData, (result) => {
                  console.info(TAG + "common event success " + result);
                });

              } else {
                // 执行正常业务
                console.info('startAbility succeed');
              }
            });

          } catch(err) {
            // 处理入参错误异常
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.error(TAG + `startAbility failed, code is ${code}, message is ${message}`);
          }

        } catch (error) {
          console.info(TAG + "error..." + error)
        }

      } else

      // if (want?.parameters?.case == "startErrorCodeCallBackOptions16000076")  {
      //   try{
      //
      //     let want: Want = {
      //       bundleName: 'com.acts.ability.errcode',
      //       abilityName: 'NewAbility',
      //       parameters: {
      //         [wantConstant.Params.APP_INSTANCE_KEY]: "app_instance_100"}
      //     };
      //
      //     let options: StartOptions= {
      //       displayId: 0
      //     };
      //     // test errcode
      //     try {
      //       this.context.startAbility(want, options,(err: BusinessError) => {
      //         if (err.code) {
      //           // 处理业务逻辑错误
      //           console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
      //           let commonEventData: commonEventManager.CommonEventPublishData = {
      //             parameters: {
      //               'result': err?.code,
      //             }
      //           }
      //           commonEventManager.publish(tag, commonEventData, (result) => {
      //             console.info(TAG + "common event success " + result);
      //           });
      //
      //         } else {
      //           // 执行正常业务
      //           console.info('startAbility succeed');
      //         }
      //       });
      //
      //     } catch(err) {
      //       // 处理入参错误异常
      //       let code = (err as BusinessError).code;
      //       let message = (err as BusinessError).message;
      //       console.error(TAG + `startAbility failed, code is ${code}, message is ${message}`);
      //     }
      //
      //   } catch (error) {
      //     console.info(TAG + "error..." + error)
      //   }
      //
      // } else
      //
      // if (want?.parameters?.case == "startErrorCodeCallBackOptions16000077") {
      //   try{
      //     let want: Want = {
      //       bundleName: 'com.acts.ability.errcode',
      //       abilityName: 'NewAbility',
      //       parameters: {
      //         [wantConstant.Params.CREATE_APP_INSTANCE_KEY]: true,
      //       }
      //     };
      //
      //     let options: StartOptions= {
      //       displayId: 0
      //     };
      //     try {
      //       this.context.startAbility(want, options,(err: BusinessError) => {
      //         if (err.code) {
      //           // 处理业务逻辑错误
      //           console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
      //         } else {
      //           // 执行正常业务
      //           console.info('startAbility succeed');
      //         }
      //       });
      //
      //     } catch(err) {
      //       // 处理入参错误异常
      //       let code = (err as BusinessError).code;
      //       let message = (err as BusinessError).message;
      //       console.error(TAG + `failed, code is ${code}, message is ${message}`);
      //     }
      //
      //     // test errcode
      //     try {
      //       this.context.startAbility(want, options,(err: BusinessError) => {
      //         if (err.code) {
      //           // 处理业务逻辑错误
      //           console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
      //           let commonEventData: commonEventManager.CommonEventPublishData = {
      //             parameters: {
      //               'result': err?.code,
      //             }
      //           }
      //           commonEventManager.publish(tag, commonEventData, (result) => {
      //             console.info(TAG + "common event success " + result);
      //           });
      //
      //         } else {
      //           // 执行正常业务
      //           console.info('startAbility succeed');
      //         }
      //       });
      //     } catch(err) {
      //       // 处理入参错误异常
      //       let code = (err as BusinessError).code;
      //       let message = (err as BusinessError).message;
      //       console.error(TAG + `startAbility failed, code is ${code}, message is ${message}`);
      //     }
      //
      //   } catch (error) {
      //     console.info(TAG + "error..." + error)
      //   }
      //
      // } else
      // if (want?.parameters?.case == "startErrorCodeCallBackOptions16000079") {
      //   try{
      //     let want: Want = {
      //       bundleName: 'com.ability.errcode.assist',
      //       abilityName: 'EntryAbility',
      //       parameters: {
      //         [wantConstant.Params.APP_INSTANCE_KEY]: "app_instance_100",
      //         [wantConstant.Params.CREATE_APP_INSTANCE_KEY]: true,
      //
      //       }
      //     };
      //
      //     let options: StartOptions= {
      //       displayId: 0
      //     };
      //     try {
      //       this.context.startAbility(want, options,(err: BusinessError) => {
      //         if (err.code) {
      //           // 处理业务逻辑错误
      //           console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
      //           let commonEventData: commonEventManager.CommonEventPublishData = {
      //             parameters: {
      //               'result': err?.code,
      //             }
      //           }
      //           commonEventManager.publish(tag, commonEventData, (result) => {
      //             console.info(TAG + "common event success " + result);
      //           });
      //
      //         } else {
      //           // 执行正常业务
      //           console.info('startAbility succeed');
      //         }
      //       });
      //     } catch(err) {
      //       // 处理入参错误异常
      //       let code = (err as BusinessError).code;
      //       let message = (err as BusinessError).message;
      //       console.error(TAG + `failed, code is ${code}, message is ${message}`);
      //     }
      //
      //   } catch (error) {
      //     console.info(TAG + "error..." + error)
      //   }
      //
      // } else
      if (want?.parameters?.case == "startErrorCodeCallBackOptions16000080") {
        try{
          let want: Want = {
            bundleName: 'com.ability.errcode.assist',
            abilityName: 'EntryAbility',
            parameters: {
              [wantConstant.Params.CREATE_APP_INSTANCE_KEY]: true,
            }
          };

          let options: StartOptions= {
            displayId: 0
          };
          try {
            this.context.startAbility(want, options,(err: BusinessError) => {
              if (err.code) {
                // 处理业务逻辑错误
                console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
                let commonEventData: commonEventManager.CommonEventPublishData = {
                  parameters: {
                    'result': err?.code,
                  }
                }
                commonEventManager.publish(tag, commonEventData, (result) => {
                  console.info(TAG + "common event success " + result);
                });

              } else {
                // 执行正常业务
                console.info('startAbility succeed');
              }
            });
          } catch(err) {
            // 处理入参错误异常
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.error(TAG + `failed, code is ${code}, message is ${message}`);
          }

        } catch (error) {
          console.info(TAG + "error..." + error)
        }

      } else

      if (want?.parameters?.case == "startErrorCodeCallBackOptions16000073") {
        try{
          let want: Want = {
            bundleName: 'com.ability.errcode.assist',
            abilityName: 'EntryAbility',
            parameters: {
              [wantConstant.Params.APP_CLONE_INDEX_KEY]: 1001,
            }
          };

          let options: StartOptions= {
            displayId: 0
          };
          // test errcode
          try {
            this.context.startAbility(want, options,(err: BusinessError) => {
              if (err.code) {
                // 处理业务逻辑错误
                console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
                let commonEventData: commonEventManager.CommonEventPublishData = {
                  parameters: {
                    'result': err?.code,
                  }
                }
                commonEventManager.publish(tag, commonEventData, (result) => {
                  console.info(TAG + "common event success " + result);
                });

              } else {
                // 执行正常业务
                console.info('startAbility succeed');
              }
            });

          } catch(err) {
            // 处理入参错误异常
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.error(TAG + `startAbility failed, code is ${code}, message is ${message}`);
          }

        } catch (error) {
          console.info(TAG + "error..." + error)
        }

      } else
      if (want?.parameters?.case == "startErrorCodeCallBackOptions16000078") {
        try {
          let want: Want = {
            bundleName: 'com.ability.errcode.assist3',
            abilityName: 'EntryAbility',
            parameters: {
              [wantConstant.Params.APP_INSTANCE_KEY]: "app_instance_0",
            }
          };
          let options: StartOptions= {
            displayId: 0
          };
          // test errcode
          try {
            this.context.startAbility(want, options,(err: BusinessError) => {
              if (err.code) {
                // 处理业务逻辑错误
                console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
                let commonEventData: commonEventManager.CommonEventPublishData = {
                  parameters: {
                    'result': err?.code,
                  }
                }
                commonEventManager.publish(tag, commonEventData, (result) => {
                  console.info(TAG + "common event success " + result);
                });

              } else {
                // 执行正常业务
                console.info('startAbility succeed');
              }
            });

          } catch(err) {
            // 处理入参错误异常
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.error(TAG + `startAbility failed, code is ${code}, message is ${message}`);
          }

        } catch (error) {
          console.info(TAG + "error..." + error)
        }

      }




    session.loadContent('entryembeddeduiextability/pages/EntryEmbeddedUIExtAbilityPage', storage);
  }

  onSessionDestroy(session: UIExtensionContentSession) {
    console.log(TAG, `onSessionDestroy`);
  }
}