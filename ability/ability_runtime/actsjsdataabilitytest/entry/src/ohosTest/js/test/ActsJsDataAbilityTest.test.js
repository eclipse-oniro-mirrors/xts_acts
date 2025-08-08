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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import featureAbility from '@ohos.ability.featureAbility';

const TAG = 'JSDATAABILITY';
const TEST_SUITE_NAME = 'JSDATAABILITYTest';

export default function ActsJsDataAbilityTest() {
  describe('ActsJsDataAbilityTest', function () {
    /**
     * @tc.number : SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_22500
     * @tc.name   : Call the call interface, set the method to delete and the arg query condition to "equalTo",
     *         and verify the return value
     * @tc.desc   : Call the call interface, with the correct uri,method set to delete,
     *         and arg query condition set to 'equalTo': 'group'_ Name ',
     *         extras defined as pacMap={'groupname':'test1 '}
     *         Check if the return value of calling the call interface is correct
     * @tc.level  : Level 3
     * @tc.size   : MediumTest
     * @tc.type   : Function
     */
    it("SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_22500", 3, async function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_22500';
      try {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
        const URI_TEST = 'dataability:///com.example.myapplication.DataAbility';
        let dataAbilityHelper = featureAbility.acquireDataAbilityHelper(URI_TEST);
        expect(typeof (dataAbilityHelper)).assertEqual("object");
        let pacMap = {
        'group_name': 'test1'
        };
        dataAbilityHelper.call(URI_TEST, 'delete', 'equalTo', pacMap).then((data) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} call successful` + JSON.stringify(data));
        /*
         *    Expected data : data['result'] = 0
         *    Actual return:  data['result'] = undefined
         * */
        var result = data['result'];
        expect(result).assertEqual(undefined);
        done();
        }).catch((error) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} call failed` + JSON.stringify(error));
        expect().assertFail();
        done();
        });
      } catch (err) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${err}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number : SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_22600
     * @tc.name   : Call the call interface, set the method to delete and the arg query condition to "like",
     *         and verify the return value
     * @tc.desc   : Call the call interface, with the correct uri,method set to delete,
     *         and arg query condition set to 'equalTo': 'group'_ Name ',
     *         extras defined as pacMap={'group_name':'%test3%'}
     *         Check if the return value of calling the call interface is correct
     * @tc.level  : Level 3
     * @tc.size   : MediumTest
     * @tc.type   : Function
     */
    it("SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_22600", 3, async function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_22600';
      try {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
        const URI_TEST = 'dataability:///com.example.myapplication.DataAbility';
        let dataAbilityHelper = featureAbility.acquireDataAbilityHelper(URI_TEST);
        expect(typeof (dataAbilityHelper)).assertEqual("object");
        let pacMap = {
        'group_name': '%test3%'
        };
        dataAbilityHelper.call(URI_TEST, 'delete', 'like', pacMap).then((data) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} call successful` + JSON.stringify(data));
        /*
         *    Expected data : data['result'] = 0
         *    Actual return:  data['result'] = undefined
         * */
        var result = data['result'];
        expect(result).assertEqual(undefined);
        done();
        }).catch((error) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} call failed` + JSON.stringify(error));
        expect().assertFail();
        done();
        });
      } catch (err) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${err}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number : SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_22700
     * @tc.name   : Call the call interface, set the method to delete
     *         and the arg query condition to "greaterThanOrEqualTo",
     *         and verify the return value
     * @tc.desc   : Call the call interface, with the correct uri,method set to delete,
     *         and arg query condition set to 'equalTo': 'group'_ Name ',
     *         extras defined as pacMap={'ringtone_modify_time':'40'}
     *         Check if the return value of calling the call interface is correct
     * @tc.level  : Level 3
     * @tc.size   : MediumTest
     * @tc.type   : Function
     */
    it("SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_22700", 3, async function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_22700';
      try {
        hilog.info(0x0000, TAG, '=======>%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
        const URI_TEST = 'dataability:///com.example.myapplication.DataAbility';
        let dataAbilityHelper = featureAbility.acquireDataAbilityHelper(URI_TEST);
        expect(typeof (dataAbilityHelper)).assertEqual("object");
        let pacMap = {
        'ringtone_modify_time': '40'
        };
        dataAbilityHelper.call(URI_TEST, 'delete', 'greaterThanOrEqualTo', pacMap).then((data) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} call successful` + JSON.stringify(data));
        /*
         *    Expected data : data['result'] = 0
         *    Actual return:  data['result'] = undefined
         * */
        var result = data['result'];
        expect(result).assertEqual(undefined);
        done();
        }).catch((error) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} call failed` + JSON.stringify(error));
        expect().assertFail();
        done();
        });
      } catch (err) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${err}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number : SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_22800
     * @tc.name   : Call the call interface, set the method to delete,
     *         and the arg query condition to "lessThan",and verify the return value,
     * @tc.desc   : Call the call interface, with the correct uri,method set to delete,
     *         and arg query condition set to 'equalTo': 'group'_ Name ',
     *         extras defined as pacMap={'ringtone_modify_time':'32'}
     *         Check if the return value of calling the call interface is correct
     * @tc.level  : Level 3
     * @tc.size   : MediumTest
     * @tc.type   : Function
     */
    it("SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_22800", 3, async function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_22800';
      try {

        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
        const URI_TEST = 'dataability:///com.example.myapplication.DataAbility';
        let dataAbilityHelper = featureAbility.acquireDataAbilityHelper(URI_TEST);
        expect(typeof (dataAbilityHelper)).assertEqual("object");
        let pacMap = {
        'ringtone_modify_time': '32'
        };
        dataAbilityHelper.call(URI_TEST, 'delete', 'lessThan', pacMap).then((data) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} call successful` + JSON.stringify(data));
        /*
         *    Expected data : data['result'] = 0
         *    Actual return:  data['result'] = undefined
         * */
        var result = data['result'];
        expect(result).assertEqual(undefined);
        done();
        }).catch((error) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} call failed` + JSON.stringify(error));
        expect().assertFail();
        done();
        });
      } catch (err) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${err}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number : SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_22900
     * @tc.name   : Call the call interface, set the method to delete,
     *         and Input parameter error uri,and verify the return value,
     * @tc.desc   : Call the call interface, Input parameter error uri,method set to delete,
     *         and arg query condition set to 'equalTo': 'group'_ Name ',
     *         extras defined as pacMap={'ringtone_modify_time':'40'}
     *         Check if the return value of calling the call interface is correct
     * @tc.level  : Level 3
     * @tc.size   : MediumTest
     * @tc.type   : Function
     */
    it("SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_22900", 3, async function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_22900';
      try {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
        const URI_TEST = 'dataability:///com.example.myapplication.DataAbility1231313';
        let dataAbilityHelper = featureAbility.acquireDataAbilityHelper(URI_TEST);
        expect(typeof (dataAbilityHelper)).assertEqual("object");
        let pacMap = {
        'ringtone_modify_time': '40'
        };
        dataAbilityHelper.call(URI_TEST, 'delete', '', pacMap).then((data) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} call successful` + JSON.stringify(data));
        expect().assertFail();
        done();
        }).catch((error) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} call failed` + JSON.stringify(error));
        expect().assertFail();
        done();
        });
      } catch (err) {
        /*
         *  Expected err code: -1
         * Actual return: err.message = 'Cannot read property call of null
         */
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${err}`);
        expect(err.message).assertEqual('Cannot read property call of null');
        done();
      }
    });
    /**
     * @tc.number : SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_23000
     * @tc.name   : Call the call interface, set the method to delete,
     *         and the Uri with empty input parameters,and verify the return value,
     * @tc.desc   : Call the call interface, input a null uri,method as delete,
     *         and arg query condition set to 'equalTo': 'group'_ Name ',
     *         arg query condition as empty,and define pacMap as extras{'ringtone_modify_time':'40'}
     *         Check if the return value of calling the call interface is correct
     * @tc.level  : Level 3
     * @tc.size   : MediumTest
     * @tc.type   : Function
     */
    it("SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_23000", 3, async function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_23000';
      try {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
        const URI_TEST = '';
        let dataAbilityHelper = featureAbility.acquireDataAbilityHelper(URI_TEST);
        expect(typeof (dataAbilityHelper)).assertEqual("object");
        let pacMap = {
        'ringtone_modify_time': '40'
        };
        dataAbilityHelper.call(URI_TEST, 'delete', '', pacMap).then((data) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} call successful` + JSON.stringify(data));
        expect().assertFail();
        done();
        }).catch((error) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} call failed` + JSON.stringify(error));
        expect().assertFail();
        done();
        });
      } catch (err) {
        /*
         *  Expected err code: -1
         * Actual return: err.message = 'Cannot read property call of null
         */
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${err}`);
        expect(err.message).assertEqual('Cannot read property call of null');
        done();
      }
    });
    /**
     * @tc.number : SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_23100
     * @tc.name   : Verify the callback method call of the call interface
     * @tc.desc   : Call the call interface, with the correct uri, method as insert, arg as empty,
     *         and extras defined as pacMap={ "group_name":"test1","ringtone_modify_time": 28 }
     *         Check if the return value of calling the call interface is correct
     * @tc.level  : Level 3
     * @tc.size   : MediumTest
     * @tc.type   : Function
     */
    it("SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_23100", 3, async function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_23100';
      try {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
        const URI_TEST = 'dataability:///com.example.myapplication.DataAbility';
        let DAHelper = featureAbility.acquireDataAbilityHelper(URI_TEST);
        let dataAbilityHelper = featureAbility.acquireDataAbilityHelper(URI_TEST);
        expect(typeof (dataAbilityHelper)).assertEqual("object");
        let pacMap = {
        'group_name': 'test1',
        'ringtone_modify_time': 28
        };
        await DAHelper.call(URI_TEST, 'insert', '', pacMap).then((data) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} DAHelper1 insert result:` + JSON.stringify(data));
        /*
        *    Expected data : data['result'] =1
        *    Actual return:  data['result'] = undefined
        * */
        var result = data['result'];
        expect(result).assertEqual(undefined);
        done();
        }).catch((error) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} DAHelper2 insert result: ` + JSON.stringify(error));
        expect().assertFail();
        done();
        });
      } catch (err) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} "DAHelper2 insert result: : ${err}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number : SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_23200
     * @tc.name   : Verify the Promise method call of the call interface
     * @tc.desc   : Call the call interface using the Promise method,
     *         with correct input parameters such as uri, method as insert, arg as empty,
     *         and extras defined as pacMa ={"group_name": "test2","ringtone_modify_time": 28}
     *         Check if the return value of calling the call interface is correct
     * @tc.level  : Level 3
     * @tc.size   : MediumTest
     * @tc.type   : Function
     */
    it("SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_23200", 3, async function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_23200';
      try {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
        const URI_TEST = 'dataability:///com.example.myapplication.DataAbility';
        let DAHelper = featureAbility.acquireDataAbilityHelper(URI_TEST);
        let dataAbilityHelper = featureAbility.acquireDataAbilityHelper(URI_TEST);
        expect(typeof (dataAbilityHelper)).assertEqual("object");
        let pacMap = {
        'group_name': 'test2',
        'ringtone_modify_time': 28
        };
        await DAHelper.call(URI_TEST, 'insert', '', pacMap).then((data) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} DAHelper1 insert result:` + JSON.stringify(data));
        /*
          *    Expected data : data['result'] = 2
          *    Actual return:  data['result'] = undefined
          * */
        var result = data['result'];
        expect(result).assertEqual(undefined);
        done();
        }).catch((error) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} DAHelper2 insert result: ` + JSON.stringify(error));
        expect().assertFail();
        done();
        });
      } catch (err) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} "DAHelper2 insert result: : ${err}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number : SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_23300
     * @tc.name   : Calling the call interface, inputting incorrect uri parameters,
     *         and verifying the return value
     * @tc.desc   : Call the call interface using the callback method,
     *         with incorrect input parameters uri, method as insert, arg as empty,
     *         and extras defined as pacMa={"group_name": "test1","ringtone_modify_time": 28}
     *         Check if the return value of calling the call interface is correct
     * @tc.level  : Level 3
     * @tc.size   : MediumTest
     * @tc.type   : Function
     */
    it("SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_23300", 3, async function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_23300';
      try {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
        const URI_TEST = 'dataability:///com.example.myapplication.DataAbility1231313';
        let DAHelper = featureAbility.acquireDataAbilityHelper(URI_TEST);
        let dataAbilityHelper = featureAbility.acquireDataAbilityHelper(URI_TEST);
        expect(typeof (dataAbilityHelper)).assertEqual("object");
        let pacMap = {
        'group_name': 'test1',
        'ringtone_modify_time': 28
        };
        await DAHelper.call(URI_TEST, 'insert', '', pacMap).then((data) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} DAHelper1 insert result:` + JSON.stringify(data));
        expect().assertFail();
        done();
        }).catch((error) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} DAHelper2 insert result: ` + JSON.stringify(error));
        expect().assertFail();
        done();
        });
      } catch (err) {
        /*
        *    Expected data : err='Return error code'
        *    Actual return: err.message = 'Cannot read property call of null'
        * */
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} "DAHelper2 insert result: : ${err}`);
        expect(err.message).assertEqual('Cannot read property call of null');
        done();
      }
    });
    /**
     * @tc.number : SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_23400
     * @tc.name   : Calling the call interface, input a uri with empty parameters,
     *         and verifying the return value
     * @tc.desc   :  Calling the call interface with null uri, method as insert, and arg as empty parameters,
     *         extras defined as pacMap={"group_name": "test1","ringtone_modify_time": 28}
     *         Check if the return value of calling the call interface is correct
     * @tc.level  : Level 3
     * @tc.size   : MediumTest
     * @tc.type   : Function
     */
    it("SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_23400", 3, async function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_23400';
      try {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
        const URI_TEST = '';
        let DAHelper = featureAbility.acquireDataAbilityHelper(URI_TEST);
        let dataAbilityHelper = featureAbility.acquireDataAbilityHelper(URI_TEST);
        expect(typeof (dataAbilityHelper)).assertEqual("object");
        let pacMap = {
        'group_name': 'test6',
        'ringtone_modify_time': 28
        };
        await DAHelper.call(URI_TEST, 'insert', '', pacMap).then((data) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} DAHelper1 insert result:` + JSON.stringify(data));
        expect().assertFail();
        done();
        }).catch((error) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} DAHelper2 insert result: ` + JSON.stringify(error));
        expect().assertFail();
        done();
        });
      } catch (err) {
        /*
        *    Expected data : err='Return error code'
        *    Actual return: err.message = 'Cannot read property call of null'
        * */
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} "DAHelper2 insert result: : ${err}`);
        expect(err.message).assertEqual('Cannot read property call of null');
        done();
      }
    });
    /**
     * @tc.number : SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_23500
     * @tc.name   : Calling the call interface,input a methold with empty parameters, and verify the return value
     *         and verify the return value
     * @tc.desc   : Calling the call interface with null methold, method as insert, and arg as empty parameters,
     *         and arg as empty parameters,extras
     *         defined as pacMap={"group_name": "test1","ringtone_modify_time": 28}
     *         Check if the return value of calling the call interface is correct
     * @tc.level  : Level 3
     * @tc.size   : MediumTest
     * @tc.type   : Function
     */
    it("SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_23500", 0, async function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_23500';
      try {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
        const URI_TEST = 'dataability:///com.example.myapplication.DataAbility';
        let DAHelper = featureAbility.acquireDataAbilityHelper(URI_TEST);
        let dataAbilityHelper = featureAbility.acquireDataAbilityHelper(URI_TEST);
        expect(typeof (dataAbilityHelper)).assertEqual("object");
        let pacMap = {
        'group_name': 'test6',
        'ringtone_modify_time': 28
        };
        await DAHelper.call(URI_TEST, 'test', '', pacMap).then((data) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} DAHelper1 insert result:` + JSON.stringify(data));
        /*
        *    Expected data : data['result'] = 'Return error code'
        *    Actual return:  data['result'] = undefined
        * */
        var result = data['result'];
        expect(result).assertEqual(undefined);
        done();
        }).catch((error) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} DAHelper2 insert result: ` + JSON.stringify(error));
        expect().assertFail();
        done();
        });
      } catch (err) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} "DAHelper2 insert result: : ${err}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number : SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_23600
     * @tc.name   : Calling the call interface,inputting incorrect extras parameters,
     *         and verify the return value
     * @tc.desc   : Call the call interface, winputting incorrect extras parameters,
     *         method set to insert,and arg with empty,extras defined as pacMap={'groupname':'test1 '}
     *         Check if the return value of calling the call interface is correct
     * @tc.level  : Level 3
     * @tc.size   : MediumTest
     * @tc.type   : Function
     */
    it("SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_23600", 3, async function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_23600';
      try {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
        const URI_TEST = 'dataability:///com.example.myapplication.DataAbility';
        let DAHelper = featureAbility.acquireDataAbilityHelper(URI_TEST);
        let dataAbilityHelper = featureAbility.acquireDataAbilityHelper(URI_TEST);
        expect(typeof (dataAbilityHelper)).assertEqual("object");
        let pacMap = {
        'group_name': 'test6',
        'ringtone_modify_time': "abcd"
        };
        await DAHelper.call(URI_TEST, 'insert', '', pacMap).then((data) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} DAHelper1 insert result:` + JSON.stringify(data));
        /*
          *    Expected data : data['result'] = 'Return error code'
          *    Actual return:  data['result'] = undefined
          * */
        var result = data['result'];
        expect(result).assertEqual(undefined);
        done();
        }).catch((error) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} DAHelper2 insert result: ` + JSON.stringify(error));
        expect().assertFail();
        done();
        });
      } catch (err) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} "DAHelper2 insert result: : ${err}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number : SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_23700
     * @tc.name   : Calling the call interface,set the method to delete and the arg query condition to "equalTo",
     *         and verify the return value
     * @tc.desc   : Call the call interface, with the correct uri,method set to delete,
     *         and arg query condition set to 'equalTo': 'group'_ Name ',
     *         extras defined as pacMap={'groupname':'test1 ',"columns": "group_name,ringtone_modify_time"}
     *         Check if the return value of calling the call interface is correct
     * @tc.level  : Level 3
     * @tc.size   : MediumTest
     * @tc.type   : Function
     */
    it('SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_23700', 3, function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_23700';
      try {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
        const URI_TEST = 'dataability:///com.example.myapplication.DataAbility';
        let dataAbilityHelper = featureAbility.acquireDataAbilityHelper(URI_TEST);
        let pacMap = {
        "group_name": "test1",
        'columns': 'group_name,ringtone_modify_time'
        };
        dataAbilityHelper.call(URI_TEST, 'query', 'equalTo:group_name', pacMap).then((data) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data:` + JSON.stringify(data));
        /*
          *    Expected data : data['result'] = 0
          *    Actual return:  data['result'] = undefined
          * */
        var result = data['result'];
        expect(result).assertEqual(undefined);
        done();
        }).catch((error) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} error:` + JSON.stringify(error));
        expect().assertFail();
        done();
        })
      } catch (err) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail:` + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number : SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_23800
     * @tc.name   : Calling the call interface,set the method to query
     *         and the arg query condition to "between",and verify the return value
     * @tc.desc   : Call the call interface, with the correct uri,set the method to query,
     *         set the arg query condition to "between": "ringtone modify_time",
     *         define pacMap as extras={'ringtone_modify_time': [15, 30],
     *         "columns": "group_name,ringtone_modify_time"}
     *         Check if the return value of calling the call interface is correct
     * @tc.level  : Level 3
     * @tc.size   : MediumTest
     * @tc.type   : Function
     */
    it('SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_23800', 3, function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_23800';
      try {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
        const URI_TEST = 'dataability:///com.example.myapplication.DataAbility';
        let dataAbilityHelper = featureAbility.acquireDataAbilityHelper(URI_TEST);
        let pacMap = {
        'ringtone_modify_time': [15, 30],
        'columns': 'group_name,ringtone_modify_time'
        };
        dataAbilityHelper.call(URI_TEST, 'query', 'between:ringtone_modify_time', pacMap).then((data) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data:` + JSON.stringify(data));
        /*
          *    Expected data : data['result'] = 0
          *    Actual return:  data['result'] = undefined
          * */
        var result = data['result'];
        expect(result).assertEqual(undefined);
        done();
        }).catch((error) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} error:` + JSON.stringify(error));
        expect().assertFail();
        done();
        })
      } catch (err) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail:` + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number : SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_23900
     * @tc.name   : Calling the call interface,set the method to query and the arg query condition to "like",
     *         and verify the return value
     * @tc.desc   : Call the call interface, with the correct uri,set the method to query,
     *         and arg query condition set to 'like': 'group'_ Name ',
     *         extras defined as pacMap={'groupname':'test1 ''group_name': '%test3%',
     *         'columns': 'group_name,ringtone_modify_time'}
     *         Check if the return value of calling the call interface is correct
     * @tc.level  : Level 3
     * @tc.size   : MediumTest
     * @tc.type   : Function
     */
    it('SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_23900', 3, function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_23900';
      try {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
        const URI_TEST = 'dataability:///com.example.myapplication.DataAbility';
        let dataAbilityHelper = featureAbility.acquireDataAbilityHelper(URI_TEST);
        let pacMap = {
        'group_name': '%test3%',
        'columns': 'group_name,ringtone_modify_time'
        };
        dataAbilityHelper.call(URI_TEST, 'query', 'like:group_name', pacMap).then((data) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data:` + JSON.stringify(data));
        /*
          *    Expected data : data['result'] = 0
          *    Actual return:  data['result'] = undefined
          * */
        var result = data['result'];
        expect(result).assertEqual(undefined);
        done();
        }).catch((error) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} error:` + JSON.stringify(error));
        expect().assertFail();
        done();
        })
      } catch (err) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail:` + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number : SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_24000
     * @tc.name   : Calling the call interface,set the method to query and the arg query condition to "equalTo",
     *         and verify the return value
     * @tc.desc   : Call the call interface, with the correct uri,set the method to query,
     *         set the arg query condition to "between": "ringtone modify_time",
     *         define pacMap as extras={"group_name": "test1",
     *         'columns': 'group_name,ringtone_modify_time'}
     *         Check if the return value of calling the call interface is correct
     * @tc.level  : Level 3
     * @tc.size   : MediumTest
     * @tc.type   : Function
     */
    it('SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_24000', 3, function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_24000';
      try {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
        const URI_TEST = 'dataability:///com.example.myapplication.DataAbility';
        let dataAbilityHelper = featureAbility.acquireDataAbilityHelper(URI_TEST);
        let pacMap = {
        'ringtone_modify_time': 40,
        'columns': 'group_name,ringtone_modify_time'
        };
        dataAbilityHelper.call(URI_TEST, 'query', 'greaterThanOrEqualTo:ringtone_modify_time', pacMap).then((data) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data:` + JSON.stringify(data));
        /*
          *    Expected data : data['result'] = 0
          *    Actual return:  data['result'] = undefined
          * */
        var result = data['result'];
        expect(result).assertEqual(undefined);
        done();
        }).catch((error) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} error:` + JSON.stringify(error));
        expect().assertFail();
        done();
        })
      } catch (err) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail:` + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number : SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_24100
     * @tc.name   : Calling the call interface,set the method to query and Input parameter error uri,
     *         and verify the return value
     * @tc.desc   : Call the call interface,with input parameter error uri,
     *         method set to query, arg query condition set to empty,
     *         extras defined as pacMap={'groupname':'test1 '}
     *         Check if the return value of calling the call interface is correct
     * @tc.level  : Level 3
     * @tc.size   : MediumTest
     * @tc.type   : Function
     */
    it('SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_24100', 3, function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_24100';
      try {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
        const URI_TEST = 'dataability:///com.example.myapplication.DataAbility1231313';
        let dataAbilityHelper = featureAbility.acquireDataAbilityHelper(URI_TEST);
        let pacMap = {
        'ringtone_modify_time': 20,
        'columns': 'group_name,ringtone_modify_time'
        };
        dataAbilityHelper.call(URI_TEST, 'query', '', pacMap).then((data) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data:` + JSON.stringify(data));
        expect().assertFail();
        done();
        }).catch((error) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} error:` + JSON.stringify(error));
        expect().assertFail();
        done();
        })
      } catch (err) {
        /*
        *    Expected err code: -1
        *    Actual return: err.message = 'Cannot read property call of null'
        * */
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail:` + JSON.stringify(err));
        expect(err.message).assertEqual('Cannot read property call of null');
        done();
      }
    });
    /**
     * @tc.number : SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_24200
     * @tc.name   : Calling the call interface,set the method to query and uri with empty input parameters,
     *         and verify the return value
     * @tc.desc   : Call the call interface, Uri with empty input parameters, method as query,
     *         arg query condition set as empty,
     *         extras defined as pacMap={'ringtone_modify_time': 20,
     *         'columns': 'group_name,ringtone_modify_time'}
     *         Check if the return value of calling the call interface is correct
     * @tc.level  : Level 3
     * @tc.size   : MediumTest
     * @tc.type   : Function
     */
    it('SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_24200', 3, function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_24200';
      try {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
        const URI_TEST = '';
        let dataAbilityHelper = featureAbility.acquireDataAbilityHelper(URI_TEST);
        let pacMap = {
        'ringtone_modify_time': 20,
        'columns': 'group_name,ringtone_modify_time'
        };
        dataAbilityHelper.call(URI_TEST, 'query', '', pacMap).then((data) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data:` + JSON.stringify(data));
        expect().assertFail();
        done();
        }).catch((error) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} error:` + JSON.stringify(error));
        expect().assertFail();
        done();
        })
      } catch (err) {
        /*
        *    Expected err code: -1
        *    Actual return: err.message = 'Cannot read property call of null'
        * */
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail:` + JSON.stringify(err));
        expect(err.message).assertEqual('Cannot read property call of null');
        done();
      }
    });
    /**
     * @tc.number : SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_24300
     * @tc.name   : Calling the call interface,set the method to update
     *         and the arg query condition to "between",and verify the return value
     * @tc.desc   : Call the call interface,with the correct uri,
     *         arg query condition set as empty,method set to update,
     *         and arg query condition set to 'between': "ringtone_modify_time",
     *         extras defined as pacMap={'ringtone_modify_time': [15, 30],'group_name': 'testupdata'}
     *         Check if the return value of calling the call interface is correct
     * @tc.level  : Level 3
     * @tc.size   : MediumTest
     * @tc.type   : Function
     */
    it("SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_24300", 3, async function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_24300';
      try {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
        const URI_TEST = 'dataability:///com.example.myapplication.DataAbility';
        let DAHelper = featureAbility.acquireDataAbilityHelper(URI_TEST);
        let dataAbilityHelper = featureAbility.acquireDataAbilityHelper(URI_TEST);
        expect(typeof (dataAbilityHelper)).assertEqual("object");
        let valuesBucket = {
        "ringtone_modify_time": [15, 30], "group_name": "testupdata"
        }

        DAHelper.call(URI_TEST, 'update', 'between', valuesBucket).then((data) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} update success:` + JSON.stringify(data));
        /*
          *    Expected data : data['result'] = 0
          *    Actual return:  data['result'] = undefined
          * */
        var result = data['result'];
        expect(result).assertEqual(undefined);
        done();
        }).catch((error) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME}update failed:` + JSON.stringify(error));
        expect().assertFail();
        done();
        })
      } catch (err) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail:` + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number : SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_24400
     * @tc.name   : Calling the call interface, set the method to update and the arg query condition to "equalTo",
     *         and the arg query condition to "equalTo",and verify the return value.
     * @tc.desc   : Call the call interface, with the correct uri,method set to update,
     *         and arg query condition set to 'equalTo': 'ringtone_modify_time',
     *         extras defined as pacMap={'ringtone_modify_time': 28,'group_name': 'testupdata1'}
     *         Check if the return value of calling the call interface is correct
     * @tc.level  : Level 3
     * @tc.size   : MediumTest
     * @tc.type   : Function
     */
    it("SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_24400", 3, async function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_24400';
      try {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
        const URI_TEST = 'dataability:///com.example.myapplication.DataAbility';
        let DAHelper = featureAbility.acquireDataAbilityHelper(URI_TEST);
        let dataAbilityHelper = featureAbility.acquireDataAbilityHelper(URI_TEST);
        expect(typeof (dataAbilityHelper)).assertEqual("object");
        let valuesBucket = {
        "ringtone_modify_time": 28, "group_name": "testupdata1"
        }

        DAHelper.call(URI_TEST, 'update', 'equalTo', valuesBucket).then((data) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} update success:` + JSON.stringify(data));
        /*
          *    Expected data : data['result'] = 0
          *    Actual return:  data['result'] = undefined
          * */
        var result = data['result'];
        expect(result).assertEqual(undefined);
        done();
        }).catch((error) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME}update failed:` + JSON.stringify(error));
        expect().assertFail();
        done();
        })
      } catch (err) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail:` + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number : SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_24500
     * @tc.name   : Calling the call interface,set the method to update
     *         and the arg query condition to "contains",and verify the return value.
     * @tc.desc   : Call the call interface, with the correct uri,method set to update,
     *         and arg query condition set to 'contains': 'group'_ Name ',
     *         extras defined as pacMap={'group_name': 'ata2','ringtone_modify_time': 100}
     *         Check if the return value of calling the call interface is correct
     * @tc.level  : Level 3
     * @tc.size   : MediumTest
     * @tc.type   : Function
     */
    it("SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_24500", 3, async function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_24500';
      try {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
        const URI_TEST = 'dataability:///com.example.myapplication.DataAbility';
        let DAHelper = featureAbility.acquireDataAbilityHelper(URI_TEST);
        expect(typeof (DAHelper)).assertEqual("object");
        let valuesBucket = {
        "ringtone_modify_time": 100, "group_name": "ata2"
        }

        DAHelper.call(URI_TEST, 'update', 'contains', valuesBucket).then((data) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} update success:` + JSON.stringify(data));
        /*
          *    Expected data : data['result'] = 0
          *    Actual return:  data['result'] = undefined
          * */
        var result = data['result'];
        expect(result).assertEqual(undefined);
        done();
        }).catch((error) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME}update failed:` + JSON.stringify(error));
        expect().assertFail();
        done();
        })
      } catch (err) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail:` + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number : SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_24600
     * @tc.name   : Calling the call interface,set the method to update
     *         and the arg query condition to "lessThan",and verify the return value.
     * @tc.desc   : Call the call interface, with the correct uri,method set to update,
     *         and arg query condition set to 'lessThan': 'ringtone_modify_time',
     *         extras defined as pacMap={'ringtone_modify_time': 32,'group_name': 'testupdata2'}
     *         Check if the return value of calling the call interface is correct
     * @tc.level  : Level 3
     * @tc.size   : MediumTest
     * @tc.type   : Function
     */
    it("SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_24600", 3, async function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_24600';
      try {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
        const URI_TEST = 'dataability:///com.example.myapplication.DataAbility';
        let DAHelper = featureAbility.acquireDataAbilityHelper(URI_TEST);
        expect(typeof (DAHelper)).assertEqual("object");
        let valuesBucket = {
        "ringtone_modify_time": 32, "group_name": "testupdata2"
        }

        DAHelper.call(URI_TEST, 'update', 'lessThan', valuesBucket).then((data) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} update success:` + JSON.stringify(data));
        /*
          *    Expected data : data['result'] = 0
          *    Actual return:  data['result'] = undefined
          * */
        var result = data['result'];
        expect(result).assertEqual(undefined);
        done();
        }).catch((error) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME}update failed:` + JSON.stringify(error));
        expect().assertFail();
        done();
        })
      } catch (err) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail:` + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number : SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_24700
     * @tc.name   : Calling the call interface with update method
     *         and incorrect uri for parameter input, verifying the return value
     * @tc.desc   : Call the call interface,Input parameter error uri,,method set to update,
     *         and arg query condition set to empty,
     *         extras defined as pacMap={'ringtone_modify_time': 32,'group_name': 'testupdata2'}
     *         Check if the return value of calling the call interface is correct
     * @tc.level  : Level 3
     * @tc.size   : MediumTest
     * @tc.type   : Function
     */
    it("SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_24700", 3, async function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_24700';
      try {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
        const URI_TEST = 'dataability:///com.example.myapplication.DataAbility1';
        let DAHelper = featureAbility.acquireDataAbilityHelper(URI_TEST);
        expect(typeof (DAHelper)).assertEqual("object");
        let valuesBucket = {
        "ringtone_modify_time": 32, "group_name": "testupdata"
        }

        DAHelper.call(URI_TEST, 'update', '', valuesBucket).then((data) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} update success:` + JSON.stringify(data));
        expect().assertFail();
        done();
        }).catch((error) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME}update failed:` + JSON.stringify(error));
        expect().assertFail();
        done();
        })
      } catch (err) {
        /*
        *    Expected err code: -1
        *    Actual return: err.message = 'Cannot read property call of null'
        * */
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail:` + JSON.stringify(err));
        expect(err.message).assertEqual('Cannot read property call of null');
        done();
      }
    });
    /**
     * @tc.number : SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_24800
     * @tc.name   : Call the call interface, set the method to update
     *         and enter a URI with empty parameters, and verify the return value
     * @tc.desc   : Call the call interface,Uri with empty input parameters,,method set to update,
     *         and arg query condition set to empty,
     *         extras defined as pacMap={'ringtone_modify_time': 32,'group_name': 'testupdata2'}
     *         Check if the return value of calling the call interface is correct
     * @tc.level  : Level 3
     * @tc.size   : MediumTest
     * @tc.type   : Function
     */
    it("SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_24800", 3, async function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_DataAbility_JSDATAABILITY_24800';
      try {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
        const URI_TEST = '';
        let DAHelper = featureAbility.acquireDataAbilityHelper(URI_TEST);
        expect(typeof (DAHelper)).assertEqual("object");
        let valuesBucket = {
        "ringtone_modify_time": 32, "group_name": "testupdata2"
        }

        DAHelper.call(URI_TEST, 'update', '', valuesBucket).then((data) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} update success:` + JSON.stringify(data));
        expect().assertFail();
        done();
        }).catch((error) => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME}update failed:` + JSON.stringify(error));
        expect().assertFail();
        done();
        })
      } catch (err) {
        /*
        *    Expected err code: -1
        *    Actual return: err.message = 'Cannot read property call of null'
        * */
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail:` + JSON.stringify(err));
        expect(err.message).assertEqual('Cannot read property call of null');
        done();
      }
    });
  })
}


