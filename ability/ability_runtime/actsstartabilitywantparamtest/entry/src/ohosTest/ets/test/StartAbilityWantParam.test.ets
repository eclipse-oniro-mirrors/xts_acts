/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import fs from '@ohos.file.fs';
import common from '@ohos.app.ability.common';
import rpc from '@ohos.rpc';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import commonEvent from '@ohos.commonEvent';
import resourceManager from '@ohos.resourceManager';
import { BusinessError } from '@ohos.base';
import Want from '@ohos.app.ability.Want';
import CommonEventManager from '@ohos.commonEventManager';
import bundle from '@ohos.bundle.bundleManager';

const TEST_SUITE_NAME: string = 'StartAbilityWantParamTest'
const EVENT_WantParametersJs_0100 = 'SUB_Ability_AbilityBase_WantParam_WantParametersJs_0100'
const EVENT_WantParametersJs_0200 = 'SUB_Ability_AbilityBase_WantParam_WantParametersJs_0200'
const EVENT_WantParametersJs_0300 = 'SUB_Ability_AbilityBase_WantParam_WantParametersJs_0300'
const EVENT_WantParametersJs_0400 = 'SUB_Ability_AbilityBase_WantParam_WantParametersJs_0400'
const EVENT_WantParametersJs_0500 = 'SUB_Ability_AbilityBase_WantParam_WantParametersJs_0500'
const EVENT_WantParametersJs_0600 = 'SUB_Ability_AbilityBase_WantParam_WantParametersJs_0600'
const EVENT_WantParametersJs_1600 = 'SUB_Ability_AbilityBase_WantParam_WantParametersJs_1600'
let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
let targetVersion: number = 12;

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time))
}

function getParameterFd(fd:number):ESObject {
  let param:ESObject = {
    'keyFd': {
      'type': 'FD', 'value': fd
    } as ESObject
  };
  return param;
}

async function startAbilityTest(ability:string, parameters:ESObject):Promise<void> {
  let wantInfo:Want = {
    "bundleName": "com.ohos.startabilitywantparamtest",
    "abilityName": ability,
    "parameters": parameters
  }
  return abilityDelegator.startAbility(wantInfo);
}

