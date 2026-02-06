/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import { common, Want } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import { commonEventManager } from '@kit.BasicServicesKit';
import { JSON } from '@kit.ArkTS';

let testContext: common.UIAbilityContext;
let supportSpecifiedProcess: boolean = false;
let supportSceneBoard: boolean = false;

const DOMAIN = 0x0000;
const LOG_TAG = 'START_SPECIFIED_ABILITY_TEST';

const demo1BundleName = 'com.acts.ability.specifiedability.demo1';
const demo2BundleName = 'com.acts.ability.specifiedability.demo2';
const demo3BundleName = 'com.acts.ability.specifiedability.demo3';

let demo1Entry: Want = {
  bundleName: demo1BundleName,
  abilityName: 'EntryAbility',
}

let demo2Entry: Want = {
  bundleName: demo2BundleName,
  abilityName: 'EntryAbility',
}

let demo3Entry: Want = {
  bundleName: demo3BundleName,
  abilityName: 'EntryAbility',
}

let noSpecifiedWant: Want = {
  bundleName: demo2BundleName,
  abilityName: 'NoSpecifiedAbility',
};

let sleep = async (millis: number) => {
  return new Promise<void>(resolve => setTimeout(resolve, millis));
}

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async (done: Function) => {
      try {
        const ability = await abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility()
        testContext = ability.context;
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "get context failed: " + JSON.stringify(err))
        try { expect().assertFail(); } catch (err) {}
      }
      try {
        let dumpRet = await abilityDelegatorRegistry.getAbilityDelegator().executeShellCommand('aa dump -r');
        hilog.info(DOMAIN, LOG_TAG, 'aa dump ret: %{public}s', JSON.stringify(dumpRet));
        if (dumpRet.stdResult.includes('com.ohos.sceneboard')) {
          supportSceneBoard = true;
        }
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, 'getBundleInfo failed: %{public}s', JSON.stringify(err));
      }

      let isSpecifiedProcessSupported = systemParameterEnhance.getSync('persist.sys.abilityms.start_specified_process', 'false');
      hilog.info(DOMAIN, LOG_TAG, 'isSpecifiedProcessSupported: %{public}s', isSpecifiedProcessSupported);
      if (isSpecifiedProcessSupported === 'true') {
        supportSpecifiedProcess = true;
      }
      done();
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async (done: Function) => {
      await sleep(1000);
      done();
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSpecifiedAbility_0100
     * @tc.number SUB_Ability_AbilityRuntime_StartSpecifiedAbility_0100
     * @tc.desc   Expect: start success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartSpecifiedAbility_0100', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_StartSpecifiedAbility_0100';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");

      let subscriber = commonEventManager.createSubscriberSync({
        events: ['StartSpecifiedAbility_OnAcceptWant', 'StartSpecifiedAbility_OnCreate',
          'StartSpecifiedAbility_Exit']
      });

      let acceptWantDone = false;
      let createDone = false;
      commonEventManager.subscribe(subscriber, (err, data) => {
        if (data?.event === 'StartSpecifiedAbility_OnAcceptWant') {
          acceptWantDone = true;
        } else if (data?.event === 'StartSpecifiedAbility_OnCreate') {
          if (acceptWantDone === false) {
            try { expect().assertFail(); } catch (err) {}
            done();
          }
          createDone = true;
        } else if (data?.event === 'StartSpecifiedAbility_Exit') {
          commonEventManager.unsubscribe(subscriber);
          try {
            expect(acceptWantDone).assertTrue();
            expect(createDone).assertTrue();
          } catch (err) {}
          done();
        }
      });

      try {
        await testContext.startAbility(demo1Entry);
      } catch (err) {
        commonEventManager.unsubscribe(subscriber);
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSpecifiedAbility_0200
     * @tc.number SUB_Ability_AbilityRuntime_StartSpecifiedAbility_0200
     * @tc.desc   Expect: start success twice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartSpecifiedAbility_0200', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_StartSpecifiedAbility_0200';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");

      if (supportSceneBoard === false) {
        done();
        return;
      }

      let subscriber = commonEventManager.createSubscriberSync({
        events: ['StartSpecifiedAbility_OnAcceptWant', 'StartSpecifiedAbility_OnCreate',
          'StartSpecifiedAbility_OnNewWant', 'StartSpecifiedAbility_Exit']
      });

      let acceptWantDone = 0;
      let createDone = false;
      let newWantDone = false;
      commonEventManager.subscribe(subscriber, (err, data) => {
        if (data?.event === 'StartSpecifiedAbility_OnAcceptWant') {
          acceptWantDone++;
        } else if (data?.event === 'StartSpecifiedAbility_OnCreate') {
          if (acceptWantDone === 0) {
            try { expect().assertFail(); } catch (err) {}
            done();
          }
          createDone = true;
        } else if (data?.event === 'StartSpecifiedAbility_OnNewWant') {
          newWantDone = true;
        } else if (data?.event === 'StartSpecifiedAbility_Exit') {
          commonEventManager.unsubscribe(subscriber);
          try {
            expect(acceptWantDone).assertEqual(2);
            expect(createDone).assertTrue();
            expect(newWantDone).assertTrue();
          } catch (err) {}
          done();
        }
      });

      try {
        await testContext.startAbility(demo1Entry);
        await testContext.startAbility(demo1Entry);
      } catch (err) {
        commonEventManager.unsubscribe(subscriber);
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSpecifiedAbility_0300
     * @tc.number SUB_Ability_AbilityRuntime_StartSpecifiedAbility_0300
     * @tc.desc   Expect: start success twice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartSpecifiedAbility_0300', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_StartSpecifiedAbility_0300';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");

      if (supportSceneBoard === false) {
        done();
        return;
      }

      let subscriber = commonEventManager.createSubscriberSync({
        events: ['StartSpecifiedAbility_OnAcceptWant', 'StartSpecifiedAbility_OnCreate',
          'StartSpecifiedAbility_OnNewWant', 'StartSpecifiedAbility_Exit']
      });

      let acceptWantDone = 0;
      let createDone = false;
      let newWantDone = false;
      commonEventManager.subscribe(subscriber, (err, data) => {
        if (data?.event === 'StartSpecifiedAbility_OnAcceptWant') {
          acceptWantDone++;
        } else if (data?.event === 'StartSpecifiedAbility_OnCreate') {
          try { expect(acceptWantDone).assertEqual(1); } catch (err) {}
          createDone = true;
          try { testContext.startAbility(demo1Entry); } catch (err) {
            hilog.info(DOMAIN, LOG_TAG, tag + " startAbility failed:" + JSON.stringify(err));
          }
        } else if (data?.event === 'StartSpecifiedAbility_OnNewWant') {
          newWantDone = true;
        } else if (data?.event === 'StartSpecifiedAbility_Exit') {
          commonEventManager.unsubscribe(subscriber);
          try {
            expect(acceptWantDone).assertEqual(2);
            expect(createDone).assertTrue();
            expect(newWantDone).assertTrue();
          } catch (err) {}
          done();
        }
      });

      try {
        await testContext.startAbility(demo1Entry);
      } catch (err) {
        commonEventManager.unsubscribe(subscriber);
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSpecifiedAbility_0400
     * @tc.number SUB_Ability_AbilityRuntime_StartSpecifiedAbility_0400
     * @tc.desc   Expect: start two instances success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartSpecifiedAbility_0400', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_StartSpecifiedAbility_0400';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");

      if (supportSceneBoard === false) {
        done();
        return;
      }

      let subscriber = commonEventManager.createSubscriberSync({
        events: ['StartSpecifiedAbility_OnAcceptWant', 'StartSpecifiedAbility_OnCreate',
          'StartSpecifiedAbility_Exit']
      });

      let acceptWantDone = 0;
      let createDone = 0;
      let destroyDone = 0;
      commonEventManager.subscribe(subscriber, (err, data) => {
        if (data?.event === 'StartSpecifiedAbility_OnAcceptWant') {
          acceptWantDone++;
        } else if (data?.event === 'StartSpecifiedAbility_OnCreate') {
          if (acceptWantDone === 0) {
            try { expect().assertFail(); } catch (err) {}
            done();
          }
          createDone++;
        } else if (data?.event === 'StartSpecifiedAbility_Exit') {
          destroyDone++;
          if (destroyDone === 2) {
            commonEventManager.unsubscribe(subscriber);
            try {
              expect(acceptWantDone).assertEqual(2);
              expect(createDone).assertEqual(2);
            } catch (err) {}
            done();
          }
        }
      });

      try {
        await testContext.startAbility(demo1Entry);
        await testContext.startAbility({
          bundleName: demo1BundleName,
          abilityName: 'EntryAbility',
          parameters: {
            flag: 'newInstance1'
          }
        });
      } catch (err) {
        commonEventManager.unsubscribe(subscriber);
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSpecifiedAbility_0500
     * @tc.number SUB_Ability_AbilityRuntime_StartSpecifiedAbility_0500
     * @tc.desc   Expect: start two instances success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartSpecifiedAbility_0500', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_StartSpecifiedAbility_0500';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");

      let subscriber = commonEventManager.createSubscriberSync({
        events: ['StartSpecifiedAbility_OnAcceptWant', 'StartSpecifiedAbility_OnCreate',
          'StartSpecifiedAbility_Exit']
      });

      let acceptWantDone = 0;
      let createDone = 0;
      let destroyDone = 0;
      commonEventManager.subscribe(subscriber, (err, data) => {
        if (data?.event === 'StartSpecifiedAbility_OnAcceptWant') {
          acceptWantDone++;
        } else if (data?.event === 'StartSpecifiedAbility_OnCreate') {
          if (acceptWantDone === 0) {
            try { expect().assertFail(); } catch (err) {}
            done();
          }
          createDone++;
          if (createDone === 1) {
            testContext.startAbility({
              bundleName: demo1BundleName,
              abilityName: 'EntryAbility',
              parameters: {
                flag: 'newInstance1'
              }
            });
          }
        } else if (data?.event === 'StartSpecifiedAbility_Exit') {
          destroyDone++;
          if (destroyDone === 2) {
            commonEventManager.unsubscribe(subscriber);
            try {
              expect(acceptWantDone).assertEqual(2);
              expect(createDone).assertEqual(2);
            } catch (err) {}
            done();
          }
        }
      });

      try {
        await testContext.startAbility(demo1Entry);
      } catch (err) {
        commonEventManager.unsubscribe(subscriber);
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSpecifiedAbility_0600
     * @tc.number SUB_Ability_AbilityRuntime_StartSpecifiedAbility_0600
     * @tc.desc   Expect: start two abilities success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartSpecifiedAbility_0600', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_StartSpecifiedAbility_0600';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");

      let subscriber = commonEventManager.createSubscriberSync({
        events: ['StartSpecifiedAbility_OnAcceptWant', 'StartSpecifiedAbility_OnCreate',
          'StartSpecifiedAbility_Exit', 'SecondAbility_OnCreate']
      });

      let acceptWantDone = 0;
      let entryCreate = false;
      let destroyDone = 0;
      let secondCreate = false;
      commonEventManager.subscribe(subscriber, (err, data) => {
        if (data?.event === 'StartSpecifiedAbility_OnAcceptWant') {
          acceptWantDone++;
        } else if (data?.event === 'StartSpecifiedAbility_OnCreate') {
          entryCreate = true;
        } else if (data?.event === 'SecondAbility_OnCreate') {
          secondCreate = true;
        } else if (data?.event === 'StartSpecifiedAbility_Exit') {
          destroyDone++;
          if (destroyDone === 2) {
            commonEventManager.unsubscribe(subscriber);
            try {
              expect(acceptWantDone).assertEqual(2);
              expect(entryCreate).assertTrue();
              expect(secondCreate).assertTrue();
            } catch (err) {}
            done();
          }
        }
      });

      try {
        await testContext.startAbility(demo1Entry);
        await testContext.startAbility({
          bundleName: demo1BundleName,
          abilityName: 'SecondAbility',
        });
      } catch (err) {
        commonEventManager.unsubscribe(subscriber);
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSpecifiedAbility_0700
     * @tc.number SUB_Ability_AbilityRuntime_StartSpecifiedAbility_0700
     * @tc.desc   Expect: start two abilities success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartSpecifiedAbility_0700', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_StartSpecifiedAbility_0700';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");

      if (supportSceneBoard === false) {
        done();
        return;
      }

      let subscriber = commonEventManager.createSubscriberSync({
        events: ['StartSpecifiedAbility_OnAcceptWant', 'StartSpecifiedAbility_OnCreate',
          'StartSpecifiedAbility_Exit', 'SecondAbility_OnCreate', 'StartSpecifiedAbility_OnNewWant']
      });

      let acceptWantDone = 0;
      let entryCreate = false;
      let destroyDone = 0;
      let secondCreate = false;
      let newWantDone = false;
      commonEventManager.subscribe(subscriber, (err, data) => {
        if (data?.event === 'StartSpecifiedAbility_OnAcceptWant') {
          acceptWantDone++;
        } else if (data?.event === 'StartSpecifiedAbility_OnCreate') {
          entryCreate = true;
          testContext.startAbility({
            bundleName: demo1BundleName,
            abilityName: 'SecondAbility',
          });
          testContext.startAbility(demo1Entry);
        } else if (data?.event === 'SecondAbility_OnCreate') {
          secondCreate = true;
        } else if (data?.event === 'StartSpecifiedAbility_OnNewWant') {
          newWantDone = true;
        } else if (data?.event === 'StartSpecifiedAbility_Exit') {
          destroyDone++;
          if (destroyDone === 2) {
            commonEventManager.unsubscribe(subscriber);
            try {
              expect(acceptWantDone).assertEqual(3);
              expect(entryCreate).assertTrue();
              expect(secondCreate).assertTrue();
              expect(newWantDone).assertTrue();
            } catch (err) {}
            done();
          }
        }
      });

      try {
        await testContext.startAbility(demo1Entry);
      } catch (err) {
        commonEventManager.unsubscribe(subscriber);
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSpecifiedAbility_0800
     * @tc.number SUB_Ability_AbilityRuntime_StartSpecifiedAbility_0800
     * @tc.desc   Expect: start success both
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartSpecifiedAbility_0800', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_StartSpecifiedAbility_0800';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");

      if (supportSceneBoard === false) {
        done();
        return;
      }

      let subscriber = commonEventManager.createSubscriberSync({
        events: ['StartSpecifiedAbility_OnAcceptWant', 'StartSpecifiedAbility_OnCreate',
          'StartSpecifiedAbility_Exit', 'demo2_acceptWant', 'demo2_entry_onCreate']
      });

      let demo1AcceptWant = false;
      let demo1Create = false;
      let demo2AcceptWant = false;
      let demo2Create = false;
      let destroyDone = 0;
      commonEventManager.subscribe(subscriber, (err, data) => {
        hilog.info(DOMAIN, LOG_TAG, tag + " event: " + data?.event);
        if (data?.event === 'StartSpecifiedAbility_OnAcceptWant') {
          demo1AcceptWant = true;
        } else if (data?.event === 'StartSpecifiedAbility_OnCreate') {
          demo1Create = true;
        } else if (data?.event === 'demo2_acceptWant') {
          demo2AcceptWant = true;
        } else if (data?.event === 'demo2_entry_onCreate') {
          demo2Create = true;
        } else if (data?.event === 'StartSpecifiedAbility_Exit') {
          destroyDone++;
          if (destroyDone === 2) {
            commonEventManager.unsubscribe(subscriber);
            try {
              expect(demo1AcceptWant).assertTrue();
              expect(demo1Create).assertTrue();
              expect(demo2AcceptWant).assertTrue();
              expect(demo2Create).assertTrue();
            } catch (err) {}
            done();
          }
        }
      });

      try {
        await testContext.startAbility(demo1Entry).then(()=>{
          hilog.info(DOMAIN, LOG_TAG, tag + " first start end success");
        }).catch(()=>{
          hilog.info(DOMAIN, LOG_TAG, tag + " first start end fail");
        });
        await testContext.startAbility(demo2Entry).then(()=>{
          hilog.info(DOMAIN, LOG_TAG, tag + " second start end success");
        }).catch(()=>{
          hilog.info(DOMAIN, LOG_TAG, tag + " second start end fail");
        });
      } catch (err) {
        commonEventManager.unsubscribe(subscriber);
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSpecifiedAbility_0900
     * @tc.number SUB_Ability_AbilityRuntime_StartSpecifiedAbility_0900
     * @tc.desc   Expect: start success twice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartSpecifiedAbility_0900', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_StartSpecifiedAbility_0900';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");

      if (supportSceneBoard === false) {
        done();
        return;
      }

      let subscriber = commonEventManager.createSubscriberSync({
        events: ['StartSpecifiedAbility_OnAcceptWant', 'StartSpecifiedAbility_OnCreate',
          'StartSpecifiedAbility_Exit', 'demo2_acceptWant', 'demo2_entry_onCreate',
          'SecondAbility_OnCreate']
      });

      let demo1AcceptWant = 0;
      let demo1Create = 0;
      let demo2AcceptWant = 0;
      let demo2Create = 0;
      let destroyDone = 0;
      let secondAbilityCreate = false;
      commonEventManager.subscribe(subscriber, (err, data) => {
        if (data?.event === 'StartSpecifiedAbility_OnAcceptWant') {
          demo1AcceptWant++;
        } else if (data?.event === 'StartSpecifiedAbility_OnCreate') {
          demo1Create++;
        } else if (data?.event === 'demo2_acceptWant') {
          demo2AcceptWant++;
        } else if (data?.event === 'demo2_entry_onCreate') {
          demo2Create++;
        } else if (data?.event === 'SecondAbility_OnCreate') {
          secondAbilityCreate = true;
        } else if (data?.event === 'StartSpecifiedAbility_Exit') {
          destroyDone++;
          if (destroyDone === 5) {
            commonEventManager.unsubscribe(subscriber);
            try {
              expect(demo1AcceptWant).assertEqual(4);
              expect(demo1Create).assertEqual(2);
              expect(secondAbilityCreate).assertTrue();
              expect(demo2AcceptWant).assertEqual(3);
              expect(demo2Create).assertEqual(2);
            } catch (err) {}
            done();
          }
        }
      });

      try {
        await testContext.startAbility(demo1Entry);
        await testContext.startAbility(demo1Entry);
        await testContext.startAbility({
          bundleName: demo1BundleName,
          abilityName: 'EntryAbility',
          parameters: {
            flag: 'newInstance1'
          }
        });
        await testContext.startAbility({
          bundleName: demo1BundleName,
          abilityName: 'SecondAbility',
        });

        await testContext.startAbility(demo2Entry);
        await testContext.startAbility(demo2Entry);
        await testContext.startAbility({
          bundleName: demo2BundleName,
          abilityName: 'EntryAbility',
          parameters: {
            flag: 'newInstance1'
          }
        });

      } catch (err) {
        commonEventManager.unsubscribe(subscriber);
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1000
     * @tc.number SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1000
     * @tc.desc   Expect: start crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1000', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1000';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");

      if (supportSceneBoard === false) {
        done();
        return;
      }

      let subscriber = commonEventManager.createSubscriberSync({
        events: ['Demo3_Exit']
      });

      commonEventManager.subscribe(subscriber, (err, data) => {
        if (data?.event === 'Demo3_Exit') {
          commonEventManager.unsubscribe(subscriber);
          done();
        }
      });

      try {
        await testContext.startAbility({
          bundleName: demo3BundleName,
          abilityName: 'EntryAbility',
          parameters: {
            triggerCrash: true
          }
        });
        await testContext.startAbility(demo3Entry);
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, tag + " err: " + JSON.stringify(err));
        commonEventManager.unsubscribe(subscriber);
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1100
     * @tc.number SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1100
     * @tc.desc   Expect: start timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1100', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1100';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");

      if (supportSceneBoard === false) {
        done();
        return;
      }

      let timeoutRatio = systemParameterEnhance.getSync('persist.sys.abilityms.timeout_unit_time_ratio', '1');
      hilog.info(DOMAIN, LOG_TAG, 'timeoutRatio: %{public}s', timeoutRatio);
      let ratio = parseInt(timeoutRatio)
      if (Number.isNaN(ratio) || ratio > 2) {
        done();
        return;
      }

      let subscriber = commonEventManager.createSubscriberSync({
        events: ['Demo3_Exit']
      });

      commonEventManager.subscribe(subscriber, (err, data) => {
        if (data?.event === 'Demo3_Exit') {
          commonEventManager.unsubscribe(subscriber);
          done();
        }
      });

      try {
        await testContext.startAbility({
          bundleName: demo3BundleName,
          abilityName: 'EntryAbility',
          parameters: {
            triggerTimeout: true
          }
        });
        await testContext.startAbility(demo3Entry);
      } catch (err) {
        commonEventManager.unsubscribe(subscriber);
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1200
     * @tc.number SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1200
     * @tc.desc   Expect: start success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1200', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1200';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");

      if (supportSpecifiedProcess === false) {
        done();
        return;
      }

      let subscriber = commonEventManager.createSubscriberSync({
        events: ['demo2_singleton_onCreate', 'demo2_singleton_Exit']
      });

      let createDone = false;
      commonEventManager.subscribe(subscriber, (err, data) => {
        if (data?.event === 'demo2_singleton_onCreate') {
          createDone = true;
        } else if (data?.event === 'demo2_singleton_Exit') {
          commonEventManager.unsubscribe(subscriber);
          try {
            expect(createDone).assertTrue();
          } catch (err) {}
          done();
        }
      });

      try {
        await testContext.startAbility({
          bundleName: demo2BundleName,
          abilityName: 'SingletonAbility',
          parameters: {
            processFlag: 'process1'
          }
        });
      } catch (err) {
        commonEventManager.unsubscribe(subscriber);
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1300
     * @tc.number SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1300
     * @tc.desc   Expect: start success twice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1300', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1300';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");

      if (supportSpecifiedProcess === false) {
        done();
        return;
      }

      let subscriber = commonEventManager.createSubscriberSync({
        events: ['demo2_singleton_onCreate', 'demo2_singleton_Exit', 'demo2_singleton_onNewWant']
      });

      let createDone = false;
      let newWantDone = false;
      commonEventManager.subscribe(subscriber, (err, data) => {
        if (data?.event === 'demo2_singleton_onCreate') {
          createDone = true;
        }  else if (data?.event === 'demo2_singleton_onNewWant') {
          newWantDone = true;
        } else if (data?.event === 'demo2_singleton_Exit') {
          commonEventManager.unsubscribe(subscriber);
          try {
            expect(createDone).assertTrue();
            expect(newWantDone).assertTrue();
          } catch (err) {}
          done();
        }
      });

      try {
        await testContext.startAbility({
          bundleName: demo2BundleName,
          abilityName: 'SingletonAbility',
          parameters: {
            processFlag: 'process1'
          }
        });

        await testContext.startAbility({
          bundleName: demo2BundleName,
          abilityName: 'SingletonAbility',
          parameters: {
            processFlag: 'process1'
          }
        });
      } catch (err) {
        commonEventManager.unsubscribe(subscriber);
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1400
     * @tc.number SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1400
     * @tc.desc   Expect: start success twice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1400', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1400';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (supportSpecifiedProcess === false) {
        done();
        return;
      }

      let subscriber = commonEventManager.createSubscriberSync({
        events: ['demo2_singleton_onCreate', 'demo2_singleton_Exit', 'demo2_singleton_onNewWant',
          'demo2_onNewProcessRequest']
      });

      let createDone = false;
      let newWantDone = false;
      let newProcessDone = false;
      commonEventManager.subscribe(subscriber, (err, data) => {
        if (data?.event === 'demo2_singleton_onCreate') {
          createDone = true;
          testContext.startAbility({
            bundleName: demo2BundleName,
            abilityName: 'SingletonAbility',
            parameters: {
              processFlag: 'process1'
            }
          });
        } else if (data?.event === 'demo2_singleton_onNewWant') {
          newWantDone = true;
        } else if (data?.event === 'demo2_onNewProcessRequest') {
          newProcessDone = true;
        } else if (data?.event === 'demo2_singleton_Exit') {
          commonEventManager.unsubscribe(subscriber);
          try {
            expect(createDone).assertTrue();
            expect(newWantDone).assertTrue();
            expect(newProcessDone).assertTrue();
          } catch (err) {}
          done();
        }
      });

      try {
        await testContext.startAbility({
          bundleName: demo2BundleName,
          abilityName: 'SingletonAbility',
          parameters: {
            processFlag: 'process1'
          }
        });
      } catch (err) {
        commonEventManager.unsubscribe(subscriber);
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1500
     * @tc.number SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1500
     * @tc.desc   Expect: start success twice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1500', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1500';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");

      if (supportSpecifiedProcess === false) {
        done();
        return;
      }

      let subscriber = commonEventManager.createSubscriberSync({
        events: ['demo2_singleton_onCreate', 'demo2_singleton_Exit', 'demo2_stage_create',
          'demo2_entry_onCreate']
      });

      let entryCreate = false;
      let singletonCreate = false;
      let stageCreate = 0;
      commonEventManager.subscribe(subscriber, (err, data) => {
        if (data?.event === 'demo2_entry_onCreate') {
          entryCreate = true;
        } else if (data?.event === 'demo2_singleton_onCreate') {
          singletonCreate = true;
        } else if (data?.event === 'demo2_stage_create') {
          stageCreate++;
        } else if (data?.event === 'demo2_singleton_Exit') {
          commonEventManager.unsubscribe(subscriber);
          try {
            expect(entryCreate).assertTrue();
            expect(singletonCreate).assertTrue();
            expect(stageCreate).assertEqual(2);
          } catch (err) {}
          done();
        }
      });

      try {
        await testContext.startAbility(demo2Entry);
        testContext.startAbility({
          bundleName: demo2BundleName,
          abilityName: 'SingletonAbility',
          parameters: {
            processFlag: 'process1'
          }
        });
      } catch (err) {
        commonEventManager.unsubscribe(subscriber);
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1600
     * @tc.number SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1600
     * @tc.desc   Expect: start success twice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1600', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1600';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");

      if (supportSpecifiedProcess === false) {
        done();
        return;
      }

      let subscriber = commonEventManager.createSubscriberSync({
        events: ['demo2_singleton_onCreate', 'demo2_singleton_Exit', 'demo2_stage_create']
      });

      let singletonCreate = false;
      let stageCreate = 0;
      commonEventManager.subscribe(subscriber, (err, data) => {
        if (data?.event === 'demo2_singleton_onCreate') {
          singletonCreate = true;
        } else if (data?.event === 'demo2_stage_create') {
          stageCreate++;
        } else if (data?.event === 'demo2_singleton_Exit') {
          commonEventManager.unsubscribe(subscriber);
          try {
            expect(singletonCreate).assertTrue();
            expect(stageCreate).assertEqual(1);
          } catch (err) {}
          done();
        }
      });

      try {
        await testContext.startAbility(noSpecifiedWant);
        await testContext.startAbility({
          bundleName: demo2BundleName,
          abilityName: 'SingletonAbility',
          parameters: {
            processFlag: 'process1'
          }
        });
      } catch (err) {
        commonEventManager.unsubscribe(subscriber);
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1700
     * @tc.number SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1700
     * @tc.desc   Expect: start success twice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1700', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1700';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");

      if (supportSpecifiedProcess === false) {
        done();
        return;
      }

      let subscriber = commonEventManager.createSubscriberSync({
        events: ['demo2_singleton_onCreate', 'demo2_singleton_Exit', 'demo2_stage_create']
      });

      let singletonCreate = false;
      let stageCreate = 0;
      commonEventManager.subscribe(subscriber, (err, data) => {
        if (data?.event === 'demo2_singleton_onCreate') {
          singletonCreate = true;
        } else if (data?.event === 'demo2_stage_create') {
          stageCreate++;
        } else if (data?.event === 'demo2_singleton_Exit') {
          commonEventManager.unsubscribe(subscriber);
          try {
            expect(singletonCreate).assertTrue();
            expect(stageCreate).assertEqual(2);
          } catch (err) {}
          done();
        }
      });

      try {
        await testContext.startAbility(noSpecifiedWant);
        await sleep(100);
        await testContext.startAbility({
          bundleName: demo2BundleName,
          abilityName: 'SingletonAbility',
          parameters: {
            processFlag: 'process1'
          }
        });
      } catch (err) {
        commonEventManager.unsubscribe(subscriber);
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1800
     * @tc.number SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1800
     * @tc.desc   Expect: start success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1800', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1800';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");

      if (supportSpecifiedProcess === false) {
        done();
        return;
      }

      let subscriber = commonEventManager.createSubscriberSync({
        events: ['IsolationAbility_onCreate', 'IsolationAbility_Exit']
      });

      let createDone = false;
      commonEventManager.subscribe(subscriber, (err, data) => {
        if (data?.event === 'IsolationAbility_onCreate') {
          createDone = true;
        } else if (data?.event === 'IsolationAbility_Exit') {
          commonEventManager.unsubscribe(subscriber);
          try {
            expect(createDone).assertTrue();
          } catch (err) {}
          done();
        }
      });

      try {
        await testContext.startAbility({
          bundleName: demo2BundleName,
          abilityName: 'IsolationAbility',
          parameters: {
            processFlag: 'process1'
          }
        });
      } catch (err) {
        commonEventManager.unsubscribe(subscriber);
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1900
     * @tc.number SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1900
     * @tc.desc   Expect: start success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1900', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_StartSpecifiedAbility_1900';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");

      if (supportSpecifiedProcess === false) {
        done();
        return;
      }

      let subscriber = commonEventManager.createSubscriberSync({
        events: ['IsolationAbility_onCreate', 'IsolationAbility_Exit', 'IsolationAbility_onNewWant']
      });

      let createDone = false;
      let neWantDone = false;
      commonEventManager.subscribe(subscriber, (err, data) => {
        if (data?.event === 'IsolationAbility_onCreate') {
          createDone = true;
        } else if (data?.event === 'IsolationAbility_onNewWant') {
          neWantDone = true;
        } else if (data?.event === 'IsolationAbility_Exit') {
          commonEventManager.unsubscribe(subscriber);
          try {
            expect(createDone).assertTrue();
            expect(neWantDone).assertTrue();
          } catch (err) {}
          done();
        }
      });

      try {
        await testContext.startAbility({
          bundleName: demo2BundleName,
          abilityName: 'IsolationAbility',
          parameters: {
            processFlag: 'process1',
            otherParam: 'firstStart',
          }
        });
        await sleep(100);  // without this, ability could be started in second process
        testContext.startAbility({
          bundleName: demo2BundleName,
          abilityName: 'IsolationAbility',
          parameters: {
            processFlag: 'process1',
            otherParam: 'secondStart ooooooo',
          }
        });
      } catch (err) {
        commonEventManager.unsubscribe(subscriber);
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSpecifiedAbility_2000
     * @tc.number SUB_Ability_AbilityRuntime_StartSpecifiedAbility_2000
     * @tc.desc   Expect: start success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartSpecifiedAbility_2000', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_StartSpecifiedAbility_2000';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");

      if (supportSpecifiedProcess === false) {
        done();
        return;
      }

      let subscriber = commonEventManager.createSubscriberSync({
        events: ['IsolationAbility_onCreate', 'IsolationAbility_Exit', 'demo2_stage_create']
      });

      const processFlag = 'process1';
      let abilityCreate = 0;
      let abilityDestroy = 0;
      let stageCreate = 0;
      let processNames = [demo2BundleName, demo2BundleName + ':' + processFlag];
      commonEventManager.subscribe(subscriber, (err, data) => {
        if (data?.event === 'IsolationAbility_onCreate') {
          hilog.info(DOMAIN, LOG_TAG, tag + data.data);
          try {
            let result:string = data.data as string;
            expect(processNames.indexOf(result)>=-1).assertTrue();
          } catch (err) {}
          abilityCreate++;
        } else if (data?.event === 'demo2_stage_create') {
          stageCreate++;
        } else if (data?.event === 'IsolationAbility_Exit') {
          abilityDestroy++;
          if (abilityDestroy === 2) {
            commonEventManager.unsubscribe(subscriber);
            try {
              expect(abilityCreate).assertEqual(2);
              expect(stageCreate).assertEqual(2);
            } catch (err) {}
            done();
          }
        }
      });

      try {
        await testContext.startAbility({
          bundleName: demo2BundleName,
          abilityName: 'IsolationAbility',
          parameters: {
            processFlag: processFlag
          }
        });
        testContext.startAbility({
          bundleName: demo2BundleName,
          abilityName: 'IsolationAbility',
          parameters: {
            processFlag: processFlag,
            flag: 'instance1'
          }
        });
      } catch (err) {
        commonEventManager.unsubscribe(subscriber);
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSpecifiedAbility_2100
     * @tc.number SUB_Ability_AbilityRuntime_StartSpecifiedAbility_2100
     * @tc.desc   Expect: start success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartSpecifiedAbility_2100', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_StartSpecifiedAbility_2100';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");

      if (supportSpecifiedProcess === false) {
        done();
        return;
      }

      let subscriber = commonEventManager.createSubscriberSync({
        events: ['IsolationAbility_onCreate', 'IsolationAbility_Exit', 'demo2_stage_create',
          'IsolationAbility_onNewWant']
      });

      const processFlag = 'process1';
      const processFlag2 = 'process2';
      let abilityDestroy = 0;
      let stageCreate = 0;
      let newWant = false;
      const processName1 = demo2BundleName + ':' + processFlag;
      const processName2 = demo2BundleName + ':' + processFlag2;
      let abilityCreate: Map<string, number> = new Map;
      abilityCreate[processName1] = 0;
      abilityCreate[processName2] = 0;
      commonEventManager.subscribe(subscriber, (err, data) => {
        hilog.info(DOMAIN, LOG_TAG, tag + data.event);
        if (data?.event === 'IsolationAbility_onCreate') {
          hilog.info(DOMAIN, LOG_TAG, tag + data.data);
          let processName = data.data as string;
          abilityCreate[processName]++;
        } else if (data?.event === 'demo2_stage_create') {
          stageCreate++;
        } else if (data?.event === 'IsolationAbility_onNewWant') {
          newWant = true;
        } else if (data?.event === 'IsolationAbility_Exit') {
          abilityDestroy++;
          if (abilityDestroy === 3) {
            commonEventManager.unsubscribe(subscriber);
            try {
              expect(abilityCreate[processName1]).assertEqual(2);
              expect(abilityCreate[processName2]).assertEqual(1);
              expect(stageCreate).assertEqual(3);
              expect(newWant).assertTrue();
            } catch (err) {}
            done();
          }
        }
      });

      try {
        await testContext.startAbility(noSpecifiedWant);
        await sleep(50);
        await testContext.startAbility({
          bundleName: demo2BundleName,
          abilityName: 'IsolationAbility',
          parameters: {
            processFlag: processFlag
          }
        });
        await sleep(50);
        await testContext.startAbility({
          bundleName: demo2BundleName,
          abilityName: 'IsolationAbility',
          parameters: {
            processFlag: processFlag,
            flag: 'instance1'
          }
        });
        // actually process1
        await sleep(100);
        await testContext.startAbility({
          bundleName: demo2BundleName,
          abilityName: 'IsolationAbility',
          parameters: {
            processFlag: processFlag2
          }
        });
        await testContext.startAbility({
          bundleName: demo2BundleName,
          abilityName: 'IsolationAbility',
          parameters: {
            processFlag: processFlag2,
            flag: 'instance2'
          }
        });
      } catch (err) {
        commonEventManager.unsubscribe(subscriber);
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSpecifiedAbility_2200
     * @tc.number SUB_Ability_AbilityRuntime_StartSpecifiedAbility_2200
     * @tc.desc   Expect: start success twice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartSpecifiedAbility_2200', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_StartSpecifiedAbility_2200';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");

      let subscriber = commonEventManager.createSubscriberSync({
        events: ['demo2_entry_onCreate', 'StartSpecifiedAbility_Exit',
          'demo2_stage_create', 'demo2_nospecified_onCreate']
      });

      let specifiedCreate = false;
      let noSpecifiedCreate = false;
      let stageCreate = false;
      commonEventManager.subscribe(subscriber, (err, data) => {
        if (data?.event === 'demo2_entry_onCreate') {
          specifiedCreate = true;
        } else if (data?.event === 'demo2_nospecified_onCreate') {
          noSpecifiedCreate = true;
        } else if (data?.event === 'demo2_stage_create') {
          stageCreate = true;
        } else if (data?.event === 'StartSpecifiedAbility_Exit') {
          commonEventManager.unsubscribe(subscriber);
          try {
            expect(specifiedCreate).assertTrue();
            expect(noSpecifiedCreate).assertTrue();
            expect(stageCreate).assertTrue();
          } catch (err) {}
          done();
        }
      });

      try {
        await testContext.startAbility(noSpecifiedWant);
        await sleep(30);
        await testContext.startAbility(demo2Entry);
      } catch (err) {
        commonEventManager.unsubscribe(subscriber);
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSpecifiedAbility_2300
     * @tc.number SUB_Ability_AbilityRuntime_StartSpecifiedAbility_2300
     * @tc.desc   Expect: start success, reuse success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartSpecifiedAbility_2300', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_StartSpecifiedAbility_2300';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (supportSpecifiedProcess === false) {
        done();
        return;
      }

      let subscriber = commonEventManager.createSubscriberSync({
        events: ['IsolationAbility_Exit', 'demo2_stage_create', 'IsolationAbility_onCreate',
          'IsolationAbility_onNewWant']
      });

      const defaultInstance: Want = {
        bundleName: demo2BundleName,
        abilityName: 'IsolationAbility'
      };

      const instance2Want: Want = {
        bundleName: demo2BundleName,
        abilityName: 'IsolationAbility',
        parameters: {
          processFlag: 'process1',
          flag: 'delayExit'
        }
      }

      let abilityCreate = 0;
      let stageCreate = 0;
      let abilityDestroy = 0;
      let newWant = false;
      commonEventManager.subscribe(subscriber, async (err, data) => {
        hilog.info(DOMAIN, LOG_TAG, tag + " event: " + data.event);
        if (data?.event === 'IsolationAbility_onCreate') {
          abilityCreate++;
        } else if (data?.event === 'demo2_stage_create') {
          stageCreate++;
        } else if (data?.event === 'IsolationAbility_onNewWant') {
          try {
            expect(abilityCreate).assertEqual(2);
            expect(stageCreate).assertEqual(3);
          } catch (err) {}
          newWant = true;
          testContext.startAbility(noSpecifiedWant);
        } else if (data?.event === 'IsolationAbility_Exit') {
          abilityDestroy++;
          if (abilityDestroy === 1) {
            try {
              expect(abilityCreate).assertEqual(2);
              expect(stageCreate).assertEqual(2);
            } catch (err) {}

            await sleep(50);
            testContext.startAbility(instance2Want);
          }

          if (abilityDestroy === 2) {
            commonEventManager.unsubscribe(subscriber);
            try {
              expect(newWant).assertTrue();
              expect(abilityCreate).assertEqual(2);
            } catch (err) {}
            done();
          }
        }
      });

      try {
        await testContext.startAbility(defaultInstance);
        await sleep(50);
        await testContext.startAbility(instance2Want);
      } catch (err) {
        commonEventManager.unsubscribe(subscriber);
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })
  })
}