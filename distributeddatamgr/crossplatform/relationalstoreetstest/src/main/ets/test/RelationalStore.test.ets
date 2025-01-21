/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import relationalStore from "@ohos.data.relationalStore";
import curves from "@ohos.curves";
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let context: Context;
const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const TAG = "[RDB_JSKITS_TEST]";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";
const STORE_CONFIG = {
  name: "RSTest.db",
  securityLevel: relationalStore.SecurityLevel.S1
}

function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

let rdbStore;

export default function relationalStoreTest() {
  describe("relationalStoreTest", function () {
    beforeAll(async function () {
      console.info(TAG + "beforeAll");
      let ability = await delegator.getCurrentTopAbility();
      context = ability.context;
      console.info(TAG + 'Get context successful. context=' + context);
    });

    beforeEach(async function () {
      console.info(TAG + "beforeEach");
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
    });

    afterEach(async function () {
      console.info(TAG + "afterEach");
      await rdbStore.executeSql("DELETE FROM test");
      rdbStore = null
      await relationalStore.deleteRdbStore(context, "RSTest.db");
    });

    afterAll(async function () {
      console.info(TAG + "afterAll");
    });

    console.log(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0730
     * @tc.name   : testGetRdbStore001
     * @tc.desc   : getRdbStore callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testGetRdbStore001", 0, async function (done) {
      console.log(TAG + "************* testGetRdbStore001 start *************");
      let config = {
        name: "secure.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      };
      let getResult = false;
      relationalStore.getRdbStore(context, config, async (err, rdbStore) => {
        if (!err) {
          getResult = true;
          expect(!err).assertTrue();
        } else {
          console.error(`Get RdbStore failed, code is ${err.code},message is ${err.message}`);
          expect(!err).assertTrue();
          done();
        }
        try {
          await rdbStore.executeSql(CREATE_TABLE_TEST);
        } catch (err) {
          expect(!err).assertTrue();
          done();
        }
        await relationalStore.deleteRdbStore(context, "secure.db");
        expect(getResult).assertTrue();
        done();
        console.info(`Get RdbStore successfully.`);
      });
      console.log(TAG + "************* testGetRdbStore001 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0190
     * @tc.name   : testGetRdbStoreS2001
     * @tc.desc   : getRdbStore callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testGetRdbStoreS2001", 0, async function (done) {
      console.info(TAG + "************* testGetRdbStoreS2001 start *************");
      let config = {
        name: "secure.db",
        securityLevel: relationalStore.SecurityLevel.S2,
      };
      let getResult = false;
      relationalStore.getRdbStore(context, config, async (err, rdbStore) => {
        if (!err) {
          getResult = true;
          expect(!err).assertTrue();
        } else {
          console.info(`testGetRdbStoreS2001 failed, code is ${err.code},message is ${err.message}`);
          expect(!err).assertTrue();
          done();
        }
        try {
          await rdbStore.executeSql(CREATE_TABLE_TEST);
        } catch (err) {
          expect(!err).assertTrue();
          done();
        }
        await relationalStore.deleteRdbStore(context, "secure.db");
        expect(getResult).assertTrue();
        done();
        console.info(`testGetRdbStoreS2001 successfully.`);
      });
      console.info(TAG + "************* testGetRdbStoreS2001 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0200
     * @tc.name   : testGetRdbStoreS3001
     * @tc.desc   : getRdbStore callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testGetRdbStoreS3001", 0, async function (done) {
      console.info(TAG + "************* testGetRdbStoreS3001 start *************");
      let config = {
        name: "secure.db",
        securityLevel: relationalStore.SecurityLevel.S3,
      };
      let getResult = false;
      relationalStore.getRdbStore(context, config, async (err, rdbStore) => {
        if (!err) {
          getResult = true;
          expect(!err).assertTrue();
        } else {
          console.info(`testGetRdbStoreS3001 failed, code is ${err.code},message is ${err.message}`);
          expect(!err).assertTrue();
          done();
        }
        try {
          await rdbStore.executeSql(CREATE_TABLE_TEST);
        } catch (err) {
          expect(!err).assertTrue();
          done();
        }
        await relationalStore.deleteRdbStore(context, "secure.db");
        expect(getResult).assertTrue();
        done();
        console.info(`testGetRdbStoreS3001 successfully.`);
      });
      console.info(TAG + "************* testGetRdbStoreS3001 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0210
     * @tc.name   : testGetRdbStoreS4001
     * @tc.desc   : getRdbStore callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testGetRdbStoreS4001", 0, async function (done) {
      console.info(TAG + "************* testGetRdbStoreS4001 start *************");
      let config = {
        name: "secure.db",
        securityLevel: relationalStore.SecurityLevel.S4,
      };
      let getResult = false;
      relationalStore.getRdbStore(context, config, async (err, rdbStore) => {
        if (!err) {
          getResult = true;
          expect(!err).assertTrue();
        } else {
          console.info(`testGetRdbStoreS4001 failed, code is ${err.code},message is ${err.message}`);
          expect(!err).assertTrue();
          done();
        }
        try {
          await rdbStore.executeSql(CREATE_TABLE_TEST);
        } catch (err) {
          expect(!err).assertTrue();
          done();
        }
        await relationalStore.deleteRdbStore(context, "secure.db");
        expect(getResult).assertTrue();
        done();
        console.info(`testGetRdbStoreS4001 successfully.`);
      });
      console.info(TAG + "************* testGetRdbStoreS4001 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0180
     * @tc.name   : testGetRdbStore002
     * @tc.desc   : getRdbStore promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testGetRdbStore002", 0, async function (done) {
      console.log(TAG + "************* testGetRdbStore002 start *************");
      let config = {
        name: "secure.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      };
      let storePromise = relationalStore.getRdbStore(context, config);
      let getResult = false;
      storePromise
        .then(async (rdbStore) => {
          getResult = true;
          try {
            await rdbStore.executeSql(CREATE_TABLE_TEST);
          } catch (err) {
            expect(!err).assertTrue();
          }
          await relationalStore.deleteRdbStore(context, "secure.db");
          expect(getResult).assertTrue();
          done();
        })
        .catch((err) => {
          expect(!err).assertTrue();
          done();
        });
      console.log(TAG + "************* testGetRdbStore002 end   *************");
    });


    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0710
     * @tc.name   : testGetRdbStoreError001
     * @tc.desc   : getRdbStore callback test with error context
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testGetRdbStoreError001", 0, async function (done) {
      console.info(TAG + "************* testGetRdbStoreError001 start *************");
      let config = {
        name: "secure.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      };
      try {
        relationalStore.getRdbStore(undefined, config, async (err, rdbStore) => {
          console.info(`testGetRdbStoreError001 faied.`);
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.info(`testGetRdbStoreError001 :` + err);
        expect(err.code).assertEqual('401')
        done();
      }
      console.info(TAG + "************* testGetRdbStoreError001 end   *************");
    });


    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0690
     * @tc.name   : testGetRdbStoreError002
     * @tc.desc   : getRdbStore callback test with error config
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testGetRdbStoreError002", 0, async function (done) {
      console.info(TAG + "************* testGetRdbStoreError002 start *************");
      let config = {
        name: "secure.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      };
      try {
        relationalStore.getRdbStore(context, undefined, async (err, rdbStore) => {
          console.info(`testGetRdbStoreError002 faied.`);
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.info(`testGetRdbStoreError002 :` + err);
        expect(err.code).assertEqual('401')
        done();
      }
      console.info(TAG + "************* testGetRdbStoreError002 end   *************");
    });


    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0700
     * @tc.name   : testGetRdbStoreError003
     * @tc.desc   : getRdbStore promise test with error context
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testGetRdbStoreError003", 0, async function (done) {
      console.info(TAG + "************* testGetRdbStoreError003 start *************");
      let config = {
        name: "secure.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      };

      try {
        relationalStore.getRdbStore(undefined, config);
        expect(relationalStore !== null).assertFail();
      } catch (err) {
        console.info(`testGetRdbStoreError003 :` + err);
        expect(err.code).assertEqual('401')
        done();
      }
      console.info(TAG + "************* testGetRdbStoreError003 end   *************");
    });


    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0680
     * @tc.name   : testGetRdbStoreError004
     * @tc.desc   : getRdbStore promise test with error config
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testGetRdbStoreError004", 0, async function (done) {
      console.info(TAG + "************* testGetRdbStoreError004 start *************");
      let config = {
        name: "secure.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      };

      try {
        relationalStore.getRdbStore(context, undefined);
        expect().assertFail();
      } catch (err) {
        console.info(`testGetRdbStoreError004 :` + err);
        expect(err.code).assertEqual('401')
        done();
      }
      console.info(TAG + "************* testGetRdbStoreError004 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0720
     * @tc.name   : testGetRdbStoreError005
     * @tc.desc   : getRdbStore promise test with error config
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testGetRdbStoreError005", 0, async function (done) {
      console.info(TAG + "************* testGetRdbStoreError005 start *************");
      try {
        relationalStore.getRdbStore(undefined, undefined);
        expect().assertFail();
      } catch (err) {
        console.info(`testGetRdbStoreError005 :` + err);
        expect(err.code).assertEqual('401')
        done();
      }
      console.info(TAG + "************* testGetRdbStoreError005 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0620
     * @tc.name   : testDeleteRdbStore001
     * @tc.desc   : deleteRdbStore callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testDeleteRdbStore001", 0, async function (done) {
      console.log(TAG + "************* testDeleteRdbStore001 start *************");
      let config = {
        name: "secure.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      };
      rdbStore = await relationalStore.getRdbStore(context, config);
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
      let deleteResult = false;
      relationalStore.deleteRdbStore(context, "secure.db", async (err) => {
        if (err) {
          console.error(`Delete RdbStore failed, code is ${err.code},message is ${err.message}`);
          expect(!err).assertTrue();
          done();
        }
        if (err === undefined) {
          deleteResult = true;
        }
        console.info(`Delete RdbStore successfully.`);
        await sleep(1000);
        expect(deleteResult).assertTrue();
        done();
      });
      console.log(TAG + "************* testDeleteRdbStore001 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0630
     * @tc.name   : testDeleteRdbStore002
     * @tc.desc   : deleteRdbStore promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testDeleteRdbStore002", 0, async function (done) {
      console.log(TAG + "************* testDeleteRdbStore002 start *************");
      let config = {
        name: "secure.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      };
      rdbStore = await relationalStore.getRdbStore(context, config);
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
      let deleteResult = false;
      let promise = relationalStore.deleteRdbStore(context, "secure.db");
      promise
        .then(async () => {
          console.info(`Delete RdbStore successfully.`);
          deleteResult = true;
          await sleep(1000);
          expect(deleteResult).assertTrue();
          done();
        })
        .catch((err) => {
          console.error(`Delete RdbStore failed, code is ${err.code},message is ${err.message}`);
          expect(!err).assertTrue();
          done();
        });
      console.log(TAG + "************* testDeleteRdbStore002 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0160
     * @tc.name   : testDeleteRdbStore003
     * @tc.desc   : deleteRdbStore callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testDeleteRdbStore003", 0, async function (done) {
      console.log(TAG + "************* testDeleteRdbStore003 start *************");
      let config = {
        name: "secure.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      };
      rdbStore = await relationalStore.getRdbStore(context, config);
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
      let deleteResult = false;
      try {
        relationalStore.deleteRdbStore(context, config, async (err) => {
          if (err) {
            console.error(`Delete RdbStore failed, code is ${err.code},message is ${err.message}`);
            expect(!err).assertTrue();
            done();
          }
          if (err === undefined) {
            deleteResult = true;
          }
          console.info(`Delete RdbStore successfully.`);
          await sleep(1000);
          expect(deleteResult).assertTrue();
          done();
        });
      } catch (e) {
        expect(!e).assertTrue();
        console.log(TAG + "deleteRdbStore call failed.", e);
      }
      console.log(TAG + "************* testDeleteRdbStore003 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0170
     * @tc.name   : testDeleteRdbStore004
     * @tc.desc   : deleteRdbStore promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testDeleteRdbStore004", 0, async function (done) {
      console.log(TAG + "************* testDeleteRdbStore004 start *************");
      let config = {
        name: "secure.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      };
      rdbStore = await relationalStore.getRdbStore(context, config);
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
      let deleteResult = false;
      try {
        let promise = relationalStore.deleteRdbStore(context, config);
        promise
          .then(async () => {
            console.info(`Delete RdbStore successfully.`);
            deleteResult = true;
            await sleep(1000);
            expect(deleteResult).assertTrue();
            done();
          })
          .catch((err) => {
            console.error(`Delete RdbStore failed, code is ${err.code},message is ${err.message}`);
            expect(!err).assertTrue();
            done();
          });
      } catch (e) {
        console.log(TAG + "************* deleteRdbStore call failed.", e);
      }
      console.log(TAG + "************* testDeleteRdbStore004 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0570
     * @tc.name   : testDeleteRdbStoreError001
     * @tc.desc   : deleteRdbStore callback test with error context
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testDeleteRdbStoreError001", 0, async function (done) {
      console.info(TAG + "************* testDeleteRdbStoreError001 start *************");
      let config = {
        name: "secure.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      };
      rdbStore = await relationalStore.getRdbStore(context, config);
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
      try {
        relationalStore.deleteRdbStore(undefined, "secure.db", async (err) => {
          console.info(`testDeleteRdbStoreError001 faied.`);
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.info(`testDeleteRdbStoreError001 :` + err);
        expect(err.code).assertEqual('401')
        done();
      }
      console.info(TAG + "************* testDeleteRdbStoreError001 end   *************");
    });


    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0610
     * @tc.name   : testDeleteRdbStoreError002
     * @tc.desc   : deleteRdbStore callback test with error db
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testDeleteRdbStoreError002", 0, async function (done) {
      console.info(TAG + "************* testDeleteRdbStoreError002 start *************");
      let config = {
        name: "secure.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      };
      rdbStore = await relationalStore.getRdbStore(context, config);
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
      try {
        relationalStore.deleteRdbStore(context, undefined, async (err) => {
          console.info(`testDeleteRdbStoreError002 faied`);
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.info(`testDeleteRdbStoreError002 :` + err);
        expect(err.code).assertEqual('401')
        done();
      }
      console.info(TAG + "************* testDeleteRdbStoreError002 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0560
     * @tc.name   : testDeleteRdbStoreError003
     * @tc.desc   : deleteRdbStore promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testDeleteRdbStoreError003", 0, async function (done) {
      console.info(TAG + "************* testDeleteRdbStoreError003 start *************");
      let config = {
        name: "secure.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      };
      rdbStore = await relationalStore.getRdbStore(context, config);
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
      try {
        relationalStore.deleteRdbStore(undefined, "secure.db");
        expect(relationalStore !== null).assertFail();
      } catch (err) {
        console.info(`testDeleteRdbStoreError003 :` + err);
        expect(err.code).assertEqual('401')
        done();
      }
      console.info(TAG + "************* testDeleteRdbStoreError003 end   *************");
    });


    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0600
     * @tc.name   : testDeleteRdbStoreError004
     * @tc.desc   : deleteRdbStore promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testDeleteRdbStoreError004", 0, async function (done) {
      console.info(TAG + "************* testDeleteRdbStoreError004 start *************");
      let config = {
        name: "secure.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      };
      rdbStore = await relationalStore.getRdbStore(context, config);
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
      try {
        relationalStore.deleteRdbStore(context, undefined);
        expect(relationalStore !== null).assertFail();
      } catch (err) {
        console.info(`testDeleteRdbStoreError004 :` + err);
        expect(err.code).assertEqual('401')
        done();
      }
      console.info(TAG + "************* testDeleteRdbStoreError004 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0590
     * @tc.name   : testDeleteRdbStoreError005
     * @tc.desc   : deleteRdbStore callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testDeleteRdbStoreError005", 0, async function (done) {
      console.log(TAG + "************* testDeleteRdbStoreError005 start *************");
      let config = {
        name: "secure.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      };
      rdbStore = await relationalStore.getRdbStore(context, config);
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
      let deleteResult = false;
      relationalStore.deleteRdbStore(context, "error.db", async (err) => {
        if (err) {
          console.error(`testDeleteRdbStoreError005 failed, code is ${err.code},message is ${err.message}`);
          expect(!err).assertTrue();
          done();
        }
        if (err === undefined) {
          deleteResult = true;
        }
        console.info(`testDeleteRdbStoreError005 Delete RdbStore successfully.`);
        await sleep(1000);
        expect(deleteResult).assertTrue();
        done();
      });
      console.log(TAG + "************* testDeleteRdbStoreError005 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0580
     * @tc.name   : testDeleteRdbStoreError006
     * @tc.desc   : deleteRdbStore promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testDeleteRdbStoreError006", 0, async function (done) {
      console.log(TAG + "************* testDeleteRdbStoreError006 start *************");
      let config = {
        name: "secure.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      };
      rdbStore = await relationalStore.getRdbStore(context, config);
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
      let deleteResult = false;
      let promise = relationalStore.deleteRdbStore(context, "error.db");
      promise
        .then(async () => {
          console.info(`testDeleteRdbStoreError006 Delete RdbStore successfully.`);
          deleteResult = true;
          await sleep(1000);
          expect(deleteResult).assertTrue();
          done();
        })
        .catch((err) => {
          console.error(`testDeleteRdbStoreError006 Delete RdbStore failed, code is ${err.code},message is ${err.message}`);
          expect(!err).assertTrue();
          done();
        });
      console.log(TAG + "************* testDeleteRdbStoreError006 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0550
     * @tc.name   : testDeleteRdbStoreError007
     * @tc.desc   : deleteRdbStore callback test with error context
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testDeleteRdbStoreError007", 0, async function (done) {
      console.info(TAG + "************* testDeleteRdbStoreError007 start *************");
      let config = {
        name: "secure.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      };
      rdbStore = await relationalStore.getRdbStore(context, config);
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
      try {
        relationalStore.deleteRdbStore(undefined, config, async (err) => {
          console.info(`testDeleteRdbStoreError007 faied.`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.info(`testDeleteRdbStoreError007 :` + err);
        expect(err.code).assertEqual('401')
        done();
      }
      console.info(TAG + "************* testDeleteRdbStoreError007 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0540
     * @tc.name   : testDeleteRdbStoreError008
     * @tc.desc   : deleteRdbStore promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testDeleteRdbStoreError008", 0, async function (done) {
      console.info(TAG + "************* testDeleteRdbStoreError008 start *************");
      let config = {
        name: "secure.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      };
      rdbStore = await relationalStore.getRdbStore(context, config);
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
      try {
        relationalStore.deleteRdbStore(undefined, config);
        expect(relationalStore !== null).assertFail();
      } catch (err) {
        console.info(`testDeleteRdbStoreError003 :` + err);
        expect(err.code).assertEqual('401')
        done();
      }
      console.info(TAG + "************* testDeleteRdbStoreError008 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0760
     * @tc.name   : testConflictResolution001
     * @tc.desc   : ON_CONFLICT_NONE test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it("testConflictResolution001", 0, async function (done) {
      console.log(TAG + "************* testConflictResolution001 start *************");
      var u8 = new Uint8Array([1, 2, 3]);

      const valueBucket1 = {
        "id": 1,
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      await rdbStore.insert("test", valueBucket1, relationalStore.ConflictResolution.ON_CONFLICT_NONE);

      const valueBucket2 = {
        "id": 1,
        "name": "zhangsan",
        "age": 18,
        "salary": 200.5,
        "blobType": u8,
      }

      let insertPromise = rdbStore.insert("test", valueBucket2, relationalStore.ConflictResolution.ON_CONFLICT_NONE);
      insertPromise.then(async (ret) => {
        expect(0).assertEqual(ret);
        console.log(TAG + " testConflictResolution001 insert first done: " + ret);
        expect().assertFail();
      }).catch((err) => {
        console.log(TAG + " testConflictResolution001 insert with wrong valuebucket2 and ConflictResolution is default");
        expect(err.code == 14800000).assertTrue();
        done();
      })

      console.log(TAG + "************* testConflictResolution001 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_1070
     * @tc.name   : testConflictResolution002
     * @tc.desc   : ON_CONFLICT_ROLLBACK test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it("testConflictResolution002", 0, async function (done) {
      console.log(TAG + "************* testConflictResolution002 start *************");
      var u81 = new Uint8Array([1, 2, 3]);
      const valueBucket1 = {
        "id": 1,
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u81,
      }
      await rdbStore.insert("test", valueBucket1);

      var u82 = new Uint8Array([4, 5, 6]);
      const valueBucket2 = {
        "id": 2,
        "name": "lisi",
        "age": 19,
        "salary": 200.5,
        "blobType": u82,
      }
      await rdbStore.insert("test", valueBucket2);

      var u83 = new Uint8Array([7, 8, 9]);
      const valueBucket3 = {
        "id": 3,
        "name": "wangjing",
        "age": 20,
        "salary": 300.5,
        "blobType": u83,
      }
      let predicates = await new relationalStore.RdbPredicates("test");
      await predicates.equalTo("age", "19");
      let updatePromise = rdbStore.update(valueBucket3, predicates, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
      updatePromise.then(async (ret) => {
        await console.log(TAG + "testConflictResolution002 done: " + ret);
        {
          let predicates = await new relationalStore.RdbPredicates("test");
          let resultSet = await rdbStore.query(predicates);

          expect(true).assertEqual(resultSet.goToFirstRow());
          const id = await resultSet.getLong(resultSet.getColumnIndex("id"));
          const name = await resultSet.getString(resultSet.getColumnIndex("name"));
          const age = await resultSet.getLong(resultSet.getColumnIndex("age"));
          const salary = await resultSet.getDouble(resultSet.getColumnIndex("salary"));
          const blobType = await resultSet.getBlob(resultSet.getColumnIndex("blobType"));

          await expect(1).assertEqual(id);
          await expect("zhangsan").assertEqual(name);
          await expect(18).assertEqual(age);
          await expect(100.5).assertEqual(salary);
          await expect(1).assertEqual(blobType[0]);
          await expect(2).assertEqual(blobType[1]);
          await expect(3).assertEqual(blobType[2]);
          console.log(TAG + "testConflictResolution002 {id=" + id + ", name=" + name + ", age=" + age + ", salary="
          + salary + ", blobType=" + blobType);

          await expect(true).assertEqual(resultSet.goToNextRow());
          const id_1 = await resultSet.getLong(resultSet.getColumnIndex("id"));
          const name_1 = await resultSet.getString(resultSet.getColumnIndex("name"));
          const age_1 = await resultSet.getLong(resultSet.getColumnIndex("age"));
          const salary_1 = await resultSet.getDouble(resultSet.getColumnIndex("salary"));
          const blobType_1 = await resultSet.getBlob(resultSet.getColumnIndex("blobType"));

          await expect(3).assertEqual(id_1);
          await expect("wangjing").assertEqual(name_1);
          await expect(20).assertEqual(age_1);
          await expect(300.5).assertEqual(salary_1);
          await expect(7).assertEqual(blobType_1[0]);
          await expect(8).assertEqual(blobType_1[1]);
          await expect(9).assertEqual(blobType_1[2]);
          console.log(TAG + "testConflictResolution002 {id=" + id_1 + ", name=" + name_1 + ", age=" + age_1 + ", salary="
          + salary_1 + ", blobType=" + blobType_1);
          await expect(false).assertEqual(resultSet.goToNextRow());

          resultSet.close();
          done();
          console.log(TAG + "************* testConflictResolution002 end   *************");
        }
      }).catch((err) => {
        console.log(TAG + "testConflictResolution002 error");
        expect(!err).assertTrue();
        console.log(TAG + "************* testConflictResolution002 end   *************");
      })
      console.log(TAG + "************* testConflictResolution002 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_1030
     * @tc.name   : testConflictResolution003
     * @tc.desc   : ON_CONFLICT_ABORT test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it("testConflictResolution003", 0, async function (done) {
      console.log(TAG + "************* testConflictResolution003 start *************");

      var u81 = new Uint8Array([1, 2, 3]);
      const valueBucket1 = {
        "id": 1,
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u81,
      }
      await rdbStore.insert("test", valueBucket1);

      var u82 = new Uint8Array([4, 5, 6]);
      const valueBucket2 = {
        "id": 2,
        "name": "lisi",
        "age": 19,
        "salary": 200.5,
        "blobType": u82,
      }
      await rdbStore.insert("test", valueBucket2);

      var u83 = new Uint8Array([7, 8, 9]);
      const valueBucket3 = {
        "id": 3,
        "name": "wangjing",
        "age": 20,
        "salary": 300.5,
        "blobType": u83,
      }
      let predicates = await new relationalStore.RdbPredicates("test");
      await predicates.equalTo("age", "19");
      let updatePromise = rdbStore.update(valueBucket3, predicates, relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
      updatePromise.then(async (ret) => {
        await expect(1).assertEqual(ret);
        await console.log(TAG + "testConflictResolution003 done: " + ret);
        {
          let predicates = await new relationalStore.RdbPredicates("test");
          let resultSet = await rdbStore.query(predicates);

          expect(true).assertEqual(resultSet.goToFirstRow());
          const id = await resultSet.getLong(resultSet.getColumnIndex("id"));
          const name = await resultSet.getString(resultSet.getColumnIndex("name"));
          const age = await resultSet.getLong(resultSet.getColumnIndex("age"));
          const salary = await resultSet.getDouble(resultSet.getColumnIndex("salary"));
          const blobType = await resultSet.getBlob(resultSet.getColumnIndex("blobType"));

          await expect(1).assertEqual(id);
          await expect("zhangsan").assertEqual(name);
          await expect(18).assertEqual(age);
          await expect(100.5).assertEqual(salary);
          await expect(1).assertEqual(blobType[0]);
          await expect(2).assertEqual(blobType[1]);
          await expect(3).assertEqual(blobType[2]);
          console.log(TAG + "testConflictResolution003 {id=" + id + ", name=" + name + ", age=" + age + ", salary="
          + salary + ", blobType=" + blobType);

          await expect(true).assertEqual(resultSet.goToNextRow());
          const id_1 = await resultSet.getLong(resultSet.getColumnIndex("id"));
          const name_1 = await resultSet.getString(resultSet.getColumnIndex("name"));
          const age_1 = await resultSet.getLong(resultSet.getColumnIndex("age"));
          const salary_1 = await resultSet.getDouble(resultSet.getColumnIndex("salary"));
          const blobType_1 = await resultSet.getBlob(resultSet.getColumnIndex("blobType"));

          await expect(3).assertEqual(id_1);
          await expect("wangjing").assertEqual(name_1);
          await expect(20).assertEqual(age_1);
          await expect(300.5).assertEqual(salary_1);
          await expect(7).assertEqual(blobType_1[0]);
          await expect(8).assertEqual(blobType_1[1]);
          await expect(9).assertEqual(blobType_1[2]);
          console.log(TAG + "testConflictResolution003 {id=" + id_1 + ", name=" + name_1 + ", age=" + age_1 + ", salary="
          + salary_1 + ", blobType=" + blobType_1);
          await expect(false).assertEqual(resultSet.goToNextRow());

          resultSet.close();
          done();
          console.log(TAG + "************* testConflictResolution003 end   *************");
        }
      }).catch((err) => {
        console.log(TAG + "testConflictResolution003 error");
        expect(!err).assertTrue();
        console.log(TAG + "************* testConflictResolution003 end   *************");
      })

      console.log(TAG + "************* testConflictResolution003 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_1050
     * @tc.name   : testConflictResolution004
     * @tc.desc   : ON_CONFLICT_FAIL test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it("testConflictResolution004", 0, async function (done) {
      console.log(TAG + "************* testConflictResolution004 start *************");

      var u81 = new Uint8Array([1, 2, 3]);
      const valueBucket1 = {
        "id": 1,
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u81,
      }
      await rdbStore.insert("test", valueBucket1);
      var u82 = new Uint8Array([4, 5, 6]);
      const valueBucket2 = {
        "id": 2,
        "name": "lisi",
        "age": 19,
        "salary": 200.5,
        "blobType": u82,
      }
      await rdbStore.insert("test", valueBucket2);

      var u83 = new Uint8Array([7, 8, 9]);
      const valueBucket3 = {
        "id": 3,
        "name": "wangjing",
        "age": 20,
        "salary": 300.5,
        "blobType": u83,
      }
      let predicates = await new relationalStore.RdbPredicates("test");
      await predicates.equalTo("age", "19");
      let updatePromise = rdbStore.update(valueBucket3, predicates, relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
      updatePromise.then(async (ret) => {
        await expect(1).assertEqual(ret);
        await console.log(TAG + "testConflictResolution004 done: " + ret);
        {
          let predicates = await new relationalStore.RdbPredicates("test");
          let resultSet = await rdbStore.query(predicates);

          expect(true).assertEqual(resultSet.goToFirstRow());
          const id = await resultSet.getLong(resultSet.getColumnIndex("id"));
          const name = await resultSet.getString(resultSet.getColumnIndex("name"));
          const age = await resultSet.getLong(resultSet.getColumnIndex("age"));
          const salary = await resultSet.getDouble(resultSet.getColumnIndex("salary"));
          const blobType = await resultSet.getBlob(resultSet.getColumnIndex("blobType"));

          await expect(1).assertEqual(id);
          await expect("zhangsan").assertEqual(name);
          await expect(18).assertEqual(age);
          await expect(100.5).assertEqual(salary);
          await expect(1).assertEqual(blobType[0]);
          await expect(2).assertEqual(blobType[1]);
          await expect(3).assertEqual(blobType[2]);
          console.log(TAG + "testConflictResolution004 {id=" + id + ", name=" + name + ", age=" + age + ", salary="
          + salary + ", blobType=" + blobType);

          await expect(true).assertEqual(resultSet.goToNextRow());
          const id_1 = await resultSet.getLong(resultSet.getColumnIndex("id"));
          const name_1 = await resultSet.getString(resultSet.getColumnIndex("name"));
          const age_1 = await resultSet.getLong(resultSet.getColumnIndex("age"));
          const salary_1 = await resultSet.getDouble(resultSet.getColumnIndex("salary"));
          const blobType_1 = await resultSet.getBlob(resultSet.getColumnIndex("blobType"));

          await expect(3).assertEqual(id_1);
          await expect("wangjing").assertEqual(name_1);
          await expect(20).assertEqual(age_1);
          await expect(300.5).assertEqual(salary_1);
          await expect(7).assertEqual(blobType_1[0]);
          await expect(8).assertEqual(blobType_1[1]);
          await expect(9).assertEqual(blobType_1[2]);
          console.log(TAG + "testConflictResolution004 {id=" + id_1 + ", name=" + name_1 + ", age=" + age_1 + ", salary="
          + salary_1 + ", blobType=" + blobType_1);
          await expect(false).assertEqual(resultSet.goToNextRow());

          resultSet.close();
          done();
          console.log(TAG + "************* testConflictResolution004 end   *************");
        }

      }).catch((err) => {
        console.log(TAG + "testConflictResolution004 error");
        expect(!err).assertFail();
        done();
        console.log(TAG + "************* testConflictResolution004 end   *************");
      })
      console.log(TAG + "************* testConflictResolution004 end   *************");
    });

    /**
     * @tc.number :  SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0740
     * @tc.name   : testConflictResolution005
     * @tc.desc   : ON_CONFLICT_IGNORE test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it("testConflictResolution005", 0, async function (done) {
      console.log(TAG + "************* testConflictResolution005 start *************");
      var u8 = new Uint8Array([1, 2, 3]);

      const valueBucket = {
        "id": 1,
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      await rdbStore.insert("test", valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
      const valueBucket2 = {
        "id": 1,
        "name": "zhangsan",
        "age": 18,
        "salary": 200.5,
        "blobType": u8,
      }
      await rdbStore.insert("test", valueBucket2, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);

      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "zhangsan");
      let resultSet = await rdbStore.query(predicates);
      try {
        console.log(TAG + " testConflictResolution005 resultSet query done");
        expect(true).assertEqual(resultSet.goToFirstRow());
        const id = resultSet.getLong(resultSet.getColumnIndex("id"));
        const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"));
        console.log(TAG + " testConflictResolution005 id=" + id + ", salary=" + salary);
        expect(1).assertEqual(id);
        expect(100.5).assertEqual(salary);
        expect(false).assertEqual(resultSet.goToNextRow());
      } catch (err) {
        console.log(TAG + " testConflictResolution005 insert error" + err);
      }
      resultSet.close();
      done();
      console.log(TAG + "************* testConflictResolution005 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0780
     * @tc.name   : testConflictResolution006
     * @tc.desc   : ON_CONFLICT_REPLACE test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it("testConflictResolution006", 0, async function (done) {
      console.log(TAG + "************* testConflictResolution006 start *************");

      var u8 = new Uint8Array([1, 2, 3]);
      const valueBucket = {
        "id": 1,
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      await rdbStore.insert("test", valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);

      var u8 = new Uint8Array([4, 5, 6]);
      const valueBucket2 = {
        "id": 1,
        "name": "zhangsan",
        "age": 18,
        "salary": 200.5,
        "blobType": u8,
      }
      await rdbStore.insert("test", valueBucket2, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);

      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "zhangsan");
      let resultSet = await rdbStore.query(predicates);
      resultSet = await rdbStore.query(predicates);
      try {
        console.log(TAG + " testConflictResolution006 resultSet query done");
        expect(true).assertEqual(resultSet.goToFirstRow());
        const id = resultSet.getLong(resultSet.getColumnIndex("id"));
        const name = resultSet.getString(resultSet.getColumnIndex("name"));
        const age = resultSet.getLong(resultSet.getColumnIndex("age"));
        const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"));
        const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"));
        console.log(TAG + " testConflictResolution006 id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
        expect(1).assertEqual(id);
        expect("zhangsan").assertEqual(name);
        expect(18).assertEqual(age);
        expect(200.5).assertEqual(salary);
        expect(4).assertEqual(blobType[0]);
        expect(5).assertEqual(blobType[1]);
        expect(6).assertEqual(blobType[2]);
        expect(false).assertEqual(resultSet.goToNextRow());
      } catch (err) {
        console.log(TAG + " testConflictResolution006 resultSet query error " + err);
        expect(!err).assertTrue();
      }
      resultSet.close();
      done();
      console.log(TAG + "************* testConflictResolution006 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0790    9
     * @tc.name   : testConflictResolution007
     * @tc.desc   : ON_CONFLICT_REPLACE test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it("testConflictResolution007", 0, async function (done) {
      console.log(TAG + "************* testConflictResolution007 start *************");

      var u8 = new Uint8Array([1, 2, 3]);
      const valueBucket = {
        "id": 1,
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      await rdbStore.insert("test", valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);

      var u8 = new Uint8Array([4, 5, 6]);
      const valueBucket2 = {
        "id": 1,
        "name": "zhangsan",
        "age": 18,
        "salary": 200.5,
        "blobType": u8,
      }
      rdbStore.insert("test", valueBucket2, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE, async (e, ret) => {
        console.log(TAG + "testConflictResolution007 done: " + ret);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "zhangsan");
        let resultSet = await rdbStore.query(predicates);
        resultSet = await rdbStore.query(predicates);
        try {
          console.log(TAG + " testConflictResolution007 resultSet query done");
          expect(true).assertEqual(resultSet.goToFirstRow());
          const id = resultSet.getLong(resultSet.getColumnIndex("id"));
          const name = resultSet.getString(resultSet.getColumnIndex("name"));
          const age = resultSet.getLong(resultSet.getColumnIndex("age"));
          const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"));
          const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"));
          console.log(TAG + " testConflictResolution007 id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
          expect(1).assertEqual(id);
          expect("zhangsan").assertEqual(name);
          expect(18).assertEqual(age);
          expect(200.5).assertEqual(salary);
          expect(4).assertEqual(blobType[0]);
          expect(5).assertEqual(blobType[1]);
          expect(6).assertEqual(blobType[2]);
          expect(false).assertEqual(resultSet.goToNextRow());
        } catch (err) {
          console.log(TAG + " testConflictResolution007 resultSet query error " + err);
          expect(!err).assertTrue();
        }
        resultSet.close();
        done();
      });

      console.log(TAG + "************* testConflictResolution007 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0750
     * @tc.name   : testConflictResolution008
     * @tc.desc   : ON_CONFLICT_IGNORE test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it("testConflictResolution008", 0, async function (done) {
      console.log(TAG + "************* testConflictResolution008 start *************");
      var u8 = new Uint8Array([1, 2, 3]);

      const valueBucket = {
        "id": 1,
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      await rdbStore.insert("test", valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);


      const valueBucket2 = {
        "id": 1,
        "name": "zhangsan",
        "age": 18,
        "salary": 200.5,
        "blobType": u8,
      }
      rdbStore.insert("test", valueBucket2, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE, async (e, ret) => {
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "zhangsan");
        let resultSet = await rdbStore.query(predicates);
        try {
          console.log(TAG + " testConflictResolution008 resultSet query done");
          expect(true).assertEqual(resultSet.goToFirstRow());
          const id = resultSet.getLong(resultSet.getColumnIndex("id"));
          const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"));
          console.log(TAG + " testConflictResolution008 id=" + id + ", salary=" + salary);
          expect(1).assertEqual(id);
          expect(100.5).assertEqual(salary);
          expect(false).assertEqual(resultSet.goToNextRow());
        } catch (err) {
          console.log(TAG + " testConflictResolution008 insert error" + err);
          expect(!err).assertTrue();
        }
        resultSet.close();
        done();
        console.log(TAG + "************* testConflictResolution008 end   *************");
      });

    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_1060
     * @tc.name   : testConflictResolution009
     * @tc.desc   : ON_CONFLICT_FAIL test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it("testConflictResolution009", 0, async function (done) {
      console.log(TAG + "************* testConflictResolution009 start *************");

      var u81 = new Uint8Array([1, 2, 3]);
      const valueBucket1 = {
        "id": 1,
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u81,
      }
      await rdbStore.insert("test", valueBucket1);


      var u82 = new Uint8Array([4, 5, 6]);
      const valueBucket2 = {
        "id": 2,
        "name": "lisi",
        "age": 19,
        "salary": 200.5,
        "blobType": u82,
      }
      await rdbStore.insert("test", valueBucket2);

      var u83 = new Uint8Array([7, 8, 9]);
      const valueBucket3 = {
        "id": 3,
        "name": "wangjing",
        "age": 20,
        "salary": 300.5,
        "blobType": u83,
      }
      let predicates = await new relationalStore.RdbPredicates("test");
      await predicates.equalTo("age", "19");
      rdbStore.update(valueBucket3, predicates, relationalStore.ConflictResolution.ON_CONFLICT_FAIL, async (e, ret) => {
        expect(1).assertEqual(ret);
        console.log(TAG + "testConflictResolution009 done: " + ret);
        {
          let predicates = await new relationalStore.RdbPredicates("test");
          let resultSet = await rdbStore.query(predicates);

          expect(true).assertEqual(resultSet.goToFirstRow());
          const id = await resultSet.getLong(resultSet.getColumnIndex("id"));
          const name = await resultSet.getString(resultSet.getColumnIndex("name"));
          const age = await resultSet.getLong(resultSet.getColumnIndex("age"));
          const salary = await resultSet.getDouble(resultSet.getColumnIndex("salary"));
          const blobType = await resultSet.getBlob(resultSet.getColumnIndex("blobType"));

          await expect(1).assertEqual(id);
          await expect("zhangsan").assertEqual(name);
          await expect(18).assertEqual(age);
          await expect(100.5).assertEqual(salary);
          await expect(1).assertEqual(blobType[0]);
          await expect(2).assertEqual(blobType[1]);
          await expect(3).assertEqual(blobType[2]);
          console.log(TAG + "testConflictResolution004 {id=" + id + ", name=" + name + ", age=" + age + ", salary="
          + salary + ", blobType=" + blobType);

          await expect(true).assertEqual(resultSet.goToNextRow());
          const id_1 = await resultSet.getLong(resultSet.getColumnIndex("id"));
          const name_1 = await resultSet.getString(resultSet.getColumnIndex("name"));
          const age_1 = await resultSet.getLong(resultSet.getColumnIndex("age"));
          const salary_1 = await resultSet.getDouble(resultSet.getColumnIndex("salary"));
          const blobType_1 = await resultSet.getBlob(resultSet.getColumnIndex("blobType"));

          await expect(3).assertEqual(id_1);
          await expect("wangjing").assertEqual(name_1);
          await expect(20).assertEqual(age_1);
          await expect(300.5).assertEqual(salary_1);
          await expect(7).assertEqual(blobType_1[0]);
          await expect(8).assertEqual(blobType_1[1]);
          await expect(9).assertEqual(blobType_1[2]);
          console.log(TAG + "testConflictResolution009 {id=" + id_1 + ", name=" + name_1 + ", age=" + age_1 + ", salary="
          + salary_1 + ", blobType=" + blobType_1);
          await expect(false).assertEqual(resultSet.goToNextRow());

          resultSet.close();
          done();
          console.log(TAG + "************* testConflictResolution009 end   *************");
        }
        expect(predicates !== null).assertTrue();
      });
      console.log(TAG + "************* testConflictResolution009 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_1040
     * @tc.name   : testConflictResolution010
     * @tc.desc   : ON_CONFLICT_ABORT test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it("testConflictResolution010", 0, async function (done) {
      console.log(TAG + "************* testConflictResolution010 start *************");

      var u81 = new Uint8Array([1, 2, 3]);
      const valueBucket1 = {
        "id": 1,
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u81,
      }
      await rdbStore.insert("test", valueBucket1);
      var u82 = new Uint8Array([4, 5, 6]);
      const valueBucket2 = {
        "id": 2,
        "name": "lisi",
        "age": 19,
        "salary": 200.5,
        "blobType": u82,
      }
      await rdbStore.insert("test", valueBucket2);
      var u83 = new Uint8Array([7, 8, 9]);
      const valueBucket3 = {
        "id": 3,
        "name": "wangjing",
        "age": 20,
        "salary": 300.5,
        "blobType": u83,
      }
      let predicates = await new relationalStore.RdbPredicates("test");
      await predicates.equalTo("age", "19");
      rdbStore.update(valueBucket3, predicates, relationalStore.ConflictResolution.ON_CONFLICT_ABORT, async (e, ret) => {
        await expect(1).assertEqual(ret);
        await console.log(TAG + "testConflictResolution010 done: " + ret);
        {
          let predicates = await new relationalStore.RdbPredicates("test");
          let resultSet = await rdbStore.query(predicates);

          expect(true).assertEqual(resultSet.goToFirstRow());
          const id = await resultSet.getLong(resultSet.getColumnIndex("id"));
          const name = await resultSet.getString(resultSet.getColumnIndex("name"));
          const age = await resultSet.getLong(resultSet.getColumnIndex("age"));
          const salary = await resultSet.getDouble(resultSet.getColumnIndex("salary"));
          const blobType = await resultSet.getBlob(resultSet.getColumnIndex("blobType"));

          await expect(1).assertEqual(id);
          await expect("zhangsan").assertEqual(name);
          await expect(18).assertEqual(age);
          await expect(100.5).assertEqual(salary);
          await expect(1).assertEqual(blobType[0]);
          await expect(2).assertEqual(blobType[1]);
          await expect(3).assertEqual(blobType[2]);
          console.log(TAG + "testConflictResolution010 {id=" + id + ", name=" + name + ", age=" + age + ", salary="
          + salary + ", blobType=" + blobType);

          await expect(true).assertEqual(resultSet.goToNextRow());
          const id_1 = await resultSet.getLong(resultSet.getColumnIndex("id"));
          const name_1 = await resultSet.getString(resultSet.getColumnIndex("name"));
          const age_1 = await resultSet.getLong(resultSet.getColumnIndex("age"));
          const salary_1 = await resultSet.getDouble(resultSet.getColumnIndex("salary"));
          const blobType_1 = await resultSet.getBlob(resultSet.getColumnIndex("blobType"));

          await expect(3).assertEqual(id_1);
          await expect("wangjing").assertEqual(name_1);
          await expect(20).assertEqual(age_1);
          await expect(300.5).assertEqual(salary_1);
          await expect(7).assertEqual(blobType_1[0]);
          await expect(8).assertEqual(blobType_1[1]);
          await expect(9).assertEqual(blobType_1[2]);
          console.log(TAG + "testConflictResolution010 {id=" + id_1 + ", name=" + name_1 + ", age=" + age_1 + ", salary="
          + salary_1 + ", blobType=" + blobType_1);
          await expect(false).assertEqual(resultSet.goToNextRow());

          resultSet.close();
          done();
          console.log(TAG + "************* testConflictResolution010 end   *************");
        }
      });
      expect(predicates !== null).assertTrue();
      console.log(TAG + "************* testConflictResolution010 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_1080
     * @tc.name   : testConflictResolution011
     * @tc.desc   : ON_CONFLICT_ROLLBACK test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it("testConflictResolution011", 0, async function (done) {
      console.log(TAG + "************* testConflictResolution011 start *************");
      var u81 = new Uint8Array([1, 2, 3]);
      const valueBucket1 = {
        "id": 1,
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u81,
      }
      await rdbStore.insert("test", valueBucket1);

      var u82 = new Uint8Array([4, 5, 6]);
      const valueBucket2 = {
        "id": 2,
        "name": "lisi",
        "age": 19,
        "salary": 200.5,
        "blobType": u82,
      }
      await rdbStore.insert("test", valueBucket2);

      var u83 = new Uint8Array([7, 8, 9]);
      const valueBucket3 = {
        "id": 3,
        "name": "wangjing",
        "age": 20,
        "salary": 300.5,
        "blobType": u83,
      }
      let predicates = await new relationalStore.RdbPredicates("test");
      await predicates.equalTo("age", "19");
      rdbStore.update(valueBucket3, predicates, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK, async (e, ret) => {
        await console.log(TAG + "testConflictResolution011 done: " + ret);
        {
          let predicates = await new relationalStore.RdbPredicates("test");
          let resultSet = await rdbStore.query(predicates);

          expect(true).assertEqual(resultSet.goToFirstRow());
          const id = await resultSet.getLong(resultSet.getColumnIndex("id"));
          const name = await resultSet.getString(resultSet.getColumnIndex("name"));
          const age = await resultSet.getLong(resultSet.getColumnIndex("age"));
          const salary = await resultSet.getDouble(resultSet.getColumnIndex("salary"));
          const blobType = await resultSet.getBlob(resultSet.getColumnIndex("blobType"));

          await expect(1).assertEqual(id);
          await expect("zhangsan").assertEqual(name);
          await expect(18).assertEqual(age);
          await expect(100.5).assertEqual(salary);
          await expect(1).assertEqual(blobType[0]);
          await expect(2).assertEqual(blobType[1]);
          await expect(3).assertEqual(blobType[2]);
          console.log(TAG + "testConflictResolution011 {id=" + id + ", name=" + name + ", age=" + age + ", salary="
          + salary + ", blobType=" + blobType);

          await expect(true).assertEqual(resultSet.goToNextRow());
          const id_1 = await resultSet.getLong(resultSet.getColumnIndex("id"));
          const name_1 = await resultSet.getString(resultSet.getColumnIndex("name"));
          const age_1 = await resultSet.getLong(resultSet.getColumnIndex("age"));
          const salary_1 = await resultSet.getDouble(resultSet.getColumnIndex("salary"));
          const blobType_1 = await resultSet.getBlob(resultSet.getColumnIndex("blobType"));

          await expect(3).assertEqual(id_1);
          await expect("wangjing").assertEqual(name_1);
          await expect(20).assertEqual(age_1);
          await expect(300.5).assertEqual(salary_1);
          await expect(7).assertEqual(blobType_1[0]);
          await expect(8).assertEqual(blobType_1[1]);
          await expect(9).assertEqual(blobType_1[2]);
          console.log(TAG + "testConflictResolution011 {id=" + id_1 + ", name=" + name_1 + ", age=" + age_1 + ", salary="
          + salary_1 + ", blobType=" + blobType_1);
          await expect(false).assertEqual(resultSet.goToNextRow());

          resultSet.close();
          done();
          console.log(TAG + "************* testConflictResolution011 end   *************");
        }
      });
      expect(predicates !== null).assertTrue();
      console.log(TAG + "************* testConflictResolution011 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0770
     * @tc.name   : testConflictResolution012
     * @tc.desc   : ON_CONFLICT_NONE test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it("testConflictResolution012", 0, async function (done) {
      console.log(TAG + "************* testConflictResolution012 start *************");
      var u8 = new Uint8Array([1, 2, 3]);

      const valueBucket1 = {
        "id": 1,
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      await rdbStore.insert("test", valueBucket1, relationalStore.ConflictResolution.ON_CONFLICT_NONE);

      const valueBucket2 = {
        "id": 1,
        "name": "zhangsan",
        "age": 18,
        "salary": 200.5,
        "blobType": u8,
      }

      rdbStore.insert("test", valueBucket2, relationalStore.ConflictResolution.ON_CONFLICT_NONE, async (err, ret) => {
        if (err) {
          console.log(TAG + " testConflictResolution012 insert with wrong valuebucket2 and ConflictResolution is default");
          expect(err.code == 14800000).assertTrue();
          done();
          return;
        }
        expect(1).assertFail();
        console.log(TAG + " testConflictResolution012 insert first done: " + ret);
        done();
      });
      console.log(TAG + "************* testConflictResolution012 end   *************");
    });

  });
}