export default function startAbilityWantParamTest() {
  let fail = (done:Function):void => {
    expect().assertFail();
    done();
  }

  class CurrentRemoteObject extends rpc.RemoteObject {
  }

  describe('ActsStartAbilityWantParamTest', () => {

    beforeAll((done:Function) => {
      bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).then(data => {
        console.info('getBundleInfoForSelf' + JSON.stringify(data));
        targetVersion = data.targetVersion;
        console.info('getBundleInfoForSelf targetVersion=' + targetVersion);
        done();
      }).catch((err: BusinessError) => {
        console.info('getBundleInfoForSelf fail' + JSON.stringify(err));
        console.info('getBundleInfoForSelf fail targetVersion=' + targetVersion);
        done();
      })
    })

    beforeEach((done:Function) => {
      setTimeout(()=>{
        done();
      }, 1000)
    })

    /**
     * @tc.number    : SUB_Ability_AbilityBase_WantParam_WantParametersJs_0800
     * @tc.name      : In the parameters carried by want, the type is FD and the value is -1
     * @tc.desc      : test startAbility want parameters："keyFd":{"type":"FD", "value":-1}
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_Ability_AbilityBase_WantParam_WantParametersJs_0800", 3, async (done:Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityBase_WantParam_WantParametersJs_0800';
      try {
        await startAbilityTest('WantAbility', getParameterFd(-1)).then(() => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} start successful`);
          fail(done);
        }).catch((error:BusinessError) => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} error :${JSON.stringify(error)}}`);
          if (targetVersion >= 20) {
            expect(error.code).assertEqual(16000050);
          } else {
            expect(error.code).assertEqual(2097167);
          }
          done();
        })
      } catch (err) {
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} fail: ${err}`);
        fail(done);
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityBase_WantParam_WantParametersJs_0700
     * @tc.name      : In the parameters carried by want, the type is FD and the value is 0
     * @tc.desc      : test startAbility want parameters："keyFd":{"type":"FD", "value":0}.
     *                 if api < 20, expecting start ability failure and the error code is 2097167. Actually,
     *                 if api >= 20, expecting start ability failure and the error code is 16000050. Actually,
     *                 the ability can be started successful.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_Ability_AbilityBase_WantParam_WantParametersJs_0700", 3, async (done:Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityBase_WantParam_WantParametersJs_0700';
      try {
        await startAbilityTest('WantAbility', getParameterFd(0)).then(() => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} start successful`);
          done();
        }).catch((error:BusinessError) => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} error :${JSON.stringify(error)}}`);
          fail(done);
        })
      } catch (err) {
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} fail: ${err}`);
        fail(done);
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityBase_WantParam_WantParametersJs_0100
     * @tc.name      : The type is a RemoteObject and the value is a remoteObj in the parameters carried by want
     * @tc.desc      : test startAbility want parameters："keyRemoteObj":{"type":"RemoteObject", "value":remoteObj}
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_Ability_AbilityBase_WantParam_WantParametersJs_0100", 1, async (done:Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityBase_WantParam_WantParametersJs_0100';
      try {
        let remoteObj = new CurrentRemoteObject('WantParam_WantParametersJs_0100')
        let parameter:ESObject = {
          "keyRemoteObj": {
            "type": "RemoteObject", "value": remoteObj
          } as ESObject
        }
        let commonEventSubscribeInfo:CommonEventManager.CommonEventSubscribeInfo = {
          events: [EVENT_WantParametersJs_0100]
        }
        await commonEvent.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          commonEvent.subscribe(subscriber, (err, commonEventData) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe sunccess : ${JSON.stringify(commonEventData)},
                          parameter : ${JSON.stringify(parameter)}`);
            expect(JSON.stringify(commonEventData.parameters!.keyRemoteObj)).assertEqual(JSON.stringify(parameter.keyRemoteObj))
            commonEvent.unsubscribe(subscriber, (err, data) => {
              done();
            });
          })
        })
        await startAbilityTest("WantFirstAbility", parameter).then(() => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability success`);
        }, (err:BusinessError) => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} exception : ${JSON.stringify(err)}`);
          fail(done);
          done();
        })
      } catch (err) {
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} exception : ${JSON.stringify(err)}`);
        fail(done);
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityBase_WantParam_WantParametersJs_1000
     * @tc.name      : The type is a RemoteObject and the value is a remoteObj in the parameters carried by want
     * @tc.desc      : test startAbility want parameters："keyRemoteObj":{"type":"RemoteObject", "value":remoteObj is empty}
     *                 if api < 20, expecting start ability failure and the error code is 2097167. Actually,
     *                 if api >= 20, expecting start ability failure and the error code is 16000050. Actually,
     *                 can be started successfully
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_Ability_AbilityBase_WantParam_WantParametersJs_1000", 3, async (done:Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityBase_WantParam_WantParametersJs_1000';
      try {
        let remoteObj: CurrentRemoteObject | undefined = undefined;
        let keyRemoteObj:ESObject = {
          'type': 'RemoteObject',
          'value': remoteObj
        }
        await startAbilityTest('WantAbility', keyRemoteObj).then(() => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability success`);
          done();
        }, (error:BusinessError) => {
          console.error(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability err : ${JSON.stringify(error)}`);
        })
      } catch (err) {
        console.error(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} exception : ${JSON.stringify(err)}`);
        fail(done);
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityBase_WantParam_WantParametersJs_0500
     * @tc.name      : The value in the parameters carried by want is JSON data, and the value in JSON data is an array
     * @tc.desc      : test startAbility want parameters："keyArrayObj":{"data":[1,2,3]}
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_Ability_AbilityBase_WantParam_WantParametersJs_0500", 3, async (done:Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityBase_WantParam_WantParametersJs_0500';
      try {
        let parameter:ESObject = {
          keyArrayObj: {
            "data": [1, 2, 3]
          } as ESObject
        }
        let commonEventSubscribeInfo:CommonEventManager.CommonEventSubscribeInfo = {
          events: [EVENT_WantParametersJs_0500]
        }
        await commonEvent.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          commonEvent.subscribe(subscriber, (err, commonEventData) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe sunccess : ${JSON.stringify(commonEventData)},
                          parameter : ${JSON.stringify(parameter)}`);
            expect(JSON.stringify(commonEventData.parameters!.keyArrayObj)).assertEqual(JSON.stringify(parameter.keyArrayObj));
            commonEvent.unsubscribe(subscriber, () => {
              done();
            });
          })
        })
        await startAbilityTest('WantFifthAbility', parameter).then(() => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability success`);
        }, (error:BusinessError) => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability err : ${JSON.stringify(error)}`);
          fail(done);
        })
      } catch (err) {
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} exception : ${JSON.stringify(err)}`);
        fail(done);
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityBase_WantParam_WantParametersJs_0300
     * @tc.name      : The value in the parameters carried by want is JSON data
     * @tc.desc      : test startAbility want parameters："keyObj":{"name":"zhangsan", "sex":1}
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_Ability_AbilityBase_WantParam_WantParametersJs_0300", 3, async (done:Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityBase_WantParam_WantParametersJs_0300';
      try {
        let parameter:ESObject = {
          "keyObj": {
            "name": "zhangsan", "sex": 1
          } as ESObject
        }
        let commonEventSubscribeInfo:CommonEventManager.CommonEventSubscribeInfo = {
          events: [EVENT_WantParametersJs_0300]
        }
        await commonEvent.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          commonEvent.subscribe(subscriber, (err, commonEventData) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe sunccess : ${JSON.stringify(commonEventData)},
                          parameter : ${JSON.stringify(parameter)}`);
            expect(JSON.stringify(commonEventData.parameters!.keyObj)).assertEqual(JSON.stringify(parameter.keyObj))
            commonEvent.unsubscribe(subscriber, (err, data) => {
              done();
            });
          })
        })
        await startAbilityTest('WantThirdAbility', parameter).then(() => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability success`);
        }, (error:BusinessError) => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability err : ${JSON.stringify(error)}`);
          fail(done);
        })
      } catch (err) {
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} exception : ${JSON.stringify(err)}`);
        fail(done);
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityBase_WantParam_WantParametersJs_0400
     * @tc.name      : The value in the parameters carried by want is the JSON type, and the value in the JSON is the JSON data
     * @tc.desc      : test startAbility want parameters："keyFlexObj":{"data":{"info":"abcd", "len":4}}
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_Ability_AbilityBase_WantParam_WantParametersJs_0400", 3, async (done:Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityBase_WantParam_WantParametersJs_0400';
      try {
        let parameter:ESObject = {
          "keyFlexObj": {
            "data": {
              "info": "abcd", "len": 4
            } as ESObject
          } as ESObject
        }
        let commonEventSubscribeInfo:CommonEventManager.CommonEventSubscribeInfo = {
          events: [EVENT_WantParametersJs_0400]
        }
        await commonEvent.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          commonEvent.subscribe(subscriber, (err, commonEventData) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe sunccess : ${JSON.stringify(commonEventData)},
                           parameter : ${JSON.stringify(parameter)}`);
            expect(JSON.stringify(commonEventData.parameters!.keyFlexObj)).assertEqual(JSON.stringify(parameter.keyFlexObj))
            commonEvent.unsubscribe(subscriber, (err, data) => {
              done();
            });
          })
        })
        await startAbilityTest('WantFourthAbility', parameter).then(() => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability success`);
        }, (error:BusinessError) => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability err : ${JSON.stringify(error)}`);
          fail(done);
        })
      } catch (err) {
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} exception : ${JSON.stringify(err)}`);
        fail(done);
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityBase_WantParam_WantParametersJs_1600
     * @tc.name      : The parameters carried by want carry multiple parameter types
     * @tc.desc      : test startAbility want parameters：
     *                 "keyRemoteObj":{"type":"RemoteObject", "value":remoteObj},
     *                 "keyFd":{"type":"FD", "value":fd},
     *                 "keyFlexObj":{"data":{"info":"abcd", "len":4}},
     *                 "key1":[{"data1":"value1","data2":"value2"},{"data3":"value3","data4":"value4"}],
     *                 "keyObj":{"name":"zhangsan", "sex":1},
     *                 "keyArrayObj":{"data":[1,2,3]}}
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_Ability_AbilityBase_WantParam_WantParametersJs_1600", 3, async (done:Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityBase_WantParam_WantParametersJs_1600';
      try {
        let remoteObject = new CurrentRemoteObject('WantParam_WantParametersJs_1600')
        let parameter:ESObject = {
          multi: {
            "keyRemoteObj": {
              "type": "RemoteObject", "value": remoteObject
            } as ESObject,
            "keyFd": {
              "type": "FD", "value": 1
            } as ESObject,
            "keyFlexObj": {
              "data": {
                "info": "abcd", "len": 4
              } as ESObject
            } as ESObject,
            "key1": [
              {
                "data1": "value1", "data2": "value2"
              } as ESObject, 
              {
                "data3": "value3", "data4": "value4"
              } as ESObject
            ],
            "keyObj": {
              "name": "zhangsan", "sex": 1
            } as ESObject,
            "keyArrayObj": {
              "data": [1, 2, 3]
            } as ESObject
          } as ESObject
        }
        let commonEventSubscribeInfo:CommonEventManager.CommonEventSubscribeInfo = {
          events: [EVENT_WantParametersJs_1600]
        }
        await commonEvent.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          commonEvent.subscribe(subscriber, (err, commonEventData) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe sunccess : ${JSON.stringify(commonEventData.parameters)},
                           parameter : ${JSON.stringify(parameter)}`);
            expect(JSON.stringify(parameter.multi.keyRemoteObj)).assertEqual(JSON.stringify(commonEventData.parameters!.multi.keyRemoteObj))
            expect(JSON.stringify(parameter.multi.keyFlexObj)).assertEqual(JSON.stringify(commonEventData.parameters!.multi.keyFlexObj))
            expect(JSON.stringify(parameter.multi.key1)).assertEqual(JSON.stringify(commonEventData.parameters!.multi.key1))
            expect(JSON.stringify(parameter.multi.keyObj)).assertEqual(JSON.stringify(commonEventData.parameters!.multi.keyObj))
            expect(JSON.stringify(parameter.multi.keyArrayObj)).assertEqual(JSON.stringify(commonEventData.parameters!.multi.keyArrayObj))
            commonEvent.unsubscribe(subscriber, (err, data) => {
              done();
            });
          })
        })
        await startAbilityTest('WantSixteenAbility', parameter).then(() => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability success`);
        }, (error:BusinessError) => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability err : ${JSON.stringify(error)}`);
          fail(done);
        })
      } catch (err) {
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} exception : ${JSON.stringify(err)}`);
        fail(done);
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityBase_WantParam_WantParametersJs_0600
     * @tc.name      : The value in the parameters carried by want is a JSON array
     * @tc.desc      : test startAbility want parameters："key1":[{"data1":"value1","data2":"value2"},
     *                 {"data3":"value3","data4":"value4"}]
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_Ability_AbilityBase_WantParam_WantParametersJs_0600", 3, async (done:Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityBase_WantParam_WantParametersJs_0600';
      try {
        let parameter:ESObject = {
          "key1":
          [
            {
              "data1": "value1", "data2": "value2"
            } as ESObject,
            {
              "data3": "value3", "data4": "value4"
            } as ESObject
          ]
        }
        let commonEventSubscribeInfo:CommonEventManager.CommonEventSubscribeInfo = {
          events: [EVENT_WantParametersJs_0600]
        }
        await commonEvent.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          commonEvent.subscribe(subscriber, (err, commonEventData) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe sunccess : ${JSON.stringify(commonEventData)},
                          parameter : ${JSON.stringify(parameter)}`);
            expect(JSON.stringify(commonEventData.parameters!.key1)).assertEqual(JSON.stringify(parameter.key1))
            commonEvent.unsubscribe(subscriber, (err, data) => {
              done();
            });
          })
        })
        await startAbilityTest('WantSixthAbility', parameter).then(() => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability success`);
        }, (error:BusinessError) => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability err : ${JSON.stringify(error)}`);
          fail(done);
        })
      } catch (err) {
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} exception : ${JSON.stringify(err)}`);
        fail(done);
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityBase_WantParam_WantParametersJs_0200
     * @tc.name      : The type is FD and the value is the correct image index value in the parameters carried by want
     * @tc.desc      : test startAbility want parameters："keyFd":{"type":"FD", "value": fd}
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_Ability_AbilityBase_WantParam_WantParametersJs_0200", 3, async (done:Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityBase_WantParam_WantParametersJs_0200';
      let fd : number = -1;
      try {
        let filePath = abilityDelegator.getAppContext().filesDir + '/xts.png'
        let file = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        fd = file.fd;
        let parameter:ESObject = {
          "keyFd": {
            "type": "FD",
            "value": fd
          } as ESObject
        }
        let commonEventSubscribeInfo:CommonEventManager.CommonEventSubscribeInfo = {
          events: [EVENT_WantParametersJs_0200]
        }
        await commonEvent.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          commonEvent.subscribe(subscriber, (err, commonEventData) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe sunccess : ${JSON.stringify(commonEventData.parameters!.keyFd)},
                           parameter : ${JSON.stringify(parameter)}`);
            expect(commonEventData.parameters!.keyFd.type).assertEqual(parameter.keyFd.type);
            commonEvent.unsubscribe(subscriber, (err, data) => {
              done();
            });
          })
        })

        await startAbilityTest('WantSecondAbility', parameter).then(() => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability success`);
        }, (error:BusinessError) => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability err : ${JSON.stringify(error)}`);
          fail(done);
        })
      } catch (err) {
        console.error(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} err:${JSON.stringify(err)}`);
        fail(done);
      } finally {
        fs.closeSync(fd);
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityBase_WantParam_WantParametersJs_0900
     * @tc.name      : In the parameters carried by want, the type is FD and the value is the string type
     * @tc.desc      : test startAbility want parameters："keyFd":{"type":"FD", "value": "err"}
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_Ability_AbilityBase_WantParam_WantParametersJs_0900", 3, async (done:Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityBase_WantParam_WantParametersJs_0900';
      try {
        await abilityDelegator.startAbility({
          bundleName: 'com.ohos.startabilitywantparamtest',
          abilityName: 'WantAbility',
          parameters: {
            "keyFd": {
              "type": "FD",
              "value": "err"
            }
          }
        }).then(() => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} start successful`);
          fail(done);
          done();
        }, (error:BusinessError) => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} error :${JSON.stringify(error)}}`);
          if (targetVersion >= 20) {
            expect(error.code).assertEqual(16000050);
          } else {
            expect(error.code).assertEqual(2097167);
          }
          done();
        })
      } catch (err) {
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} fail: ${err}`);
        fail(done);
        done();
      }
    })
  })
}

