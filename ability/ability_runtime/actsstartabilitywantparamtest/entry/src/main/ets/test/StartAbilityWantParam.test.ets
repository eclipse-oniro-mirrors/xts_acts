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

const TEST_SUITE_NAME: string = 'StartAbilityWantParamTest'
const EVENT_WantParametersJs_0100 = 'SUB_Ability_AbilityBase_WantParam_WantParametersJs_0100'
const EVENT_WantParametersJs_0200 = 'SUB_Ability_AbilityBase_WantParam_WantParametersJs_0200'
const EVENT_WantParametersJs_0300 = 'SUB_Ability_AbilityBase_WantParam_WantParametersJs_0300'
const EVENT_WantParametersJs_0400 = 'SUB_Ability_AbilityBase_WantParam_WantParametersJs_0400'
const EVENT_WantParametersJs_0500 = 'SUB_Ability_AbilityBase_WantParam_WantParametersJs_0500'
const EVENT_WantParametersJs_0600 = 'SUB_Ability_AbilityBase_WantParam_WantParametersJs_0600'
const EVENT_WantParametersJs_1600 = 'SUB_Ability_AbilityBase_WantParam_WantParametersJs_1600'
let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()

export default function startAbilityWantParamTest() {

  async function sleep(time) {
    return new Promise((resolve) => setTimeout(resolve, time))
  }

  function getParameterFd(fd) {
    let param = {
      'keyFd': {
        'type': 'FD', 'value': fd
      }
    };
    return param;
  }

   function startAbilityTest(ability, parameters) {
    let wantInfo = {
      "bundleName": "com.ohos.startabilitywantparamtest",
      "abilityName": ability,
      "parameters": parameters
    }
    return abilityDelegator.startAbility(wantInfo);
  }

  function fail(done) {
    expect().assertFail();
    done();
  }

  class CurrentRemoteObject extends rpc.RemoteObject {
  }

  describe('ActsStartAbilityWantParamTest', function () {

    beforeEach(function (done) {
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
    it("SUB_Ability_AbilityBase_WantParam_WantParametersJs_0800", 3, async function (done) {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityBase_WantParam_WantParametersJs_0800';
      try {
        await startAbilityTest('WantAbility', getParameterFd(-1)).then(() => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} start successful`);
          fail(done);
        }).catch((error) => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} error :${JSON.stringify(error)}}`);
          expect(error.code).assertEqual(2097167);
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
     *                 expecting start ability failure and the error code is 2097167. Actually,
     *                 the ability can be started successful.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_Ability_AbilityBase_WantParam_WantParametersJs_0700", 3, async done => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityBase_WantParam_WantParametersJs_0700';
      try {
        await startAbilityTest('WantAbility', getParameterFd(0)).then(() => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} start successful`);
          done();
        }).catch((error) => {
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
    it("SUB_Ability_AbilityBase_WantParam_WantParametersJs_0100", 1, async function (done) {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityBase_WantParam_WantParametersJs_0100';
      try {
        let remoteObj = new CurrentRemoteObject('WantParam_WantParametersJs_0100')
        let parameter = {
          "keyRemoteObj": {
            "type": "RemoteObject", "value": remoteObj
          }
        }
        let commonEventSubscribeInfo = {
          events: [EVENT_WantParametersJs_0100]
        }
        await commonEvent.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          commonEvent.subscribe(subscriber, (err, commonEventData) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe sunccess : ${JSON.stringify(commonEventData)},
                          parameter : ${JSON.stringify(parameter)}`);
            let source = commonEventData.parameters.keyRemoteObj;
            let origin = parameter.keyRemoteObj;
            expect(JSON.stringify(source)).assertEqual(JSON.stringify(origin))
            commonEvent.unsubscribe(subscriber, (err, data) => {
              done();
            });
          })
        })
        await startAbilityTest("WantFirstAbility", parameter).then(() => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability success`);
        }, (err) => {
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
     *                 expecting start ability failure and the error code is 2097167. Actually, the ability
     *                 can be started successfully
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_Ability_AbilityBase_WantParam_WantParametersJs_1000", 3, async function (done) {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityBase_WantParam_WantParametersJs_1000';
      try {
        let remoteObj: CurrentRemoteObject = undefined;
        let keyRemoteObj = {
          'type': 'RemoteObject',
          'value': remoteObj
        }
        await startAbilityTest('WantAbility', keyRemoteObj).then(() => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability success`);
          done();
        }, error => {
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
    it("SUB_Ability_AbilityBase_WantParam_WantParametersJs_0500", 3, async function (done) {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityBase_WantParam_WantParametersJs_0500';
      try {
        let parameter = {
          keyArrayObj: {
            "data": [1, 2, 3]
          }
        }
        let commonEventSubscribeInfo = {
          events: [EVENT_WantParametersJs_0500]
        }
        await commonEvent.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          commonEvent.subscribe(subscriber, (err, commonEventData) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe sunccess : ${JSON.stringify(commonEventData)},
                          parameter : ${JSON.stringify(parameter)}`);
            let source = commonEventData.parameters.keyArrayObj;
            let origin = parameter.keyArrayObj;
            expect(JSON.stringify(source)).assertEqual(JSON.stringify(origin));
            commonEvent.unsubscribe(subscriber, () => {
              done();
            });
          })
        })
        await startAbilityTest('WantFifthAbility', parameter).then(() => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability success`);
        }, error => {
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
    it("SUB_Ability_AbilityBase_WantParam_WantParametersJs_0300", 3, async function (done) {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityBase_WantParam_WantParametersJs_0300';
      try {
        let parameter = {
          "keyObj": {
            "name": "zhangsan", "sex": 1
          }
        }
        let commonEventSubscribeInfo = {
          events: [EVENT_WantParametersJs_0300]
        }
        await commonEvent.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          commonEvent.subscribe(subscriber, (err, commonEventData) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe sunccess : ${JSON.stringify(commonEventData)},
                          parameter : ${JSON.stringify(parameter)}`);
            let source = commonEventData.parameters.keyObj;
            let origin = parameter.keyObj;
            expect(JSON.stringify(source)).assertEqual(JSON.stringify(origin))
            commonEvent.unsubscribe(subscriber, (err, data) => {
              done();
            });
          })
        })
        await startAbilityTest('WantThirdAbility', parameter).then(() => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability success`);
        }, error => {
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
    it("SUB_Ability_AbilityBase_WantParam_WantParametersJs_0400", 3, async function (done) {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityBase_WantParam_WantParametersJs_0400';
      try {
        let parameter = {
          "keyFlexObj": {
            "data": {
              "info": "abcd", "len": 4
            }
          }
        }
        let commonEventSubscribeInfo = {
          events: [EVENT_WantParametersJs_0400]
        }
        await commonEvent.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          commonEvent.subscribe(subscriber, (err, commonEventData) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe sunccess : ${JSON.stringify(commonEventData)},
                           parameter : ${JSON.stringify(parameter)}`);
            let source = commonEventData.parameters.keyFlexObj;
            let origin = parameter.keyFlexObj;
            expect(JSON.stringify(source)).assertEqual(JSON.stringify(origin))
            commonEvent.unsubscribe(subscriber, (err, data) => {
              done();
            });
          })
        })
        await startAbilityTest('WantFourthAbility', parameter).then(() => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability success`);
        }, error => {
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
    it("SUB_Ability_AbilityBase_WantParam_WantParametersJs_1600", 3, async function (done) {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityBase_WantParam_WantParametersJs_1600';
      try {
        let remoteObject = new CurrentRemoteObject('WantParam_WantParametersJs_1600')
        let parameter = {
          multi: {
            "keyRemoteObj": {
              "type": "RemoteObject", "value": remoteObject
            },
            "keyFd": {
              "type": "FD", "value": 1
            },
            "keyFlexObj": {
              "data": {
                "info": "abcd", "len": 4
              }
            },
            "key1": [{
              "data1": "value1", "data2": "value2"
            }, {
              "data3": "value3", "data4": "value4"
            }],
            "keyObj": {
              "name": "zhangsan", "sex": 1
            },
            "keyArrayObj": {
              "data": [1, 2, 3]
            }
          }
        }
        let commonEventSubscribeInfo = {
          events: [EVENT_WantParametersJs_1600]
        }
        await commonEvent.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          commonEvent.subscribe(subscriber, (err, commonEventData) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe sunccess : ${JSON.stringify(commonEventData.parameters)},
                           parameter : ${JSON.stringify(parameter)}`);
            let source = commonEventData.parameters.multi;
            let origin = parameter.multi;
            expect(JSON.stringify(origin.keyRemoteObj)).assertEqual(JSON.stringify(source.keyRemoteObj))
            expect(JSON.stringify(origin.keyFlexObj)).assertEqual(JSON.stringify(source.keyFlexObj))
            expect(JSON.stringify(origin.key1)).assertEqual(JSON.stringify(source.key1))
            expect(JSON.stringify(origin.keyObj)).assertEqual(JSON.stringify(source.keyObj))
            expect(JSON.stringify(origin.keyArrayObj)).assertEqual(JSON.stringify(source.keyArrayObj))
            commonEvent.unsubscribe(subscriber, (err, data) => {
              done();
            });
          })
        })
        await startAbilityTest('WantSixteenAbility', parameter).then(() => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability success`);
        }, error => {
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
    it("SUB_Ability_AbilityBase_WantParam_WantParametersJs_0600", 3, async function (done) {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityBase_WantParam_WantParametersJs_0600';
      try {
        let parameter = {
          "key1":
          [
            {
              "data1": "value1", "data2": "value2"
            },
            {
              "data3": "value3", "data4": "value4"
            }
          ]
        }
        let commonEventSubscribeInfo = {
          events: [EVENT_WantParametersJs_0600]
        }
        await commonEvent.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          commonEvent.subscribe(subscriber, (err, commonEventData) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe sunccess : ${JSON.stringify(commonEventData)},
                          parameter : ${JSON.stringify(parameter)}`);
            let source = commonEventData.parameters.key1;
            let origin = parameter.key1;
            expect(JSON.stringify(source)).assertEqual(JSON.stringify(origin))
            commonEvent.unsubscribe(subscriber, (err, data) => {
              done();
            });
          })
        })
        await startAbilityTest('WantSixthAbility', parameter).then(() => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability success`);
        }, error => {
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
    it("SUB_Ability_AbilityBase_WantParam_WantParametersJs_0200", 3, async function (done) {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityBase_WantParam_WantParametersJs_0200';
      let fd : number;
      try {
        let filePath = abilityDelegator.getAppContext().filesDir + '/xts.png'
        let file = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        fd = file.fd;
        let parameter = {
          "keyFd": {
            "type": "FD",
            "value": fd
          }
        }
        let commonEventSubscribeInfo = {
          events: [EVENT_WantParametersJs_0200]
        }
        await commonEvent.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          commonEvent.subscribe(subscriber, (err, commonEventData) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe sunccess : ${JSON.stringify(commonEventData.parameters.keyFd)},
                           parameter : ${JSON.stringify(parameter)}`);
            let source = commonEventData.parameters.keyFd;
            let origin = parameter.keyFd;
            expect(source.type).assertEqual(origin.type);
            commonEvent.unsubscribe(subscriber, (err, data) => {
              done();
            });
          })
        })

        await startAbilityTest('WantSecondAbility', parameter).then(() => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability success`);
        }, error => {
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
    it("SUB_Ability_AbilityBase_WantParam_WantParametersJs_0900", 3, async done => {
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
        }, (error) => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} error :${JSON.stringify(error)}}`);
          expect(error.code).assertEqual(2097167);
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

