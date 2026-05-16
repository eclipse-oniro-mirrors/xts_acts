/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import relationalStore from '@ohos.data.relationalStore';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const TAG = '[STAGE_AIP_RAG_STATUS_TEST]';
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
let storeConfigInvIdx:relationalStore.StoreConfig = {
	name: "test.db",
	securityLevel: relationalStore.SecurityLevel.S1,
	tokenizer: relationalStore.Tokenizer.CUSTOM_TOKENIZER

};

let storeConfigVector:relationalStore.StoreConfig = {
	name: "test_vector.db",
	securityLevel: relationalStore.SecurityLevel.S1,
	vector: true

};

async function openAndCreateTable(){
	let store = await relationalStore.getRdbStore(context, storeConfigInvIdx);
	if (store == undefined){
		return false;
	}
	let createTableSql = "CREATE TABLE IF NOT EXISTS email(id integer primary key, subject text, content text,"+
	"ocr_text text, attachment_names text, inline_files text,send_time integer, receivers text, sender text)";
	await store.executeSql(createTableSql);
	await store.close();
	return true;

}

function sleep(ms:number):Promise<void> {
	return new Promise(resolve => setTimeout(resolve, ms));
}

export default function relationalStoreRagStatusTest() {
describe('relationalStoreRagStatusTest', () => {
    beforeAll(async () => {
        console.info(TAG + 'beforeAll');
    })

    beforeEach(async () => {
        console.info(TAG + 'beforeEach');
		await relationalStore.deleteRdbStore(context, storeConfigInvIdx);
        await relationalStore.deleteRdbStore(context, storeConfigVector);
    })

    afterEach(async () => {
        console.info(TAG + 'afterEach');
		await relationalStore.deleteRdbStore(context, storeConfigInvIdx);
        await relationalStore.deleteRdbStore(context, storeConfigVector);
    })

    afterAll(async () => {
        console.info(TAG + 'afterAll');
    })

    /**
     * @tc.name   SUB_DDM_RELATIONALETS_RAGSTATUSTEST_0010
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RagStatusTest_0100
     * @tc.desc   resultSet getBlob normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_RELATIONALETS_RAGSTATUSTEST_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.info(TAG + '************* SUB_DDM_RELATIONALETS_RAGSTATUSTEST_0010 start *************');
        try {
           let result = await openAndCreateTable();
		   expect(result).assertTrue();
		   let knowledgeConfig = storeConfigInvIdx;
		   knowledgeConfig.enableSemanticIndex = false;
		   let store = await relationalStore.getRdbStore(context, knowledgeConfig);
		   expect(store != undefined).assertEqual(true);
		   await(10000);
		   knowledgeConfig.enableSemanticIndex = undefined;
		   store = await relationalStore.getRdbStore(context, knowledgeConfig);
		   expect(store != undefined).assertEqual(true);
           await(10000);
		   knowledgeConfig.enableSemanticIndex = true;
		   store = await relationalStore.getRdbStore(context, knowledgeConfig);
		   expect(store != undefined).assertEqual(true);
		   
        } catch (e) {
            expect(e.code).assertEqual("801");
            console.info(TAG + 'SUB_DDM_RELATIONALETS_RAGSTATUSTEST_0010 err.code' + e.code);
        } 
        done();
        console.info(TAG + '************* SUB_DDM_RELATIONALETS_RAGSTATUSTEST_0010 end *************');
    })

  
})
}
