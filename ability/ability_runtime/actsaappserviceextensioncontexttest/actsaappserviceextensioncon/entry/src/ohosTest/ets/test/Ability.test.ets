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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium'
import { Want, common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { JSON } from '@kit.ArkTS';
import { commonEventManager } from '@kit.BasicServicesKit';

let context: common.UIAbilityContext;

let sub : commonEventManager.CommonEventSubscriber;
function sleep(time:number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve('ok');
    }, time)
  });
}

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeAll(() =>{
      context = AppStorage.get<common.UIAbilityContext>('abilityContext') as common.UIAbilityContext;
    })

    /**
     * @tc.number: SUB_AA_ABILITY_NewRule_AppServiceExtension_0100
     * @tc.name: SUB_AA_ABILITY_NewRule_AppServiceExtension_0100
     * @tc.desc: UIAbilityContext connectAppServiceExtensionAbility and disconnectAppServiceExtensionAbility success.
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_0100', Level.LEVEL0, async (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_0100`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'AppServiceExtAbility'
      };

      let options: common.ConnectOptions = {
        onConnect(elementName, remote) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect elementName: ${JSON.stringify(elementName)}`);
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect remote: ${remote}`);
        },
        onDisconnect(elementName) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect elementName: ${JSON.stringify(elementName)}`);
          done();
        },
        onFailed(code) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed code: ${code}`);
          expect(code).assertEqual(801);
          done();
        }
      };

      try {
        let connId: number = context.connectAppServiceExtensionAbility(wantInfo, options);
        hilog.info(0x0000, 'testTag', `${tcNumber} connectAppServiceExtensionAbility: ${connId}`);
        await sleep(2000);
        context.disconnectAppServiceExtensionAbility(connId).then(() => {
          hilog.info(0x0000, 'testTag', `${tcNumber} disconnectAppServiceExtensionAbility succeed`);
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, 'testTag', `${tcNumber} disconnectAppServiceExtensionAbility error: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        hilog.info(0x0000, 'testTag', `${tcNumber} connect or disconnect failed: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_AA_ABILITY_NewRule_AppServiceExtension_0200
     * @tc.name: SUB_AA_ABILITY_NewRule_AppServiceExtension_0200
     * @tc.desc: UIAbilityContext connectAppServiceExtensionAbility 16000001.
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_0200', Level.LEVEL0, (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_0200`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextensionError',
        abilityName: 'AppServiceExtAbility'
      };

      let options: common.ConnectOptions = {
        onConnect(elementName, remote) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect elementName: ${JSON.stringify(elementName)}`);
          expect().assertFail();
          done();
        },
        onDisconnect(elementName) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect elementName: ${JSON.stringify(elementName)}`);
        },
        onFailed(code) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed code: ${code}`);
          let result: boolean = code === 801 || code === 16000001;
          expect(result).assertTrue();
          done();
        }
      };

      try {
        context.connectAppServiceExtensionAbility(wantInfo, options);
      } catch (err) {
        hilog.info(0x0000, 'testTag', `${tcNumber} connectAppServiceExtensionAbility failed:${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_AA_ABILITY_NewRule_AppServiceExtension_0300
     * @tc.name: SUB_AA_ABILITY_NewRule_AppServiceExtension_0300
     * @tc.desc: UIAbilityContext startAppServiceExtensionAbility and stopAppServiceExtensionAbility success.
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_0300', Level.LEVEL0, async(done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_0300`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'AppServiceExtAbility'
      };

      try {
        context.startAppServiceExtensionAbility(wantInfo)
          .then(() => {
            hilog.info(0x0000, 'testTag', `${tcNumber} startAppServiceExtensionAbility succeed`);
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, 'testTag', `${tcNumber} startAppServiceExtensionAbility error:${JSON.stringify(err)}`);
            if(err.code !== 801) {
              expect().assertFail();
            }
            done();
          });
        await sleep(2000);
        context.stopAppServiceExtensionAbility(wantInfo)
          .then(() => {
            hilog.info(0x0000, 'testTag', `${tcNumber} stopAppServiceExtensionAbility succeed`);
            done();
          })
          .catch((err: BusinessError) => {
            hilog.info(0x0000, 'testTag', `${tcNumber} stopAppServiceExtensionAbility error: ${JSON.stringify(err)}`);
            expect().assertFail();
            done();
          });
      } catch (err) {
        hilog.info(0x0000, 'testTag', `${tcNumber} start or stopAppServiceExtensionAbility failed: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_AA_ABILITY_NewRule_AppServiceExtension_0400
     * @tc.name: SUB_AA_ABILITY_NewRule_AppServiceExtension_0400
     * @tc.desc: UIAbilityContext startAppServiceExtensionAbility 16000001.
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_0400', Level.LEVEL0, (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_0400`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextensionError',
        abilityName: 'AppServiceExtAbility'
      }
      try {
        context.startAppServiceExtensionAbility(wantInfo).then(() => {
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, 'testTag', `${tcNumber} startAppServiceExtensionAbility error: ${JSON.stringify(err)}`);
          let result: boolean = err.code === 801 || err.code === 16000001;
          expect(result).assertTrue();
          done();
        });
      } catch (err) {
        hilog.info(0x0000, 'testTag', `${tcNumber} startAppServiceExtensionAbility failed: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_AA_ABILITY_NewRule_AppServiceExtension_0500
     * @tc.name: SUB_AA_ABILITY_NewRule_AppServiceExtension_0500
     * @tc.desc: UIAbilityContext disconnectAppServiceExtensionAbility 16000050.
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_0500', Level.LEVEL0, (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_0500`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);
      try {
        context.disconnectAppServiceExtensionAbility(-1).then(()=> {
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, 'testTag', `${tcNumber} disconnectAppServiceExtensionAbility error: ${JSON.stringify(err)}`);
          let result: boolean = err.code === 801 || err.code === 16000050;
          expect(result).assertTrue();
          done();
        })
      } catch (err) {
        hilog.info(0x0000, 'testTag', `${tcNumber} disconnectAppServiceExtensionAbility failed: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_AA_ABILITY_NewRule_AppServiceExtension_0600
     * @tc.name: SUB_AA_ABILITY_NewRule_AppServiceExtension_0600
     * @tc.desc: AppServiceExtensionContext connectServiceExtensionAbility and disconnectServiceExtensionAbility success.
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_0600', Level.LEVEL0, async (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_0600`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'AppServiceExtAbility',
        parameters: {
          'case': '0600'
        }
      };

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['connectServiceExtensionAbility_0600']
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        sub = subscriber;
        hilog.info(0x0000, 'testTag', `${tcNumber} createSubscriber succeed`);
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', `${tcNumber} subscribe callback result: ${JSON.stringify(err)}`);
          hilog.info(0x0000, 'testTag', `${tcNumber} subscribe callback commonEventData: ${JSON.stringify(commonEventData)}`);
          expect(commonEventData.parameters?.result).assertEqual(200);
          commonEventManager.unsubscribe(subscriber);
          done();
        });
        try {
          context.startAppServiceExtensionAbility(wantInfo).then(() => {
            hilog.info(0x0000, 'testTag', `${tcNumber} startAppServiceExtensionAbility succeed`);
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, 'testTag', `${tcNumber} startAppServiceExtensionAbility error: ${JSON.stringify(err)}`);
            if(err.code !== 801){
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, 'testTag', `${tcNumber} startAppServiceExtensionAbility failed: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.number: SUB_AA_ABILITY_NewRule_AppServiceExtension_0700
     * @tc.name: SUB_AA_ABILITY_NewRule_AppServiceExtension_0700
     * @tc.desc: AppServiceExtensionContext connectServiceExtensionAbility 16000001.
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_0700', Level.LEVEL0, async (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_0700`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'AppServiceExtAbility',
        parameters: {
          'case': '0700'
        }
      };

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['connectServiceExtensionAbility_0700']
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        sub = subscriber;
        hilog.info(0x0000, 'testTag', `${tcNumber}  createSubscriber succeed`);
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', `${tcNumber}  subscribe callback result: ${JSON.stringify(err)}`);
          hilog.info(0x0000, 'testTag', `${tcNumber}  subscribe callback commonEventData: ${JSON.stringify(commonEventData)}`);
          expect(commonEventData.parameters?.result).assertEqual(16000001);
          commonEventManager.unsubscribe(subscriber);
          done();
        });
        try {
          context.startAppServiceExtensionAbility(wantInfo).then(() => {
            hilog.info(0x0000, 'testTag', `${tcNumber}  startAppServiceExtensionAbility succeed`);
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, 'testTag', `${tcNumber}  startAppServiceExtensionAbility error: ${JSON.stringify(err)}`);
            if(err.code !== 801) {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, 'testTag', `${tcNumber} startAppServiceExtensionAbility failed: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.number: SUB_AA_ABILITY_NewRule_AppServiceExtension_0800
     * @tc.name: SUB_AA_ABILITY_NewRule_AppServiceExtension_0800
     * @tc.desc: AppServiceExtensionContext disconnectServiceExtensionAbility 16000050.
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_0800', Level.LEVEL0, async (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_0800`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'AppServiceExtAbility',
        parameters: {
          'case': '0800'
        }
      };

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['connectServiceExtensionAbility_0800']
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        sub = subscriber;
        hilog.info(0x0000, 'testTag', `${tcNumber} createSubscriber succeed`);
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', `${tcNumber} subscribe callback result: ${JSON.stringify(err)}`);
          hilog.info(0x0000, 'testTag', `${tcNumber} subscribe callback commonEventData: ${JSON.stringify(commonEventData)}`);
          expect(commonEventData.parameters?.result).assertEqual(16000050);
          commonEventManager.unsubscribe(subscriber);
          done();
        });
        try {
          context.startAppServiceExtensionAbility(wantInfo).then(() => {
            hilog.info(0x0000, 'testTag', `${tcNumber} startAppServiceExtensionAbility succeed`);
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, 'testTag', `${tcNumber} startAppServiceExtensionAbility error: ${JSON.stringify(err)}`);
            if(err.code !== 801){
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, 'testTag', `startAppServiceExtensionAbility failed: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number: SUB_AA_ABILITY_NewRule_AppServiceExtension_0900
     * @tc.name: SUB_AA_ABILITY_NewRule_AppServiceExtension_0900
     * @tc.desc: UIAbilityContext stopAppServiceExtensionAbility 16000001.
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_0900', Level.LEVEL0, async(done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_0900`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);
      let errorWantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'AppServiceExtAbilityError'
      };
      try {
         context.stopAppServiceExtensionAbility(errorWantInfo)
          .then(() => {
            hilog.info(0x0000, 'testTag', `${tcNumber} stopAppServiceExtensionAbility succeed`);
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            hilog.info(0x0000, 'testTag', `${tcNumber} stopAppServiceExtensionAbility error: ${JSON.stringify(err)}`);
            let result: boolean = err.code === 801 || err.code === 16000001;
            expect(result).assertTrue();
            done();
          });
      } catch (err) {
        hilog.info(0x0000, 'testTag', `${tcNumber} stopAppServiceExtensionAbility failed: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })
 
    /**
     * @tc.number: SUB_AA_ABILITY_NewRule_AppServiceExtension_3200
     * @tc.name: SUB_AA_ABILITY_NewRule_AppServiceExtension_3200
     * @tc.desc: AppServiceExtensionContext connectServiceExtensionAbility 16000002.
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_3200', Level.LEVEL0, async (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_3200`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'AppServiceExtAbility',
        parameters: {
          'case': '3200'
        }
      }
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['connectServiceExtensionAbility_3200']
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        sub = subscriber;
        hilog.info(0x0000, 'testTag', `${tcNumber} createSubscriber succeed`);
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', `${tcNumber} subscribe callback result: ${JSON.stringify(err)}`);
          hilog.info(0x0000, 'testTag', `${tcNumber} subscribe callback commonEventData: ${JSON.stringify(commonEventData)}`);
          expect(commonEventData.parameters?.result).assertEqual(16000002);
          commonEventManager.unsubscribe(subscriber);
          done();
        });
        try {
          context.startAppServiceExtensionAbility(wantInfo).then(() => {
            hilog.info(0x0000, 'testTag', `${tcNumber} startAppServiceExtensionAbility succeed`);
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, 'testTag', `${tcNumber} startAppServiceExtensionAbility error: ${JSON.stringify(err)}`);
            if(err.code !== 801){
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, 'testTag', `${tcNumber} startAppServiceExtensionAbility failed: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })
    })

     /**
     * @tc.number: SUB_AA_ABILITY_NewRule_AppServiceExtension_3300
     * @tc.name: SUB_AA_ABILITY_NewRule_AppServiceExtension_3300
     * @tc.desc: AppServiceExtensionContext connectServiceExtensionAbility 16000004.
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_3300', Level.LEVEL0, async (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_3300`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'AppServiceExtAbility',
        parameters: {
          'case': '3300'
        }
      }
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['connectServiceExtensionAbility_3300']
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        sub = subscriber;
        hilog.info(0x0000, 'testTag', `${tcNumber} createSubscriber succeed`);
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', `${tcNumber} subscribe callback result: ${JSON.stringify(err)}`);
          hilog.info(0x0000, 'testTag', `${tcNumber} subscribe callback commonEventData: ${JSON.stringify(commonEventData)}`);
          expect(commonEventData.parameters?.result).assertEqual(16000004);
          commonEventManager.unsubscribe(subscriber);
          done();
        });
        try {
          context.startAppServiceExtensionAbility(wantInfo).then(() => {
            hilog.info(0x0000, 'testTag', `${tcNumber} startAppServiceExtensionAbility succeed`);
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, 'testTag', `${tcNumber} startAppServiceExtensionAbility error: ${JSON.stringify(err)}`);
            if(err.code !== 801){
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, 'testTag', `${tcNumber} startAppServiceExtensionAbility failed: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.number: SUB_AA_ABILITY_NewRule_AppServiceExtension_3400
     * @tc.name: SUB_AA_ABILITY_NewRule_AppServiceExtension_3400
     * @tc.desc: AppServiceExtensionContext connectServiceExtensionAbility 16000050.
     */
    it('SUB_AA_ABILITY_NewRule_AppServiceExtension_3400', Level.LEVEL0, async (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_AppServiceExtension_3400`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);
      let wantInfo: Want = {
        bundleName: 'com.acts.context.aappserviceextension',
        abilityName: 'AppServiceExtAbility',
        parameters: {
          'case': '3400'
        }
      }
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['connectServiceExtensionAbility_3400']
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        sub = subscriber;
        hilog.info(0x0000, 'testTag', `${tcNumber} createSubscriber succeed`);
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', `${tcNumber} subscribe callback result: ${JSON.stringify(err)}`);
          hilog.info(0x0000, 'testTag', `${tcNumber} subscribe callback commonEventData: ${JSON.stringify(commonEventData)}`);
          expect(commonEventData.parameters?.result).assertEqual(16000050);
          commonEventManager.unsubscribe(subscriber);
          done();
        });
        try {
          context.startAppServiceExtensionAbility(wantInfo).then(() => {
            hilog.info(0x0000, 'testTag', `${tcNumber} startAppServiceExtensionAbility succeed`);
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, 'testTag', `${tcNumber} startAppServiceExtensionAbility error: ${JSON.stringify(err)}`);
            if(err.code !== 801){
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, 'testTag', `startAppServiceExtensionAbility failed: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })
    })
  })
}