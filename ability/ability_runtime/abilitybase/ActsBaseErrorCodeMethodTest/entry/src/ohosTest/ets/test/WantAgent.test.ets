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
import ohosWantAgent from '@ohos.wantAgent'
export default function openLinkTest() {
  describe('ActsWantAgentTest', () => {

    let TAG = 'ActsWantAgentTest ===>';
    let WantAgentInfo:wantAgent.WantAgentInfo = {
      wants: [
        {
          bundleName: "com.acts.actswantagentmethodtest",
          abilityName: "EntryAbility",
          action: "action1",
          entities: ["entity1"],
          type: "MIMETYPE",
          uri: "key={true,true,false}",
          parameters:
          {
            myKey0: 2222,
            myKey1: [1, 2, 3],
            myKey2: "[1, 2, 3]",
            myKey3: "notification",
            myKey4: [false, true, false],
            myKey5: ["ANS", "WANT", "AGENT"],
            myKey6: true
          }
        }
      ],
      actionType: wantAgent.OperationType.START_ABILITY,
      requestCode: 0,
      wantAgentFlags: [wantAgent.WantAgentFlags.NO_BUILD_FLAG],
      extraInfo: {
        key: 'WantAgentInfo_test'
      }
    }
    let WantAgentInfoSame:wantAgent.WantAgentInfo = {
      wants: [
        {
          bundleName: "com.acts.actswantagentmethodtest",
          abilityName: "EntryAbility",
          action: "action1",
          entities: ["entity1"],
          type: "MIMETYPE",
          uri: "key={true,true,false}",
          parameters:
          {
            myKey0: 2222,
            myKey1: [1, 2, 3],
            myKey2: "[1, 2, 3]",
            myKey3: "notification",
            myKey4: [false, true, false],
            myKey5: ["ANS", "WANT", "AGENT"],
            myKey6: true
          }
        }
      ],
      actionType: wantAgent.OperationType.START_ABILITY,
      requestCode: 0,
      wantAgentFlags: [wantAgent.WantAgentFlags.NO_BUILD_FLAG],
      extraInfo: {
        key: 'WantAgentInfo_test'
      }
    }

    /**
     * @tc.name   SUB_Ability_AbilityBase_WantAgentError_0100
     * @tc.number SUB_Ability_AbilityBase_WantAgentError_0100
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_WantAgentError_0100', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_WantAgentError_0100 start');
      try {
        wantAgent.getBundleName(undefined,(err, data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_0100 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_WantAgentError_0200
     * @tc.number SUB_Ability_AbilityBase_WantAgentError_0200
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_WantAgentError_0200', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_WantAgentError_0200 start');
      try {
        wantAgent.getBundleName(undefined).then((data)=>{
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
     * @tc.name   SUB_Ability_AbilityBase_WantAgentError_0300
     * @tc.number SUB_Ability_AbilityBase_WantAgentError_0300
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_WantAgentError_0300', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_WantAgentError_0300 start');
      try {
        wantAgent.getUid(undefined,(err, data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_0300 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_WantAgentError_0400
     * @tc.number SUB_Ability_AbilityBase_WantAgentError_0400
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_WantAgentError_0400', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_WantAgentError_0400 start');
      try {
        wantAgent.getUid(undefined).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_0400 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_WantAgentError_0500
     * @tc.number SUB_Ability_AbilityBase_WantAgentError_0500
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_WantAgentError_0500', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_WantAgentError_0500 start');
      try {
        wantAgent.cancel(undefined,(err, data)=>{
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
     * @tc.name   SUB_Ability_AbilityBase_WantAgentError_0600
     * @tc.number SUB_Ability_AbilityBase_WantAgentError_0600
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_WantAgentError_0600', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_WantAgentError_0600 start');
      try {
        wantAgent.cancel(undefined).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_0600 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_WantAgentError_0700
     * @tc.number SUB_Ability_AbilityBase_WantAgentError_0700
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_WantAgentError_0700', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_WantAgentError_0700 start');
      let triggerInfo:wantAgent.TriggerInfo = {
        code: 0,
        want: {
          deviceId: "deviceId",
          bundleName: "com.acts.actswantagentmethodtest",
          abilityName: "EntryAbility",
          action: "action1",
          entities: ["entity1"],
          type: "MIMETYPE",
          uri: "key={true,true,false}",
        },
        permission: '',
        extraInfos: {
          test: 'this is a test value'
        }
      }
      try {
        wantAgent.trigger(undefined, triggerInfo, (err, data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_0700 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }

    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_WantAgentError_0800
     * @tc.number SUB_Ability_AbilityBase_WantAgentError_0800
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_WantAgentError_0800', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_WantAgentError_0800 start');
      try {
        wantAgent.trigger(WantAgentInfo, undefined, (err, data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_0800 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_WantAgentError_0900
     * @tc.number SUB_Ability_AbilityBase_WantAgentError_0900
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_WantAgentError_0900', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_WantAgentError_0900 start');
      try {
        wantAgent.equal(undefined, WantAgentInfoSame, (err, data)=>{
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
     * @tc.name   SUB_Ability_AbilityBase_WantAgentError_1000
     * @tc.number SUB_Ability_AbilityBase_WantAgentError_1000
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_WantAgentError_1000', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_WantAgentError_1000 start');
      try {
        wantAgent.equal(undefined, WantAgentInfoSame).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_1000 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_WantAgentError_1100
     * @tc.number SUB_Ability_AbilityBase_WantAgentError_1100
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_WantAgentError_1100', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_WantAgentError_1100 start');
      try {
        wantAgent.equal(WantAgentInfo, undefined, (err, data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_1100 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_WantAgentError_1200
     * @tc.number SUB_Ability_AbilityBase_WantAgentError_1200
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_WantAgentError_1200', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_WantAgentError_1200 start');
      try {
        wantAgent.equal(WantAgentInfo, undefined).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_1200 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_WantAgentError_1300
     * @tc.number SUB_Ability_AbilityBase_WantAgentError_1300
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_WantAgentError_1300', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_WantAgentError_1300 start');
      try {
        wantAgent.getWantAgent(undefined, (err, data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_1300 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }

    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_WantAgentError_1400
     * @tc.number SUB_Ability_AbilityBase_WantAgentError_1400
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_WantAgentError_1400', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_WantAgentError_1400 start');
      try {
        wantAgent.getWantAgent(undefined).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_1400 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_WantAgentError_1500
     * @tc.number SUB_Ability_AbilityBase_WantAgentError_1500
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_WantAgentError_1500', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_WantAgentError_1500 start');
      try {
        wantAgent.getOperationType(undefined, (err, data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_1500 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }

    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_WantAgentError_1600
     * @tc.number SUB_Ability_AbilityBase_WantAgentError_1600
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_WantAgentError_1600', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_WantAgentError_1600 start');
      try {
        wantAgent.getOperationType(undefined).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_1600 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_WantAgentError_1700
     * @tc.number SUB_Ability_AbilityBase_WantAgentError_1700
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_WantAgentError_1700', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_WantAgentError_0100 start');
      try {
        wantAgent.getBundleName(null,(err, data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_1700 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_WantAgentError_1800
     * @tc.number SUB_Ability_AbilityBase_WantAgentError_1800
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_WantAgentError_1800', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_WantAgentError_1800 start');
      try {
        wantAgent.getBundleName(null).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_1800 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_WantAgentError_1900
     * @tc.number SUB_Ability_AbilityBase_WantAgentError_1900
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_WantAgentError_1900', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_WantAgentError_1900 start');
      try {
        wantAgent.getUid(null,(err, data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_1900 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }

    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_WantAgentError_2000
     * @tc.number SUB_Ability_AbilityBase_WantAgentError_2000
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_WantAgentError_2000', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_WantAgentError_2000 start');
      try {
        wantAgent.getUid(null).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_2000 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_WantAgentError_2100
     * @tc.number SUB_Ability_AbilityBase_WantAgentError_2100
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_WantAgentError_2100', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_WantAgentError_2100 start');
      try {
        wantAgent.cancel(null,(err, data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_2100 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }

    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_WantAgentError_2200
     * @tc.number SUB_Ability_AbilityBase_WantAgentError_2200
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_WantAgentError_2200', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_WantAgentError_2200 start');
      try {
        wantAgent.cancel(null).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_2200 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_WantAgentError_2300
     * @tc.number SUB_Ability_AbilityBase_WantAgentError_2300
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_WantAgentError_2300', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_WantAgentError_2300 start');
      let triggerInfo:wantAgent.TriggerInfo = {
        code: 0,
        want: {
          deviceId: "deviceId",
          bundleName: "com.acts.actswantagentmethodtest",
          abilityName: "EntryAbility",
          action: "action1",
          entities: ["entity1"],
          type: "MIMETYPE",
          uri: "key={true,true,false}",
        },
        permission: '',
        extraInfos: {
          test: 'this is a test value'
        }
      }
      try {
        wantAgent.trigger(null, triggerInfo, (err, data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_2300 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_WantAgentError_2400
     * @tc.number SUB_Ability_AbilityBase_WantAgentError_2400
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_WantAgentError_2400', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_WantAgentError_2400 start');
      try {
        wantAgent.trigger(WantAgentInfo, null, (err, data)=>{
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
     * @tc.name   SUB_Ability_AbilityBase_WantAgentError_2500
     * @tc.number SUB_Ability_AbilityBase_WantAgentError_2500
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_WantAgentError_2500', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_WantAgentError_2500 start');
      try {
        wantAgent.equal(null, WantAgentInfoSame, (err, data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_2500 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }

    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_WantAgentError_2600
     * @tc.number SUB_Ability_AbilityBase_WantAgentError_2600
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_WantAgentError_2600', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_WantAgentError_2600 start');
      try {
        wantAgent.equal(null, WantAgentInfoSame).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_2600 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_WantAgentError_2700
     * @tc.number SUB_Ability_AbilityBase_WantAgentError_2700
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_WantAgentError_2700', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_WantAgentError_2700 start');
      try {
        wantAgent.equal(WantAgentInfo, null, (err, data)=>{
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
     * @tc.name   SUB_Ability_AbilityBase_WantAgentError_2800
     * @tc.number SUB_Ability_AbilityBase_WantAgentError_2800
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_WantAgentError_2800', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_WantAgentError_2800 start');
      try {
        wantAgent.equal(WantAgentInfo, null).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_2800 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_WantAgentError_2900
     * @tc.number SUB_Ability_AbilityBase_WantAgentError_2900
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_WantAgentError_2900', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_WantAgentError_2900 start');
      try {
        wantAgent.getWantAgent(null, (err, data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_2900 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_WantAgentError_3000
     * @tc.number SUB_Ability_AbilityBase_WantAgentError_3000
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_WantAgentError_3000', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_WantAgentError_3000 start');
      try {
        wantAgent.getWantAgent(null).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_3000 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_WantAgentError_3100
     * @tc.number SUB_Ability_AbilityBase_WantAgentError_3100
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_WantAgentError_3100', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_WantAgentError_3100 start');
      try {
        wantAgent.getOperationType(null, (err, data)=>{
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
     * @tc.name   SUB_Ability_AbilityBase_WantAgentError_3200
     * @tc.number SUB_Ability_AbilityBase_WantAgentError_3200
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_WantAgentError_3200', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_WantAgentError_3200 start');
      try {
        wantAgent.getOperationType(null).then((data)=>{
          try{expect().assertFail();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_3200 ${err?.code}`);
        try{expect(err?.code).assertEqual(401);}catch(e){}
        done();
      }
    })

   /**
    * @tc.name   SUB_Ability_AbilityBase_WantAgentError_3300
    * @tc.number SUB_Ability_AbilityBase_WantAgentError_3300
    * @tc.desc   Expect: call failed
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('SUB_Ability_AbilityBase_WantAgentError_3300', Level.LEVEL0, async (done: Function) => {
    hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_WantAgentError_3300 start');
    let triggerInfo: wantAgent.TriggerInfo = {
      code: 0,
      want: {
        deviceId: "deviceId",
        bundleName: "com.acts.actswantagentmethodtest",
        abilityName: "EntryAbility",
        action: "action1",
        entities: ["entity1"],
        type: "MIMETYPE",
        uri: "key={true,true,false}",
      },
      permission: '',
      extraInfos: {
        test: 'this is a test value'
      }
    }
    try {
      wantAgent.trigger(undefined, triggerInfo)
    } catch (err) {
      hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_3300 ${err?.code}`);
      try { expect(err?.code).assertEqual(401); } catch (e) { }
      done();
    }
  })

  /**
   * @tc.name   SUB_Ability_AbilityBase_WantAgentError_3400
   * @tc.number SUB_Ability_AbilityBase_WantAgentError_3400
   * @tc.desc   Expect: call failed
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_Ability_AbilityBase_WantAgentError_3400', Level.LEVEL0, async (done: Function) => {
    hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_WantAgentError_3400 start');
    let triggerInfo: wantAgent.TriggerInfo = {
      code: 0,
      want: {
        deviceId: "deviceId",
        bundleName: "com.acts.actswantagentmethodtest",
        abilityName: "EntryAbility",
        action: "action1",
        entities: ["entity1"],
        type: "MIMETYPE",
        uri: "key={true,true,false}",
      },
      permission: '',
      extraInfos: {
        test: 'this is a test value'
      }
    }
    try {
      ohosWantAgent.trigger(undefined, triggerInfo)
    } catch (err) {
      hilog.info(0x0000, `${TAG}`, '%{public}s', `SUB_Ability_AbilityBase_WantAgentError_3400 ${err?.code}`);
      try { expect(err?.code).assertEqual(401); } catch (e) { }
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
