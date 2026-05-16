/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
// 加载js测试框架
import { common, sendableContextManager, WantAgent, wantAgent } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';


let context = getContext(this) as common.UIAbilityContext;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator
export default function openLinkTest() {
  describe('AbilityDelegatorTest', () => {

    let TAG = 'ActsWantAgentTest ===>';

    beforeAll(() => {
      context = globalThis.context;
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    });
    afterEach((done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'Ability afterEach');
      done();
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_0100
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_0100
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_0100', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_0100 start');
      try {
        abilityDelegator.addAbilityMonitor(undefined,(err, data)=>{
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_0100 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_0100 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_0200
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_0200
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_0200', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'Ability setTimeout');
      try {
        abilityDelegator.addAbilityMonitor(undefined).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_0200 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_0300
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_0300
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_0300', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'Ability setTimeout');
      try {
        abilityDelegator.addAbilityMonitorSync(undefined);
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_0300 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_0400
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_0400
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_0400', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_0400 start');
      try {
        abilityDelegator.removeAbilityMonitor(undefined,(err, data)=>{
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_0400 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_0400 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_0500
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_0500
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_0500', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_0500 start');
      try {
        abilityDelegator.removeAbilityMonitor(undefined).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_0500 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_0600
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_0600
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_0600', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_0600 start');
      try {
        abilityDelegator.removeAbilityMonitorSync(undefined);
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_0600 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_0700
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_0700
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_0700', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_0700 start');
      try {
        abilityDelegator.addAbilityStageMonitorSync(undefined);
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_0700 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_0800
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_0800
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_0800', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_0800 start');
      try {
        abilityDelegator.removeAbilityStageMonitor(undefined,(err, data)=>{
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_0800 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_0800 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_0900
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_0900
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_0900', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_0900 start');
      try {
        abilityDelegator.removeAbilityStageMonitor(undefined).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_0900 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_1000
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_1000
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_1000', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_1000 start');
      try {
        abilityDelegator.removeAbilityStageMonitorSync(undefined);
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_1000 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_1100
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_1100
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_1100', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_1100 start');
      try {
        abilityDelegator.waitAbilityMonitor(undefined, 5).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_1100 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_1200
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_1200
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_1200', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_1200 start');
      try {
        let state = abilityDelegator.getAbilityState(undefined);
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_1200 ${state}`);
        expect(state).assertEqual(undefined)
        done();
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_1200 ${err?.code}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_1300
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_1300
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_1300', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_1300 start');
      try {
        abilityDelegator.startAbility(undefined).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_1300 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })


    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_1400
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_1400
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_1400', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'Ability setTimeout');
      try {
        abilityDelegator.startAbility(undefined, (err, data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_1400 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_1500
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_1500
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_1500', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_1500 start');
      try {
        abilityDelegator.doAbilityForeground(undefined).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_1500 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })


    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_1600
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_1600
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_1600', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_1600 start');
      try {
        abilityDelegator.doAbilityForeground(undefined, (err, data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_1600 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_1700
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_1700
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_1700', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_1700 start');
      try {
        abilityDelegator.doAbilityBackground(undefined).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_1700 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_1800
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_1800
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_1800', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_1800 start');
      try {
        abilityDelegator.doAbilityBackground(undefined, (err, data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_1800 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_1900
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_1900
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_1900', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_1900 start');
      try {
        abilityDelegator.finishTest(undefined, 101).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_1900 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_2000
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_2000
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_2000', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_2000 start');
      try {
        abilityDelegator.finishTest(undefined, 101, (err, data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_2000 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_2100
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_2100
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_2100', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_2100 start');
      try {
        abilityDelegator.finishTest("FINISH TEST", undefined).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_2100 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_2200
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_2200
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_2200', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_2200 start');
      try {
        abilityDelegator.finishTest("FINISH TEST", undefined, (err, data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_2200 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_2300
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_2300
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_2300', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_2300 start');
      try {
        abilityDelegator.addAbilityMonitor(null,(err, data)=>{
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_2300 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_2300 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }

    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_2400
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_2400
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_2400', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_2400 start');
      try {
        abilityDelegator.addAbilityMonitor(null).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_2400 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_2500
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_2500
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_2500', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_2500 start');
      try {
        abilityDelegator.addAbilityMonitorSync(null);
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_2500 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_2600
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_2600
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_2600', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_2600 start');
      try {
        abilityDelegator.removeAbilityMonitor(null,(err, data)=>{
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_2600 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_2600 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_2700
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_2700
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_2700', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_2700 start');
      try {
        abilityDelegator.removeAbilityMonitor(null).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_2700 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_2800
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_2800
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_2800', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_2800 start');
      try {
        abilityDelegator.removeAbilityMonitorSync(null);
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_2800 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_2900
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_2900
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_2900', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_2900 start');
      try {
        abilityDelegator.addAbilityStageMonitorSync(null);
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_2900 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_3000
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_3000
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_3000', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_3000 start');
      try {
        abilityDelegator.removeAbilityStageMonitor(null,(err, data)=>{
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_3000 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_3000 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }

    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_3100
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_3100
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_3100', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_3100 start');
      try {
        abilityDelegator.removeAbilityStageMonitor(null).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_3100 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_3200
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_3200
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_3200', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_3200 start');
      try {
        abilityDelegator.removeAbilityStageMonitorSync(null);
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_3200 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_3300
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_3300
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_3300', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_3300 start');
      try {
        abilityDelegator.waitAbilityMonitor(null, 5).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_3300 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_3500
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_3500
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_3500', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_3500 start');
      try {
        abilityDelegator.startAbility(null).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_3500 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_3600
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_3600
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_3600', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_3600 start');
      try {
        abilityDelegator.startAbility(null, (err, data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_3600 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_3700
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_3700
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_3700', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_3700 start');
      try {
        abilityDelegator.doAbilityForeground(null).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_3700 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_3800
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_3800
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_3800', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_3800 start');
      try {
        abilityDelegator.doAbilityForeground(null, (err, data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_3800 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_3900
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_3900
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_3900', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_3900 start');
      try {
        abilityDelegator.doAbilityBackground(null).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_3900 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_4000
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_4000
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_4000', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_4000 start');
      try {
        abilityDelegator.doAbilityBackground(null, (err, data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_4000 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_4100
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_4100
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_4100', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_4100 start');
      try {
        abilityDelegator.finishTest(null, 101).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_4100 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })


    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_4200
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_4200
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_4200', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_4200 start');
      try {
        abilityDelegator.finishTest(null, 101, (err, data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_4200 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_4300
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_4300
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_4300', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_4300 start');
      try {
        abilityDelegator.finishTest("FINISH TEST", null).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_4300 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_4400
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_4400
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_4400', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_4400 start');
      try {
        abilityDelegator.finishTest("FINISH TEST", null, (err, data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_4400 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_4500
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_4500
     * @tc.desc   Test addAbilityStageMonitor with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_4500', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_4500 start');
      try {
        abilityDelegator.addAbilityStageMonitor(null);
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_4500 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_4501
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_4501
     * @tc.desc   Test addAbilityStageMonitor with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_4501', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_4501 start');
      try {
        abilityDelegator.addAbilityStageMonitor(undefined);
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_4501 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_4502
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_4502
     * @tc.desc   Test addAbilityStageMonitor with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_4502', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_4502 start');
      try {
        abilityDelegator.addAbilityStageMonitor(null, (err, data)=>{
          expect().assertFail();
          done();
        });
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_4502 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_4503
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_4503
     * @tc.desc   Test addAbilityStageMonitor with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_4503', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_4503 start');
      try {
        abilityDelegator.addAbilityStageMonitor(undefined, (err, data)=>{
          expect().assertFail();
          done();
        });
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_4503 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_4600
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_4600
     * @tc.desc   Test waitAbilityMonitor with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_4600', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_4600 start');
      try {
        abilityDelegator.waitAbilityMonitor(undefined, 5).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_4600 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_4700
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_4700
     * @tc.desc   Test waitAbilityStageMonitor with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_4700', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_4700 start');
      try {
        abilityDelegator.waitAbilityStageMonitor(null, 5).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_4700 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_4800
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_4800
     * @tc.desc   Test waitAbilityStageMonitor with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_4800', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_4800 start');
      try {
        abilityDelegator.waitAbilityStageMonitor(undefined, 5).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_4800 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_5300
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_5300
     * @tc.desc   Test executeShellCommand with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_5300', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_5300 start');
      try {
        abilityDelegator.executeShellCommand(null, 1).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_5300 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_5400
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_5400
     * @tc.desc   Test executeShellCommand with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_5400', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_5400 start');
      try {
        abilityDelegator.executeShellCommand(undefined, 1).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_5400 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    
    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_5500
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_5500
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_5500', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_5500 start');
      try {
        abilityDelegator.waitAbilityMonitor(null, 5, (err)=>{
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_5500 ${err?.code}`);
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_5500 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_5600
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_5600
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_5600', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_5600 start');
      try {
        abilityDelegator.waitAbilityMonitor(undefined, 5, (err, data)=>{
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_5600 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_5600 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_5700
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_5700
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_5700', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_5700 start');
      try {
        abilityDelegator.waitAbilityMonitor(null, undefined, (err, data)=>{
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_5700 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_5700 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_5800
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_5800
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_5800', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_5800 start');
      try {
        abilityDelegator.waitAbilityMonitor(null, null, (err, data)=>{
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_5800 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_5800 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    
    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_5900
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_5900
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_5900', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_5900 start');
      try {
        abilityDelegator.waitAbilityStageMonitor(null, 5, (err)=>{
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_5900 ${err?.code}`);
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_5900 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_6000
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_6000
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_6000', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_6000 start');
      try {
        abilityDelegator.waitAbilityStageMonitor(undefined, 5, (err, data)=>{
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_6000 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_6000 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_6100
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_6100
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_6100', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_6100 start');
      try {
        abilityDelegator.waitAbilityStageMonitor(null, undefined, (err, data)=>{
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_6100 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_6100 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_6200
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_6200
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_6200', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_6200 start');
      try {
        abilityDelegator.waitAbilityStageMonitor(null, null, (err, data)=>{
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_6200 ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_6200 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_6500
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_6500
     * @tc.desc   Test executeShellCommand with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_6500', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_6500 start');
      try {
        abilityDelegator.executeShellCommand(null, 1, (err, data)=>{
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_6500 ${err?.code}` + JSON.stringify(data));
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_6500 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    
    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_6600
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_6600
     * @tc.desc   Test executeShellCommand with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_6600', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_6600 start');
      try {
        abilityDelegator.executeShellCommand(undefined, 1, (err, data)=>{
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_6600 ${err?.code}` + JSON.stringify(data));
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_6600 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_6700
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_6700
     * @tc.desc   Test executeShellCommand with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_6700', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_6700 start');
      try {
        abilityDelegator.executeShellCommand("", 1, (err, data)=>{
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_6700 ${err?.code}`);
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_6700 ` + JSON.stringify(data));
          try{expect(err?.code).assertEqual(16000100);}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_6700 ${err?.code}`);
        try{expect().assertFail();}catch(e){}
        done();
      }
    })

    
    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_6800
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_6800
     * @tc.desc   Test executeShellCommand with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_6800', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_6800 start');
      try {
        abilityDelegator.executeShellCommand("aa dump", undefined, (err, data)=>{
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_6800 ${err?.code}`);
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_6800 ` + JSON.stringify(data));
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_6800 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_6900
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_6900
     * @tc.desc   Test executeShellCommand with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_6900', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_6900 start');
      try {
        abilityDelegator.executeShellCommand("aa dump", null, (err, data)=>{
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_6900 ${err?.code}`);
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_6900 ` + JSON.stringify(data));
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_6900 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_7000
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_7000
     * @tc.desc   Test executeShellCommand with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_7000', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_7000 start');
      try {
        abilityDelegator.executeShellCommand("", 1).then((data)=>{
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_7000 ` + JSON.stringify(data));
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_7000 ` + JSON.stringify(err));
          try{expect(err?.code).assertEqual(16000100);}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_7000 ${err?.code}`);
        try{expect().assertFail();}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_7100
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_7100
     * @tc.desc   Test executeShellCommand with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_7100', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_7100 start');
      try {
        abilityDelegator.executeShellCommand("", (err, data)=>{
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_7100 ${err?.code} ` + JSON.stringify(data));
          try{expect(err?.code).assertEqual(16000100);}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_7100 ${err?.code}`);
        try{expect().assertFail();}catch(e){}
        done();
      }
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_7200
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_7200
     * @tc.desc   Test executeShellCommand with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_7200', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_7200 start');
      try {
        abilityDelegator.executeShellCommand(null, (err, data)=>{
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_7200 ${err?.code} ` + JSON.stringify(data));
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_7200 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    
    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_7300
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_7300
     * @tc.desc   Test executeShellCommand with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_7300', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_7300 start');
      try {
        abilityDelegator.executeShellCommand(undefined, (err, data)=>{
          hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_7300 ${err?.code} ` + JSON.stringify(data));
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_7300 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_7600
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_7600
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_7600', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_7600 start');
      try {
        abilityDelegator.finishTest(undefined, 101).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_4100 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })


    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityDelegatorError_7800
     * @tc.number SUB_Ability_AbilityBase_AbilityDelegatorError_7800
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityDelegatorError_7800', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_AbilityDelegatorError_7800 start');
      try {
        abilityDelegator.finishTest(undefined, 101, (err, data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_AbilityDelegatorError_7800 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

  })
}

async function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(resolve, time)
  });
}