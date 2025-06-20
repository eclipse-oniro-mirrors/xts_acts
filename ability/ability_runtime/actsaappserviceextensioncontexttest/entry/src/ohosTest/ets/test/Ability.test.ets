/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() =>{
      context = AppStorage.get<common.UIAbilityContext>("abilityContext") as common.UIAbilityContext;
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number: SUB_AA_ABILITY_NewRule_connectServiceExtensionAbility_0100
     * @tc.name: SUB_AA_ABILITY_NewRule_connectServiceExtensionAbility_0100
     * @tc.desc: connectAppServiceExtensionAbility and disconnectAppServiceExtensionAbility success.
     */
    it('SUB_AA_ABILITY_NewRule_connectServiceExtensionAbility_0100', Level.LEVEL0, async(done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_connectAppServiceExtensionAbility_0100`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} START*********************************************`);
      let wantInfo: Want = {
        bundleName: "com.acts.context.aappserviceextension",
        abilityName: "AppServiceExtAbility",
      }
      let options: common.ConnectOptions = {
        onConnect(elementName, remote) {
          hilog.info(0x0000, 'connectServiceExtensionAbility_0100 onConnect', '%{public}s', `elementName: ${elementName}`)
          hilog.info(0x0000, 'connectServiceExtensionAbility_0100 onConnect', '%{public}s', `remote: ${remote}`);
        },
        onDisconnect(elementName) {
          hilog.info(0x0000, 'connectServiceExtensionAbility_0100 onDisconnect', '%{public}s',
            `elementName: ${elementName}`);
          done();
        },
        onFailed(code) {
          hilog.info(0x0000, 'connectServiceExtensionAbility_0100 onFailed', '%{public}s', `code: ${code}`);
          if(code === 801){
            expect(code).assertEqual(801);
            done()
          }else {
            expect().assertFail();
            done()
          }
        }
      };

      try {
        let data = context.connectAppServiceExtensionAbility(wantInfo, options);
        console.info('disconnectAppServiceExtensionAbility_0100 data', data);
        await sleep(2000);
        context.disconnectAppServiceExtensionAbility(data).then(() => {
          console.info('disconnectAppServiceExtensionAbility_0100 succeed');
        }).catch((err: BusinessError) => {
          console.info('disconnectAppServiceExtensionAbility_0100 catch');
          console.error(`disconnectAppServiceExtensionAbility failed, code is ${err.code}, message is ${err.message}`);
        });

      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.info('disconnectAppServiceExtensionAbility_0100 catch connectAppServiceExtensionAbility code', code);
        console.error(`connectServiceExtensionAbility failed, code is ${JSON.stringify(err)}`);
        console.error(`connectServiceExtensionAbility failed, code is ${code}, message is ${message}`);
      }
    })

    /**
     * @tc.number: SUB_AA_ABILITY_NewRule_connectAppServiceExtensionAbility_0200
     * @tc.name: SUB_AA_ABILITY_NewRule_connectAppServiceExtensionAbility_0200
     * @tc.desc: ErrorbundleName connectAppServiceExtensionAbility 16000001.
     */
    it('SUB_AA_ABILITY_NewRule_connectAppServiceExtensionAbility_0200', Level.LEVEL0, (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_connectAppServiceExtensionAbility_0100`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} START*********************************************`);
      let wantInfo: Want = {
        bundleName: "com.acts.context.aappserviceextensionError",
        abilityName: "AppServiceExtAbility",
      }
      let options: common.ConnectOptions = {
        onConnect(elementName, remote) {
          hilog.info(0x0000, 'connectServiceExtensionAbility_0200 onConnect', '%{public}s', `elementName: ${elementName}`)
          hilog.info(0x0000, 'connectServiceExtensionAbility_0200 onConnect', '%{public}s', `remote: ${remote}`);
          expect().assertFail();
          done()
        },
        onDisconnect(elementName) {
          hilog.info(0x0000, 'connectServiceExtensionAbility_0200 onDisconnect', '%{public}s',
            `elementName: ${elementName}`);
        },
        onFailed(code) {
          hilog.info(0x0000, 'connectServiceExtensionAbility_0200 onFailed', '%{public}s', `code: ${code}`);
          if(code === 801){
            expect(code).assertEqual(801);
            done()
          }else {
            expect(code).assertEqual(16000001);
            done()
          }
        }
      };

      try {
        context.connectAppServiceExtensionAbility(wantInfo, options);
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`connectServiceExtensionAbility failed, code is ${JSON.stringify(err)}`);
        console.error(`connectServiceExtensionAbility failed, code is ${code}, message is ${message}`);
      }
    })

    /**
     * @tc.number: SUB_AA_ABILITY_NewRule_connectServiceExtensionAbility_0300
     * @tc.name: SUB_AA_ABILITY_NewRule_connectServiceExtensionAbility_0300
     * @tc.desc: start startAppServiceExtensionAbility and stopAppServiceExtensionAbility success.
     */
    it('SUB_AA_ABILITY_NewRule_connectServiceExtensionAbility_0300', Level.LEVEL0, async(done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_connectServiceExtensionAbility_0300`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} START*********************************************`);
      let wantInfo: Want = {
        bundleName: "com.acts.context.aappserviceextension",
        abilityName: "AppServiceExtAbility",
      }
      try {
        context.startAppServiceExtensionAbility(wantInfo)
          .then(() => {
            console.info('startAppServiceExtensionAbility_0300 succeed');
          }).catch((err: BusinessError) => {
          let code = (err as BusinessError).code;
          if(code === 801){
            expect(code).assertEqual(801);
            done()
          }
          console.error(`startAppServiceExtensionAbility failed, code is ${err.code}, message is ${err.message}`);
        });
        await sleep(2000);
        context.stopAppServiceExtensionAbility(wantInfo)
          .then(() => {
            console.info('stopAppServiceExtensionAbility_0300 succeed');
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`stopAppServiceExtensionAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`startAppServiceExtensionAbility failed, code is ${code}, message is ${message}`);
        if(code === 801){
          expect(code).assertEqual(801);
          done()
        }
      }
    })

    /**
     * @tc.number: SUB_AA_ABILITY_NewRule_connectServiceExtensionAbility_0400
     * @tc.name: SUB_AA_ABILITY_NewRule_connectServiceExtensionAbility_0400
     * @tc.desc: ErrorbundleName startAppServiceExtensionAbility 16000001.
     */
    it('SUB_AA_ABILITY_NewRule_connectServiceExtensionAbility_0400', Level.LEVEL0, (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_connectServiceExtensionAbility_0400`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} START*********************************************`);
      let wantInfo: Want = {
        bundleName: "com.acts.context.aappserviceextensionError",
        abilityName: "AppServiceExtAbility",
      }
      let options: common.ConnectOptions = {
        onConnect(elementName, remote) {
          hilog.info(0x0000, 'connectServiceExtensionAbility_0400 onConnect', '%{public}s', `elementName: ${elementName}`)
          hilog.info(0x0000, 'connectServiceExtensionAbility_0400 onConnect', '%{public}s', `remote: ${remote}`);
        },
        onDisconnect(elementName) {
          hilog.info(0x0000, 'connectServiceExtensionAbility_0400 onDisconnect', '%{public}s',
            `elementName: ${elementName}`);
          done();
        },
        onFailed(code) {
          hilog.info(0x0000, 'connectServiceExtensionAbility_0400 onFailed', '%{public}s', `code: ${code}`);
          if(code === 801){
            expect(code).assertEqual(801);
            done()
          }else {
            expect(code).assertEqual(16000001);
            done()
          }
        }
      };
      try {
        context.startAppServiceExtensionAbility(wantInfo).then(() => {
          done()
        }).catch((err: BusinessError) => {
          let code = (err as BusinessError).code;
          if(code === 801){
            expect(code).assertEqual(801);
            done()
          }else {
            expect(code).assertEqual(16000001);
            done()
          }
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`connectServiceExtensionAbility failed, code is ${JSON.stringify(err)}`);
        console.error(`connectServiceExtensionAbility failed, code is ${code}, message is ${message}`);
      }
    })

    /**
     * @tc.number: SUB_AA_ABILITY_NewRule_connectServiceExtensionAbility_0500
     * @tc.name: SUB_AA_ABILITY_NewRule_connectServiceExtensionAbility_0500
     * @tc.desc: ErrorData disconnectAppServiceExtensionAbility 16000050.
     */
    it('SUB_AA_ABILITY_NewRule_connectServiceExtensionAbility_0500', Level.LEVEL0, (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_connectServiceExtensionAbility_0500`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} START*********************************************`);
      try {
        context.disconnectAppServiceExtensionAbility(-1).then(()=> {
          done()
        }).catch((err: BusinessError) => {
          let code = (err as BusinessError).code;
          if(code === 801){
            expect(code).assertEqual(801);
            done()
          }else {
            expect(code).assertEqual(16000050);
            done()
          }
        })
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`connectServiceExtensionAbility failed, code is ${JSON.stringify(err)}`);
        console.error(`connectServiceExtensionAbility failed, code is ${code}, message is ${message}`);
        if(code === 801){
          expect(code).assertEqual(801);
          done()
        }else {
          expect(code).assertEqual(16000050);
          done()
        }
      }
    })

    /**
     * @tc.number: 006
     * @tc.name: SUB_AA_ABILITY_NewRule_connectServiceExtensionAbility_0600
     * @tc.desc: connectServiceExtensionAbility and disconnectServiceExtensionAbility and terminateSelf success.
     */
    it('SUB_AA_ABILITY_NewRule_connectServiceExtensionAbility_0600', Level.LEVEL0, async (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_connectServiceExtensionAbility_0600`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} START*********************************************`);
      let wantInfo: Want = {
        bundleName: "com.acts.context.aappserviceextension",
        abilityName: "AppServiceExtAbility",
        parameters: {
          "case": '0600'
        }
      }
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["SUB_AA_ABILITY_NewRule_connectServiceExtensionAbility_0600"]
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        let tag = "connectServiceExtensionAbility_0600";
        sub = subscriber;
        console.info('====> [connectServiceExtensionAbility_0600] commonEventSubscribeInfo success: ');
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          console.info('commonEventData.parameters?.result', commonEventData.parameters?.result);
          hilog.info(0x0000, tag, '%{public}s', `tag  subscribecllback` + JSON.stringify(commonEventData));
          hilog.info(0x0000, tag, '%{public}s', `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          try {
            if(commonEventData.parameters?.result === 801){
              expect(commonEventData.parameters?.result).assertEqual(801);
            }else {
              expect(commonEventData.parameters?.result).assertEqual(200);
            }
          } catch {
          }
          commonEventManager.publish("teminate",() => {});
          commonEventManager.unsubscribe(subscriber, (err, data) => {
            done();
          });
        });
        try {
          context.startAppServiceExtensionAbility(wantInfo).then(() => {
            console.info('startAppServiceExtensionAbility_0600', "startAppServiceExtensionAbility_0600拉起成功");
            done()
          }).catch((err: BusinessError) => {
            let code = (err as BusinessError).code;
            console.error(`stopAppServiceExtensionAbility failed, code is ${err.code}, message is ${err.message}`);
            if(code === 801){
              expect(code).assertEqual(801);
              done()
            }else {
              expect().assertFail();
              done();
            }
          });
        } catch (err) {
          let code = (err as BusinessError).code;
          let message = (err as BusinessError).message;
          console.error(`connectServiceExtensionAbility failed, code is ${JSON.stringify(err)}`);
          console.error(`connectServiceExtensionAbility failed, code is ${code}, message is ${message}`);
          if(code === 801){
            expect(code).assertEqual(801);
            done()
          }
        }
      })
    })

    /**
     * @tc.number: SUB_AA_ABILITY_NewRule_connectServiceExtensionAbility_0700
     * @tc.name: SUB_AA_ABILITY_NewRule_connectServiceExtensionAbility_0700
     * @tc.desc: ErrorbundleName createSubscriber 16000001.
     */
    it('SUB_AA_ABILITY_NewRule_connectServiceExtensionAbility_0700', Level.LEVEL0, async (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_connectServiceExtensionAbility_0700`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} START*********************************************`);
      let wantInfo: Want = {
        bundleName: "com.acts.context.aappserviceextension",
        abilityName: "AppServiceExtAbility",
        parameters: {
          "case": '0700'
        }
      }
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["SUB_AA_ABILITY_NewRule_connectServiceExtensionAbility_0700"]
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        let tag = "connectServiceExtensionAbility_0700";
        sub = subscriber;
        console.info('====> [connectServiceExtensionAbility_0700] commonEventSubscribeInfo success: ');
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          console.info('commonEventData.parameters?.result', commonEventData.parameters?.result);
          hilog.info(0x0000, tag, '%{public}s', `tag  subscribecllback` + JSON.stringify(commonEventData));
          hilog.info(0x0000, tag, '%{public}s', `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          try {
            if(commonEventData.parameters?.result === 801){
              expect(commonEventData.parameters?.result).assertEqual(801);
            }else {
              expect(commonEventData.parameters?.result).assertEqual(16000001);
            }
          } catch {
            done();
          }
          commonEventManager.publish("teminate",() => {});
          commonEventManager.unsubscribe(subscriber, (err, data) => {
            done();
          });
        });
        try {
          context.startAppServiceExtensionAbility(wantInfo).then(() => {
            console.info('startAppServiceExtensionAbility_0700', "startAppServiceExtensionAbility_0700拉起成功");
            done()
          }).catch((err: BusinessError) => {
            let code = (err as BusinessError).code;
            console.error(`stopAppServiceExtensionAbility failed, code is ${err.code}, message is ${err.message}`);
            if(code === 801){
              expect(code).assertEqual(801);
              done()
            }else {
              expect().assertFail();
              done();
            }
          });
        } catch (err) {
          let code = (err as BusinessError).code;
          let message = (err as BusinessError).message;
          console.error(`connectServiceExtensionAbility failed, code is ${JSON.stringify(err)}`);
          console.error(`connectServiceExtensionAbility failed, code is ${code}, message is ${message}`);
          if(code === 801){
            expect(code).assertEqual(801);
            done()
          }
        }
      })
    })

    /**
     * @tc.number: SUB_AA_ABILITY_NewRule_connectServiceExtensionAbility_0800
     * @tc.name: SUB_AA_ABILITY_NewRule_connectServiceExtensionAbility_0800
     * @tc.desc: Errordata disconnectServiceExtensionAbility 16000050.
     */
    it('SUB_AA_ABILITY_NewRule_connectServiceExtensionAbility_0800', Level.LEVEL0, async (done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_connectServiceExtensionAbility_0800`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} START*********************************************`);
      let wantInfo: Want = {
        bundleName: "com.acts.context.aappserviceextension",
        abilityName: "AppServiceExtAbility",
        parameters: {
          "case": '0800'
        }
      }
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["SUB_AA_ABILITY_NewRule_connectServiceExtensionAbility_0800"]
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        let tag = "connectServiceExtensionAbility_0800";
        sub = subscriber;
        console.info('====> [connectServiceExtensionAbility_0800] commonEventSubscribeInfo success: ');
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          console.info('commonEventData.parameters?.result', commonEventData.parameters?.result);
          hilog.info(0x0000, tag, '%{public}s', `tag  subscribecllback` + JSON.stringify(commonEventData));
          hilog.info(0x0000, tag, '%{public}s', `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          try {
            if(commonEventData.parameters?.result === 801){
              expect(commonEventData.parameters?.result).assertEqual(801);
            }else {
              expect(commonEventData.parameters?.result).assertEqual(16000050);
            }
          } catch {
            done();
          }
          commonEventManager.publish("teminate",() => {});
          commonEventManager.unsubscribe(subscriber, (err, data) => {
            done();
          });
        });
        try {
          context.startAppServiceExtensionAbility(wantInfo).then(() => {
            console.info('startAppServiceExtensionAbility_0800', "startAppServiceExtensionAbility_0800拉起成功");
            done()
          }).catch((err: BusinessError) => {
            let code = (err as BusinessError).code;
            console.error(`stopAppServiceExtensionAbility failed, code is ${err.code}, message is ${err.message}`);
            if(code === 801){
              expect(code).assertEqual(801);
              done()
            }else {
              expect().assertFail();
              done();
            }
          });
        } catch (err) {
          let code = (err as BusinessError).code;
          let message = (err as BusinessError).message;
          console.error(`connectServiceExtensionAbility failed, code is ${JSON.stringify(err)}`);
          console.error(`connectServiceExtensionAbility failed, code is ${code}, message is ${message}`);
          if(code === 801){
            expect(code).assertEqual(801);
            done()
          }
        }
      })
    })
    /**
     * @tc.number: SUB_AA_ABILITY_NewRule_connectServiceExtensionAbility_0900
     * @tc.name: SUB_AA_ABILITY_NewRule_connectServiceExtensionAbility_0900
     * @tc.desc: ErrorButton stopAppServiceExtensionAbility 16000001.
     */
    it('SUB_AA_ABILITY_NewRule_connectServiceExtensionAbility_0900', Level.LEVEL0, async(done: Function) => {
      const tcNumber = `SUB_AA_ABILITY_NewRule_connectServiceExtensionAbility_0900`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tcNumber} START*********************************************`);
      let wantInfo: Want = {
        bundleName: "com.acts.context.aappserviceextension",
        abilityName: "AppServiceExtAbility",
      }
      let errorwantInfo: Want = {
        bundleName: "com.acts.context.aappserviceextension",
        abilityName: "AppServiceExtAbility",
      }
      try {
        context.startAppServiceExtensionAbility(wantInfo)
          .then(() => {
            console.info('SUB_AA_ABILITY_NewRule_connectServiceExtensionAbility_0900 succeed');
          }).catch((err: BusinessError) => {
          let code = (err as BusinessError).code;
          if(code === 801){
            expect(code).assertEqual(801);
            done()
          }
          console.error(`startAppServiceExtensionAbilityError failed, code is ${err.code}, message is ${err.message}`);
        });
        await sleep(2000);
        context.stopAppServiceExtensionAbility(errorwantInfo)
          .then(() => {
            console.info('startAppServiceExtensionAbilityError succeed');
            done();
          })
          .catch((err: BusinessError) => {
            let code = (err as BusinessError).code;
            console.error(`startAppServiceExtensionAbilityError failed, code is ${err.code}, message is ${err.message}`);
            expect(code).assertEqual(16000001);
            done();
          });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`startAppServiceExtensionAbilityError failed, code is ${code}, message is ${message}`);
        if(code === 801){
          expect(code).assertEqual(801);
          done()
        }
      }
    })
  })
}