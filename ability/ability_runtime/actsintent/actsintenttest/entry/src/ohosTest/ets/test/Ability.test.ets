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
import { describe, expect, it, Level } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import { insightIntent, InsightIntentEntity, insightIntentProvider } from '@kit.AbilityKit';

export default function abilityTest() {
  describe('ActsInsightIntentDecoratorTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.

    /**
     * @tc.name   SUB_Ability_AbilityRunTime_InsightIntent_0010
     * @tc.number SUB_Ability_AbilityRunTime_InsightIntent_0010
     * @tc.desc   The Ability or Page with @InsightIntentLink @InsightIntentEntry @InsightIntentFunction&@InsightIntentFunctionMethod @InsightIntentPage Decorator can start normally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRunTime_InsightIntent_0010', Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Ability_AbilityRunTime_InsightIntent_0010';
      console.log(`[${caseName}] create`);
      try {
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(`[${caseName}]: error` + error.code + error.message);
        expect().assertFail();
        done();
      }
      console.log(`[${caseName}]: end`)
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityRunTime_InsightIntentProvider_4800
     * @tc.number SUB_Ability_AbilityRunTime_InsightIntentProvider_4800
     * @tc.desc   Test sendExecuteResult with instanceId is -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRunTime_InsightIntentProvider_4800', Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Ability_AbilityRunTime_InsightIntentProvider_4800';
      console.log(`[${caseName}] create`);
      try {
        let result: insightIntent.ExecuteResult = {
          code: 404,
          result: {
            message: 'Nothing',
          }
        };
        insightIntentProvider.sendExecuteResult(-1, result).then(()=>{
          try{ expect().assertFail();}catch{}
          done();
        }).catch((err:BusinessError)=>{
          try{expect(err?.code).assertEqual(16000003);}catch{}
          done();
        })
      } catch (err) {
        let error = err as BusinessError;
        console.error(`[${caseName}]: error` + error.code + error.message);
        expect().assertFail();
        done();
      }
      console.log(`[${caseName}]: end`)
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityRunTime_InsightIntentProvider_4900
     * @tc.number SUB_Ability_AbilityRunTime_InsightIntentProvider_4900
     * @tc.desc   Test sendIntentResult with instanceId is -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRunTime_InsightIntentProvider_4900', Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Ability_AbilityRunTime_InsightIntentProvider_4900';
      console.log(`[${caseName}] create`);
      try {
        let result: insightIntent.ExecuteResult = {
          code: 404,
          result: {
            message: 'Nothing',
          }
        };
        insightIntentProvider.sendIntentResult(-1, result).then(()=>{
          try{ expect().assertFail();}catch{}
          done();
        }).catch((err:BusinessError)=>{
          try{expect(err?.code).assertEqual(16000003);}catch{}
          done();
        })
      } catch (err) {
        let error = err as BusinessError;
        console.error(`[${caseName}]: error` + error.code + error.message);
        expect().assertFail();
        done();
      }
      console.log(`[${caseName}]: end`)
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityRunTime_InsightIntentProvider_5000
     * @tc.number SUB_Ability_AbilityRunTime_InsightIntentProvider_5000
     * @tc.desc   Test sendExecuteResult with instanceId is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRunTime_InsightIntentProvider_5000', Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Ability_AbilityRunTime_InsightIntentProvider_5000';
      console.log(`[${caseName}] create`);
      try {
        let result: insightIntent.ExecuteResult = {
          code: 404,
          result: {
            message: 'Nothing',
          }
        };
        insightIntentProvider.sendExecuteResult(undefined, result).then(()=>{
          try{ expect().assertFail();}catch{}
          done();
        }).catch((err:BusinessError)=>{
          try{ expect().assertFail();}catch{}
          done();
        })
      } catch (err) {
        let error = err as BusinessError;
        console.error(`[${caseName}]: error` + error.code + error.message);
        expect(err?.code).assertEqual(401);
        done();
      }
      console.log(`[${caseName}]: end`)
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityRunTime_InsightIntentProvider_5100
     * @tc.number SUB_Ability_AbilityRunTime_InsightIntentProvider_5100
     * @tc.desc   Test sendIntentResult with instanceId is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRunTime_InsightIntentProvider_5100', Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Ability_AbilityRunTime_InsightIntentProvider_5100';
      console.log(`[${caseName}] create`);
      try {
        let result: insightIntent.ExecuteResult = {
          code: 404,
          result: {
            message: 'Nothing',
          }
        };
        insightIntentProvider.sendIntentResult(undefined, result).then(()=>{
          try{ expect().assertFail();}catch{}
          done();
        }).catch((err:BusinessError)=>{
          try{ expect().assertFail();}catch{}
          done();
        })
      } catch (err) {
        let error = err as BusinessError;
        console.error(`[${caseName}]: error` + error.code + error.message);
        expect(err?.code).assertEqual(401);
        done();
      }
      console.log(`[${caseName}]: end`)
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityRunTime_InsightIntentProvider_5200
     * @tc.number SUB_Ability_AbilityRunTime_InsightIntentProvider_5200
     * @tc.desc   Test sendExecuteResult with result is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRunTime_InsightIntentProvider_5200', Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Ability_AbilityRunTime_InsightIntentProvider_5200';
      console.log(`[${caseName}] create`);
      try {
        insightIntentProvider.sendExecuteResult(10010, undefined).then(()=>{
          try{ expect().assertFail();}catch{}
          done();
        }).catch((err:BusinessError)=>{
          console.error(`[${caseName}]: error ` + err.code + err.message);
          try{ expect().assertFail();}catch{}
          done();
        })
      } catch (err) {
        let error = err as BusinessError;
        console.error(`[${caseName}]: catch ` + error.code + error.message);
        expect(error?.code).assertEqual(16000050);
        done();
      }
      console.log(`[${caseName}]: end`)
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityRunTime_InsightIntentProvider_5300
     * @tc.number SUB_Ability_AbilityRunTime_InsightIntentProvider_5300
     * @tc.desc   Test sendIntentResult with result is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRunTime_InsightIntentProvider_5300', Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Ability_AbilityRunTime_InsightIntentProvider_5300';
      console.log(`[${caseName}] create`);
      try {
        insightIntentProvider.sendIntentResult(10010, undefined).then(()=>{
          try{ expect().assertFail();}catch{}
          done();
        }).catch((err:BusinessError)=>{
          console.error(`[${caseName}]: error ` + err.code + err.message);
          try{ expect().assertFail();}catch{}
          done();
        })
      } catch (err) {
        let error = err as BusinessError;
        console.error(`[${caseName}]: catch ` + error.code + error.message);
        expect(error?.code).assertEqual(16000050);
        done();
      }
      console.log(`[${caseName}]: end`)
    })

    /**
     * @tc.name   SUB_Ability_AbilityRunTime_InsightIntentProvider_5400
     * @tc.number SUB_Ability_AbilityRunTime_InsightIntentProvider_5400
     * @tc.desc   Test sendExecuteResult with instanceId is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRunTime_InsightIntentProvider_5400', Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Ability_AbilityRunTime_InsightIntentProvider_5400';
      console.log(`[${caseName}] create`);
      try {
        let result: insightIntent.ExecuteResult = {
          code: 404,
          result: {
            message: 'Nothing',
          }
        };
        insightIntentProvider.sendExecuteResult(null, result).then(()=>{
          try{ expect().assertFail();}catch{}
          done();
        }).catch((err:BusinessError)=>{
          try{ expect().assertFail();}catch{}
          done();
        })
      } catch (err) {
        let error = err as BusinessError;
        console.error(`[${caseName}]: error` + error.code + error.message);
        expect(error?.code).assertEqual(401);
        done();
      }
      console.log(`[${caseName}]: end`)
    })

    /**
     * @tc.name   SUB_Ability_AbilityRunTime_InsightIntentProvider_5500
     * @tc.number SUB_Ability_AbilityRunTime_InsightIntentProvider_5500
     * @tc.desc   Test sendIntentResult with instanceId is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRunTime_InsightIntentProvider_5500', Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Ability_AbilityRunTime_InsightIntentProvider_5500';
      console.log(`[${caseName}] create`);
      try {
        let result: insightIntent.ExecuteResult = {
          code: 404,
          result: {
            message: 'Nothing',
          }
        };
        insightIntentProvider.sendIntentResult(null, result).then(()=>{
          try{ expect().assertFail();}catch{}
          done();
        }).catch((err:BusinessError)=>{
          try{ expect().assertFail();}catch{}
          done();
        })
      } catch (err) {
        let error = err as BusinessError;
        console.error(`[${caseName}]: error` + error.code + error.message);
        expect(error?.code).assertEqual(401);
        done();
      }
      console.log(`[${caseName}]: end`)
    })

    /**
     * @tc.name   SUB_Ability_AbilityRunTime_InsightIntentProvider_5600
     * @tc.number SUB_Ability_AbilityRunTime_InsightIntentProvider_5600
     * @tc.desc   Test sendExecuteResult with result is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRunTime_InsightIntentProvider_5600', Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Ability_AbilityRunTime_InsightIntentProvider_5600';
      console.log(`[${caseName}] create`);
      try {
        insightIntentProvider.sendExecuteResult(10010, null).then(()=>{
          try{ expect().assertFail();}catch{}
          done();
        }).catch((err:BusinessError)=>{
          console.error(`[${caseName}]: error ` + err.code + err.message);
          try{ expect().assertFail();}catch{}
          done();
        })
      } catch (err) {
        let error = err as BusinessError;
        console.error(`[${caseName}]: catch ` + error.code + error.message);
        expect(error?.code).assertEqual(16000050);
        done();
      }
      console.log(`[${caseName}]: end`)
    })

    /**
     * @tc.name   SUB_Ability_AbilityRunTime_InsightIntentProvider_5700
     * @tc.number SUB_Ability_AbilityRunTime_InsightIntentProvider_5700
     * @tc.desc   Test sendIntentResult with result is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRunTime_InsightIntentProvider_5700', Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Ability_AbilityRunTime_InsightIntentProvider_5700';
      console.log(`[${caseName}] create`);
      try {
        insightIntentProvider.sendIntentResult(10010, null).then(()=>{
          try{ expect().assertFail();}catch{}
          done();
        }).catch((err:BusinessError)=>{
          console.error(`[${caseName}]: error ` + err.code + err.message);
          try{ expect().assertFail();}catch{}
          done();
        })
      } catch (err) {
        let error = err as BusinessError;
        console.error(`[${caseName}]: catch ` + error.code + error.message);
        expect(error?.code).assertEqual(16000050);
        done();
      }
      console.log(`[${caseName}]: end`)
    })

  })
}

@InsightIntentEntity({
  entityCategory: 'artist entity category',
  parameters: {
    '$id': '/schemas/ArtistClassDef',
    'type': 'object',
    'description': 'Information about the artist',
    'properties': {
      'country': {
        'type': 'string',
        'description': 'The artist\'s country of origin',
        'default': 'zh'
      },
      'city': {
        'type': 'string',
        'description': 'The artist\'s city of origin'
      },
      'name': {
        'type': 'string',
        'description': 'The name of the artist',
        'minLength': 1
      }
    }
  }
})
export class ArtistClassDef implements insightIntent.IntentEntity {
  public entityId: string = 'id';
  public name: string = '';
}

@InsightIntentEntity({
  entityCategory: 'artist entity category Required',
})
export class ArtistClassOnlyRequired implements insightIntent.IntentEntity {
  public entityId: string = 'id';
  public name: string = '';
}
