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
      setTimeout(() => {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability setTimeout');
        done();
      }, 1000);
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_0100
     * @tc.name   : To verify that the input parameter of addAbilityMonitorSync is undefined(callback).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_0200
     * @tc.name   : To verify that the input parameter of addAbilityMonitorSync is undefined(promise).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_0300
     * @tc.name   : To verify that the input parameter of addAbilityMonitorSync is undefined.
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_0400
     * @tc.name   : To verify that the input parameter of removeAbilityMonitor is undefined(callback).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_0500
     * @tc.name   : To verify that the input parameter of removeAbilityMonitor is undefined(promise).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_0600
     * @tc.name   : To verify that the input parameter of removeAbilityMonitorSync is undefined.
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_0700
     * @tc.name   : To verify that the input parameter of addAbilityStageMonitorSync is undefined.
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_0800
     * @tc.name   : To verify that the input parameter of removeAbilityStageMonitor is undefined(callback).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_0900
     * @tc.name   : To verify that the input parameter of removeAbilityStageMonitor is undefined(promise).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_1000
     * @tc.name   : To verify that the input parameter of removeAbilityStageMonitorSync is undefined.
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_1100
     * @tc.name   : To verify that the input parameter of waitAbilityMonitor is undefined(promise).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_1200
     * @tc.name   : To verify that the input parameter of getAbilityState is undefined.
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_1300
     * @tc.name   : To verify that the input parameter of startAbility is undefined(promise).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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


    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_1400
     * @tc.name   : To verify that the input parameter of startAbility is undefined(callback).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_1500
     * @tc.name   : To verify that the input parameter of doAbilityForeground is undefined(promise).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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


    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_1600
     * @tc.name   : To verify that the input parameter of doAbilityForeground is undefined(callback).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_1700
     * @tc.name   : To verify that the input parameter of doAbilityBackground is undefined(promise).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_1800
     * @tc.name   : To verify that the input parameter of doAbilityBackground is undefined(callback).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_1900
     * @tc.name   : To verify that the input parameter message of finishTest is undefined(promise).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_2000
     * @tc.name   : To verify that the input parameter message of finishTest is undefined(callback).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_2100
     * @tc.name   : To verify that the input parameter code of finishTest is undefined(promise).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_2200
     * @tc.name   : To verify that the input parameter code of finishTest is undefined(callback).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_2300
     * @tc.name   : To verify that the input parameter of addAbilityMonitor is null(callback).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_2400
     * @tc.name   : To verify that the input parameter of addAbilityMonitor is null(promise).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_2500
     * @tc.name   : To verify that the input parameter of addAbilityMonitorSync is null.
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_2600
     * @tc.name   : To verify that the input parameter of removeAbilityMonitor is null(callback).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_2700
     * @tc.name   : To verify that the input parameter of removeAbilityMonitor is null(promise).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_2800
     * @tc.name   : To verify that the input parameter of removeAbilityMonitorSync is null.
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_2900
     * @tc.name   : To verify that the input parameter of addAbilityStageMonitorSync is null.
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_3000
     * @tc.name   : To verify that the input parameter of removeAbilityStageMonitor is null(callback).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_3100
     * @tc.name   : To verify that the input parameter of removeAbilityStageMonitor is null(promise).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_3200
     * @tc.name   : To verify that the input parameter of removeAbilityStageMonitorSync is null.
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_3300
     * @tc.name   : To verify that the input parameter monitor of waitAbilityMonitor is null(promise).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_3500
     * @tc.name   : To verify that the input parameter of startAbility is null(promise).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_3600
     * @tc.name   : To verify that the input parameter of startAbility is null(callback).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_3700
     * @tc.name   : To verify that the input parameter of doAbilityForeground is null(promise).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_3800
     * @tc.name   : To verify that the input parameter of doAbilityForeground is null(callback).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_3900
     * @tc.name   : To verify that the input parameter of doAbilityBackground is null(promise).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_4000
     * @tc.name   : To verify that the input parameter of doAbilityBackground is null(callback).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_4100
     * @tc.name   : To verify that the input parameter message of finishTest is null(promise).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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


    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_4200
     * @tc.name   : To verify that the input parameter message of finishTest is null(callback).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_4300
     * @tc.name   : To verify that the input parameter code of finishTest is null(promise).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_AbilityDelegatorError_4400
     * @tc.name   : To verify that the input parameter code of finishTest is null(callback).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

  })
}

async function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(resolve, time)
  });
}