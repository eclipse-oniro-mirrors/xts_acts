/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import Ability from '@ohos.app.ability.UIAbility';
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import commonEvent from '@ohos.commonEventManager';
import type Window from '@ohos.window';

class MyParcelable {
  num: number = 0;
  str: String = '';
  result: boolean = false;

  constructor(num, string, result) {
    this.num = num;
    this.str = string;
    this.result = result;
  }

  MyParcelable(num, string, result) {
    this.num = num;
    this.str = string;
    this.result = result;
  }

  marshalling(messageParcel) {
    messageParcel.writeInt(this.num);
    messageParcel.writeString(this.str);
    messageParcel.writeBoolean(this.result);
    return true;
  }

  unmarshalling(messageParcel) {
    this.num = messageParcel.readInt();
    this.str = messageParcel.readString();
    this.result = messageParcel.readBoolean();
    return true;
  }
}

export default class EntryAbility extends Ability {
  onCreate(want, launchParam) {
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
    hilog.info(0x0000, 'testTag', '%{public}s', 'launchParam:' + JSON.stringify(launchParam) ?? '');

    globalThis.terminate = () => {
      setTimeout(() => {
        this.context.terminateSelf().then(() => {
          console.debug('====>terminateSelf end');
        }).catch((err) => {
          console.debug('====>terminateSelf err:' + JSON.stringify(err));
        });
      }, 50)
    };

    globalThis.singleCallFunction_0100 = () => {
      this.context.startAbilityByCall({
        bundleName: 'com.acts.callapprely',
        abilityName: 'EntryAbility',
      }).then((caller) => {
        let param = new MyParcelable(100, 'Acts_SingleInstanceCallFunction_0100', false);
        caller.callWithResult('call', param).then((data) => {
          console.debug('====>Acts_SingleInstanceCallFunction_0100 call success');
          let result = new MyParcelable(0, '', false);
          data.readParcelable(result);
          caller.release();
          console.debug('====>Acts_SingleInstanceCallFunction_0100 callWithResult result:' + JSON.stringify(result));
          let commonEventData = {
            parameters: {
              num: result.num,
              str: result.str,
              result: result.result
            }
          };
          commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
            console.debug('====>Acts_SingleInstanceCallFunction_0100 publish err:' + JSON.stringify(err));
            globalThis.terminate();
          })
        }).catch((err) => {
          console.debug('====>Acts_SingleInstanceCallFunction_0100 callWithResult err:' + JSON.stringify(err));
        })
      }).catch((err) => {
        console.debug('====>Acts_SingleInstanceCallFunction_0100 startAbilityByCall err:' + JSON.stringify(err));
      })
    }

    globalThis.singleCallFunction_0200 = () => {
      this.context.startAbilityByCall({
        bundleName: 'com.acts.actscallfunction',
        abilityName: 'SecondAbility',
      }).then((caller) => {
        console.debug('====>Acts_SingleInstanceCallFunction_0200 startAbilityByCall caller:' + JSON.stringify(caller));
      }).catch((err) => {
        console.debug('====>Acts_SingleInstanceCallFunction_0200 startAbilityByCall err:' + JSON.stringify(err));
        let commonEventData = {
          parameters: {
            num: err.code,
          }
        };
        commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
          console.debug('====>Acts_SingleInstanceCallFunction_0200 publish err:' + JSON.stringify(err));
          globalThis.terminate();
        })
      })
    }

    globalThis.singleCallFunction_0300 = () => {

      function releaseCallback(data): void {
        console.debug('====>Acts_SingleInstanceCallFunction_0300 releaseCallBack:' + data);
        let commonEventData = {
          parameters: {
            str: data,
            result: true
          }
        };
        commonEvent.publish('ACTS_RELEASE_EVENT', commonEventData, (err) => {
          console.debug('====>Acts_SingleInstanceCallFunction_0300 onRelease event publish err:' + JSON.stringify(err));
        })
      }

      this.context.startAbilityByCall({
        bundleName: 'com.acts.callapprely',
        abilityName: 'EntryAbility',
      }).then((caller) => {
        caller.onRelease(releaseCallback);
        let param = new MyParcelable(300, 'Acts_SingleInstanceCallFunction_0300', false);
        caller.callWithResult('call', param).then((data) => {
          console.debug('====>Acts_SingleInstanceCallFunction_0300 call success');
          let result = new MyParcelable(0, '', false);
          data.readParcelable(result);
          console.debug('====>Acts_SingleInstanceCallFunction_0300 callWithResult result:' + JSON.stringify(result));
          let commonEventData = {
            parameters: {
              num: result.num,
              str: result.str,
              result: result.result
            }
          };
          commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
            console.debug('====>Acts_SingleInstanceCallFunction_0300 call event publish err:' + JSON.stringify(err));
            globalThis.terminate();
          })
          caller.release();
        }).catch((err) => {
          console.debug('====>Acts_SingleInstanceCallFunction_0300 callWithResult err:' + JSON.stringify(err));
        })
      }).catch((err) => {
        console.debug('====>Acts_SingleInstanceCallFunction_0300 startAbilityByCall err:' + JSON.stringify(err));
      })
    }

    globalThis.singleCallFunction_0400 = () => {
      let caller;

      function releaseCallback(data): void {
        console.debug('====>Acts_SingleInstanceCallFunction_0400 releaseCallBack:' + data);
        let commonEventData = {
          parameters: {
            str: data,
            result: true
          }
        };
        commonEvent.publish('ACTS_RELEASE_EVENT', commonEventData, (err) => {
          console.debug('====>Acts_SingleInstanceCallFunction_0400 onRelease event publish err:' + JSON.stringify(err));
        })
      }

      this.context.startAbilityByCall({
        bundleName: 'com.acts.callapprely',
        abilityName: 'EntryAbility'
      }).then((data) => {
        caller = data;
        caller.onRelease(releaseCallback);
        let param = new MyParcelable(400, 'Acts_SingleInstanceCallFunction_0400', false);
        caller.callWithResult('call', param).then((data) => {
          console.debug('====>Acts_SingleInstanceCallFunction_0400 call success');
          let result = new MyParcelable(0, '', false);
          data.readParcelable(result);
          console.debug('====>Acts_SingleInstanceCallFunction_0400 callWithResult result:' + JSON.stringify(result));
          let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          let forcestop = 'aa force-stop com.acts.callapprely';
          abilityDelegator.executeShellCommand(forcestop, (err, data) => {
            console.debug('====>Acts_SingleInstanceCallFunction_0400 forcestop err:' + JSON.stringify(err));
            let commonEventData = {
              parameters: {
                num: result.num,
                str: result.str,
                result: result.result
              }
            };
            commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
              console.debug('====>Acts_SingleInstanceCallFunction_0400 call event publish err:' + JSON.stringify(err));
              globalThis.terminate();
            })
          })
        }).catch(err => {
          console.debug('====>Acts_SingleInstanceCallFunction_0400 callWithResult err:' + JSON.stringify(err));
        })
      }).catch((err) => {
        console.debug('====>Acts_SingleInstanceCallFunction_0400 startAbilityByCall err:' + JSON.stringify(err));
      })
    }

    globalThis.MultipleCallFunction_0100 = () => {
      this.context.startAbilityByCall({
        bundleName: 'com.acts.thirdpartyapprely',
        abilityName: 'SecondAbility',
      }).then((caller) => {
        console.info('====>Acts_SingleInstanceCallFunction_0500 startAbilityByCall data:' + JSON.stringify(caller));
        let param = new MyParcelable(0, 'Acts_SingleInstanceCallFunction_0500', false);
        caller.callWithResult('call', param).then((data2) => {
          this.context.startAbilityByCall({
            bundleName: 'com.acts.thirdpartyapprely',
            abilityName: 'SecondAbility'
          }).then((caller2) => {
            let receivedData1 = new MyParcelable(0, '', false);
            data2.readParcelable(receivedData1);
            caller2.callWithResult('call', receivedData1).then((data3) => {
              console.info('====>Acts_SingleInstanceCallFunction_0500 call_result:' + JSON.stringify(data3));
              let receivedData = new MyParcelable(0, '', false);
              data3.readParcelable(receivedData);
              caller2.release();
              let commonEventData = {
                parameters: {
                  num: receivedData.num,
                  str: receivedData.str,
                }
              };
              commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
                console.log('====>Acts_SingleInstanceCallFunction_0500 publish err:' + JSON.stringify(err));
                globalThis.terminate();
              })
            })
          })
          caller.release()
        }
        ).catch((err) => {
          console.info('====>Acts_SingleInstanceCallFunction_0500 callWithResult err:' + JSON.stringify(err));
        })
      }).catch((err) => {
        console.info('====>Acts_SingleInstanceCallFunction_0500 startAbilityByCall err:' + JSON.stringify(err));
      })
    }

    globalThis.MultipleCallFunction_0300 = () => {
      this.context.startAbilityByCall({
        bundleName: 'com.acts.thirdpartyapprely',
        abilityName: 'SecondAbility',
      }).then((caller) => {
        console.info('====>Acts_SingleInstanceCallFunction_0700 startAbilityByCall caller:' +
        JSON.stringify(caller));
        let param = new MyParcelable(0, 'Acts_SingleInstanceCallFunction_0700', false);
        caller.callWithResult('call', param).then((data2) => {
          let receivedData1 = new MyParcelable(0, '', false);
          data2.readParcelable(receivedData1);
          let isCallerRelease = false;
          caller.onRelease((err) => {
            if (err === 'release') {
              isCallerRelease = true;
              console.info('====>Acts_SingleInstanceCallFunction_0700  first onrelease :' + JSON.stringify(err));
              receivedData1.str = 'release the first caller successful';
            }
          })
          caller.release();
          let callerReleaseRetryNum = 0;
          let intervalId = setInterval(() => {
            callerReleaseRetryNum++;
            if (callerReleaseRetryNum === 10 || isCallerRelease) {
              clearInterval(intervalId);
              this.context.startAbilityByCall({
                bundleName: 'com.acts.thirdpartyapprely',
                abilityName: 'SecondAbility'
              }).then((caller2) => {
                caller2.callWithResult('call', receivedData1).then((data3) => {
                  console.info('====>Acts_SingleInstanceCallFunction_0700 call_result:' + JSON.stringify(data3));
                  let receivedData = new MyParcelable(0, '', false);
                  data3.readParcelable(receivedData);
                  caller2.onRelease((err) => {
                    if (err === 'release') {
                      receivedData.str = `${receivedData.str}, release the second caller successful.`
                      let commonEventData = {
                        parameters: {
                          num: receivedData.num,
                          str: receivedData.str
                        }
                      };
                      commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
                        console.log('====>Acts_SingleInstanceCallFunction_0700 publish err:' + JSON.stringify(err));
                        globalThis.terminate();
                      })
                    }
                  })
                  caller2.release();
                })
              })
            }
          }, 200)
        }
        ).catch((err) => {
          console.info('====>Acts_SingleInstanceCallFunction_0700 callWithResult err:' + JSON.stringify(err));
        })
      }).catch((err) => {
        console.info('====>Acts_SingleInstanceCallFunction_0700 startAbilityByCall err:' + JSON.stringify(err));
      })
    }

    globalThis.MultipleCallFunction_0400 = () => {
      let count = 0;
      let isCallerRelease = false;
      let isCaller1Release = false;
      let verifyResult = (str) => {
        console.info('====>Acts_SingleInstanceCallFunction_0800 verify' + isCallerRelease + " " + isCaller1Release);
        if (isCallerRelease && isCaller1Release) {
          let commonEventData = {
            parameters: {
              num: 2,
              str: str
            }
          };
          commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
            console.log('====>Acts_SingleInstanceCallFunction_0800 publish err:' + JSON.stringify(err));
            globalThis.terminate();
          })
        }
      }
      console.info('====>Acts_SingleInstanceCallFunction_0800 entryability data:');
      this.context.startAbilityByCall({
        bundleName: 'com.acts.thirdpartyapprely',
        abilityName: 'SecondAbility',
      }).then((caller) => {
        console.info('====>Acts_SingleInstanceCallFunction_0800 startAbilityByCall caller:' +
        JSON.stringify(caller));
        let param = new MyParcelable(0, 'Acts_SingleInstanceCallFunction_0800', false);
        caller.callWithResult('call', param).then((data2) => {
          let receivedData1 = new MyParcelable(0, '', false);
          data2.readParcelable(receivedData1);
          caller.onRelease((err) => {
            if (err == 'died') {
              console.info('====>Acts_SingleInstanceCallFunction_0800 first onRelease :' + JSON.stringify(err));
              count++;
              isCaller1Release = true;
              receivedData1.num = count;
              verifyResult(receivedData1.str);
            }
          })
          this.context.startAbilityByCall({
            bundleName: 'com.acts.thirdpartyapprely',
            abilityName: 'SecondAbility',
          }).then((caller2) => {
            caller2.callWithResult('call', receivedData1).then((data3) => {
              console.info('====>Acts_SingleInstanceCallFunction_0800 call_result:' + JSON.stringify(data3));
              let receivedData = new MyParcelable(0, '', false);
              data3.readParcelable(receivedData);
              caller2.onRelease((err) => {
                if (err == 'died') {
                  count++;
                  receivedData.num = count;
                  isCallerRelease = true;
                  verifyResult(receivedData.str);
                  console.info('====>Acts_SingleInstanceCallFunction_0800 second onRelease:' + receivedData.str);
                }
              })
              let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
              let pkillCmd = 'aa force-stop com.acts.thirdpartyapprely';
              abilityDelegator.executeShellCommand(pkillCmd, (err, data) => {
                console.info('====>Acts_SingleInstanceCallFunction_0800 pkillCmd err:' + JSON.stringify(err));
              })
            })
          })
        }).catch((err) => {
          console.info('====>Acts_SingleInstanceCallFunction_0800 callWithResult err:' + JSON.stringify(err));
        })
      }).catch((err) => {
        console.info('====>Acts_SingleInstanceCallFunction_0800 startAbilityByCall err:' + JSON.stringify(err));
      })
    }

    globalThis.multipleAndSingleCallFunction_0100 = () => {
      let firstCaller;
      let secondCaller;
      let thirdCaller;
      this.context.startAbilityByCall({
        bundleName: 'com.acts.callapprely',
        abilityName: 'EntryAbility',
      }).then((caller) => {
        firstCaller = caller;
        let num = 100;
        let param = new MyParcelable(num, 'Acts_SingleInstanceCallFunction_0900', false);
        firstCaller.callWithResult('call', param).then((data) => {
          console.debug('====>Acts_SingleInstanceCallFunction_0900 call success');
          let result = new MyParcelable(0, '', false);
          data.readParcelable(result);
          console.debug('====>Acts_SingleInstanceCallFunction_0900 callWithResult result:' +
          JSON.stringify(result));
          let commonEventData = {
            parameters: {
              num: result.num,
              str: result.str,
              result: result.result
            }
          };
          commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
            console.debug('====>Acts_SingleInstanceCallFunction_0900 publish err:' + JSON.stringify(err));
          })
          this.context.startAbilityByCall({
            bundleName: 'com.acts.callapprely',
            abilityName: 'SecondAbility',
            action: 'multipleAndSingleCallFunction_0100'
          }).then((caller) => {
            secondCaller = caller;
            console.info('====>Acts_SingleInstanceCallFunction_0900 startAbilityByCall data:' +
            JSON.stringify(secondCaller));
            let param = new MyParcelable(0, 'Acts_SingleInstanceCallFunction_0900', false);
            secondCaller.callWithResult('call', param).then((data2) => {
              this.context.startAbilityByCall({
                bundleName: 'com.acts.callapprely',
                abilityName: 'SecondAbility',
                action: 'multipleAndSingleCallFunction_0100'
              }).then((caller) => {
                thirdCaller = caller;
                let receivedData1 = new MyParcelable(0, '', false);
                data2.readParcelable(receivedData1);
                thirdCaller.callWithResult('call', receivedData1).then((data3) => {
                  let receivedData = new MyParcelable(0, '', false);
                  data3.readParcelable(receivedData);
                  console.info('====>Acts_SingleInstanceCallFunction_0900 receivedData:' +
                  JSON.stringify(receivedData));
                  let commonEventData = {
                    parameters: {
                      num: receivedData.num,
                      str: receivedData.str,
                    }
                  };
                  commonEvent.publish('ACTS_SECOND_CALL_EVENT', commonEventData, (err) => {
                    console.log('====>Acts_SingleInstanceCallFunction_0900 publish err:' +
                    JSON.stringify(err));
                    thirdCaller.release();
                    secondCaller.release();
                    firstCaller.release();
                    globalThis.terminate();
                  })
                })
              }).catch((err) => {
                console.info('====>Acts_SingleInstanceCallFunction_0900 multiple second err: ' + JSON.stringify(err));
              })
            })
          }).catch((err) => {
            console.info('====>Acts_SingleInstanceCallFunction_0900 multiple first err:' + JSON.stringify(err));
          })
        })
      })
    }

    globalThis.Acts_SingleInstanceCallFunction_1000 = () => {
      console.info('====>Acts_SingleInstanceCallFunction_1000 entryability data:');
      this.context.startAbilityByCall({
        bundleName: 'com.acts.thirdpartyapprely',
        abilityName: 'SecondAbility',
      }).then((caller) => {
        console.info('====>Acts_SingleInstanceCallFunction_1000 startAbilityByCall caller:' +
        JSON.stringify(caller));
        let param = new MyParcelable(0, 'Acts_SingleInstanceCallFunction_1000 single', false);
        caller.callWithResult('call', param).then((data) => {
          console.info('====>Acts_SingleInstanceCallFunction_1000 startAbilityByCall caller2:' +
          JSON.stringify(data));
          let receivedData = new MyParcelable(0, '', false);
          data.readParcelable(receivedData);
          let commonEventData = {
            parameters: {
              num: receivedData.num,
              str: receivedData.str,
            }
          };
          commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
            console.log('====>Acts_SingleInstanceCallFunction_1000 publish err:' + JSON.stringify(err));
            globalThis.terminate();
          })
        }).catch((err) => {
          console.info('====>Acts_SingleInstanceCallFunction_1000 callWithResult err:' + JSON.stringify(err));
        })
      }).catch((err) => {
        console.info('====>Acts_SingleInstanceCallFunction_1000 startAbilityByCall err:' + JSON.stringify(err));
      })
    }

    globalThis.Acts_SingleInstanceCallFunction_1100 = () => {
      console.info('====>Acts_SingleInstanceCallFunction_1100 entryability data:');
      this.context.startAbilityByCall({
        bundleName: 'com.acts.callapprely',
        abilityName: 'SecondAbility',
        action: 'Acts_SingleInstanceCallFunction_1100'
      }).then((caller) => {
        console.info('====>Acts_SingleInstanceCallFunction_1100 actscallfunction startAbilityByCall caller:' +
        JSON.stringify(caller));
        let param = new MyParcelable(0, 'Acts_SingleInstanceCallFunction_1100 callerA', false);
        console.info('====>Acts_SingleInstanceCallFunction_1100 startAbilityByCall2 caller:' +
        JSON.stringify(caller));
        caller.callWithResult('call', param).then((data) => {
          console.info('====>Acts_SingleInstanceCallFunction_1100 actscallfunction callWithResult caller:' +
          JSON.stringify(data));
          let receivedData = new MyParcelable(0, '', false);
          data.readParcelable(receivedData);
          let commonEventData = {
            parameters: {
              num: receivedData.num,
              str: receivedData.str,
            }
          };
          commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
            console.log('====>Acts_SingleInstanceCallFunction_1100 actscallfunction publish err:' +
            JSON.stringify(err));
          })
        }).catch((err) => {
          console.info('====>Acts_SingleInstanceCallFunction_1100 callWithResult err:' + JSON.stringify(err));
        })
      }).catch((err) => {
        console.info('====>Acts_SingleInstanceCallFunction_1100 startAbilityByCall err:' + JSON.stringify(err));
      })
      globalThis.terminate();
    }

    globalThis.Acts_SingleInstanceCallFunction_1200 = () => {
      console.info('====>Acts_SingleInstanceCallFunction_1200 entryability data:');
      this.context.startAbilityByCall({
        bundleName: 'com.acts.callapprely',
        abilityName: 'ThirdAbility'
      }).then((caller) => {
        console.info('====>Acts_SingleInstanceCallFunction_1200 actscallfunction startAbilityByCall caller:' +
        JSON.stringify(caller));
      }).catch((err) => {
        console.info('====>Acts_SingleInstanceCallFunction_1200 actscallfunction startAbilityByCall caller err:' +
        JSON.stringify(err));
        let commonEventData = {
          parameters: {
            num: err
          }
        };
        commonEvent.publish('ACTS_CALL_EVENT', commonEventData, (err) => {
          console.log('====>Acts_SingleInstanceCallFunction_1200 publish err:' + JSON.stringify(err));
          globalThis.terminate();
        })
      })
    }

    if (want.action === 'Acts_SingleInstanceCallFunction_0100') {
      globalThis.singleCallFunction_0100();
    }
    if (want.action === 'Acts_SingleInstanceCallFunction_0200') {
      globalThis.singleCallFunction_0200();
    }
    if (want.action === 'Acts_SingleInstanceCallFunction_0300') {
      globalThis.singleCallFunction_0300();
    }
    if (want.action === 'Acts_SingleInstanceCallFunction_0400') {
      globalThis.singleCallFunction_0400();
    }
    if (want.action === 'Acts_SingleInstanceCallFunction_0500') {
      globalThis.MultipleCallFunction_0100();
    }
    if (want.action === 'Acts_SingleInstanceCallFunction_0700') {
      globalThis.MultipleCallFunction_0300();
    }
    if (want.action === 'Acts_SingleInstanceCallFunction_0800') {
      globalThis.MultipleCallFunction_0400();
    }
    if (want.action === 'Acts_SingleInstanceCallFunction_0900') {
      globalThis.multipleAndSingleCallFunction_0100();
    }
    if (want.action === 'Acts_SingleInstanceCallFunction_1000') {
      globalThis.Acts_SingleInstanceCallFunction_1000();
    }
    if (want.action === 'Acts_SingleInstanceCallFunction_1100') {
      globalThis.Acts_SingleInstanceCallFunction_1100();
    }
    if (want.action === 'Acts_SingleInstanceCallFunction_1200') {
      globalThis.Acts_SingleInstanceCallFunction_1200();
    }
  }

  onDestroy() {
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: Window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.ERROR);
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    // Ability has back to background
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
