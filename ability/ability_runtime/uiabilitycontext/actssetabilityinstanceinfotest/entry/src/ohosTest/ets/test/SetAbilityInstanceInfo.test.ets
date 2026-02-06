/*
 * Copyright (C) 2024-2025 HiHope Open Source Organization.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { JSON } from '@kit.ArkTS';
import { image } from '@kit.ImageKit';
import { BusinessError, commonEventManager, deviceInfo } from '@kit.BasicServicesKit';
import { Driver, ON } from '@ohos.UiTest';

let testContext: common.UIAbilityContext;
const DOMAIN = 0x0000;
const LOG_TAG = 'SET_ABILITY_INSTANCE_INFO_TEST';

let color: ArrayBuffer = new ArrayBuffer(512 * 512 * 4);
let bufferArr = new Uint8Array(color);
for (let i = 0; i < bufferArr.length; i += 4) {
  bufferArr[i] = 255;
  bufferArr[i + 1] = 0;
  bufferArr[i + 2] = 122;
  bufferArr[i + 3] = 255;
}
let opts: image.InitializationOptions = {editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: {height: 512, width: 512}};
let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);

const sleep = (mills: number) => {
  return new Promise<void>(resolve => setTimeout(resolve, mills));
}

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async (done: Function) => {
      let driver = Driver.create();	
      try {
        let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
        if (allowed) {
          await allowed.click();
        }
      } catch (err) {
        console.error('findComponent failed: ' + JSON.stringify(err));
      }
      try {
        const ability = await abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility()
        testContext = ability.context;
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "get context failed: " + JSON.stringify(err))
        try { expect().assertFail(); } catch (err) {}
      }
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0200
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0200
     * @tc.desc   Expect: call success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0200', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0200';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      let subscriber = commonEventManager.createSubscriberSync({
        events: ['setAbilityInstanceInfo_success', 'setAbilityInstanceInfo_fail']
      });
      commonEventManager.subscribe(subscriber, (err, data) => {
        if (data?.event === 'setAbilityInstanceInfo_success') {
          commonEventManager.unsubscribe(subscriber,()=>{
            hilog.info(DOMAIN, LOG_TAG, tag + " success");
            done();
          });
        } else {
          commonEventManager.unsubscribe(subscriber,()=>{
            hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
            hilog.info(DOMAIN, LOG_TAG, tag + " fail");
            try { expect().assertFail(); } catch (err) {}
            done();
          });
        }
      });
      testContext.startAbility({
        bundleName: 'com.acts.ability.setabilityinstanceinfo',
        abilityName: 'EntryAbility'
      }).then(()=>{
        hilog.info(DOMAIN, LOG_TAG, tag + " startAbility success");
      }).catch(async(err:BusinessError)=>{
        hilog.info(DOMAIN, LOG_TAG, tag + " startAbility fail " + err?.code);
        try { expect().assertFail(); } catch (err) {}
        commonEventManager.unsubscribe(subscriber,()=>{
          done();
        });
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0300
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0300
     * @tc.desc   Expect: call success 10 times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0300', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0300';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      let successCount = 0;
      for (let i = 0; i < 10; i++) {
        try {
          await testContext.setAbilityInstanceInfo('111111' + i, pixelMap);
          successCount++;
        } catch (err) {
          hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        }
      }
      if (successCount === 10) {
        hilog.info(DOMAIN, LOG_TAG, tag + " success");
        done();
      } else {
        hilog.info(DOMAIN, LOG_TAG, tag + " fail");
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0400
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0400
     * @tc.desc   Expect: success in both abilities
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0400', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0400';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      let count = 0;
      let subscriber = commonEventManager.createSubscriberSync({
        events: ['setAbilityInstanceInfo_success', 'setAbilityInstanceInfo_fail']
      });
      commonEventManager.subscribe(subscriber, (err, data) => {
        if (data?.event === 'setAbilityInstanceInfo_success') {
          count++;
          if (count === 2) {
            hilog.info(DOMAIN, LOG_TAG, tag + " success");
            commonEventManager.unsubscribe(subscriber,()=>{
              done();
            });
          }
        } else {
          commonEventManager.unsubscribe(subscriber,()=>{
            hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
            hilog.info(DOMAIN, LOG_TAG, tag + " fail");
            try { expect().assertFail(); } catch (err) {}
            done();
          });
        }
      });
      testContext.startAbility({
        bundleName: 'com.acts.ability.setabilityinstanceinfo',
        abilityName: 'EntryAbility'
      }).then(()=>{
        hilog.info(DOMAIN, LOG_TAG, tag + " startAbility success");
      }).catch(async(err:BusinessError)=>{
        hilog.info(DOMAIN, LOG_TAG, tag + " startAbility fail " + err?.code);
        try { expect().assertFail(); } catch (err) {}
        commonEventManager.unsubscribe(subscriber,()=>{
          done();
        });
      })
      try {
        await testContext.setAbilityInstanceInfo('111111', pixelMap);
        count++;
        if (count === 2) {
          hilog.info(DOMAIN, LOG_TAG, tag + " success");
          done();
        }
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0600
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0600
     * @tc.desc   Expect: success in both instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0600', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0600';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }

      let count = 0;

      let subscriber = commonEventManager.createSubscriberSync({
        events: ['setAbilityInstanceInfo_success', 'setAbilityInstanceInfo_fail']
      });
      commonEventManager.subscribe(subscriber, (err, data) => {
        hilog.info(DOMAIN, LOG_TAG, tag + " event:" + JSON.stringify(data));
        if (data?.event === 'setAbilityInstanceInfo_success') {
          count++;
          if (count === 2) {
            commonEventManager.unsubscribe(subscriber,()=>{
              hilog.info(DOMAIN, LOG_TAG, tag + " success");
              done();
            });
          }
        } else {
          hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
          commonEventManager.unsubscribe(subscriber,()=>{
            hilog.info(DOMAIN, LOG_TAG, tag + " fail");
            try { expect().assertFail(); } catch (err) {}
            done();
          });
        }
      });

      await testContext.startAbility({
        bundleName: 'com.acts.ability.setabilityinstanceinfo',
        abilityName: 'SecondAbility',
        parameters: {
          flag: '1'
        }
      }).then(()=>{
        hilog.info(DOMAIN, LOG_TAG, tag + " startAbility success");
      }).catch(async(err:BusinessError)=>{
        hilog.info(DOMAIN, LOG_TAG, tag + " startAbility fail " + err?.code);
        try { expect().assertFail(); } catch (err) {}
        commonEventManager.unsubscribe(subscriber,()=>{
          done();
        });
      })
      await testContext.startAbility({
        bundleName: 'com.acts.ability.setabilityinstanceinfo',
        abilityName: 'SecondAbility',
        parameters: {
          flag: '2'
        }
      }).then(()=>{
        hilog.info(DOMAIN, LOG_TAG, tag + " startAbility success");
      }).catch(async(err:BusinessError)=>{
        hilog.info(DOMAIN, LOG_TAG, tag + " startAbility fail " + err?.code);
        try { expect().assertFail(); } catch (err) {}
        commonEventManager.unsubscribe(subscriber,()=>{
          done();
        });
      })

    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0800
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0800
     * @tc.desc   Expect: success for 2in1 device, others failed with code 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0800', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_0800';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      hilog.info(DOMAIN, LOG_TAG, tag + " " + deviceInfo.deviceType);
      try {
        await testContext.setAbilityInstanceInfo('111111', pixelMap);
        if (deviceInfo.deviceType === '2in1') {
          hilog.info(DOMAIN, LOG_TAG, tag + " success");
          done();
        } else {
          hilog.info(DOMAIN, LOG_TAG, tag + " fail");
          try { expect().assertFail(); } catch (err) {}
          done();
        }
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        if (deviceInfo.deviceType === '2in1') {
          hilog.info(DOMAIN, LOG_TAG, tag + " fail");
          try { expect().assertFail(); } catch (err) {}
          done();
        } else if (err?.code === 801) {
          hilog.info(DOMAIN, LOG_TAG, tag + " success");
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1000
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1000
     * @tc.desc   Expect: call failed with code 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1000', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1000';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      let subscriber = commonEventManager.createSubscriberSync({
        events: ['setAbilityInstanceInfo_success', 'setAbilityInstanceInfo_fail']
      });
      commonEventManager.subscribe(subscriber, (err, data) => {
        if (data?.event === 'setAbilityInstanceInfo_fail') {
          commonEventManager.unsubscribe(subscriber,()=>{
            expect(data?.code).assertEqual(201);
            hilog.info(DOMAIN, LOG_TAG, tag + " success");
            done();
          });
        } else {
          commonEventManager.unsubscribe(subscriber,()=>{
            hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
            hilog.info(DOMAIN, LOG_TAG, tag + " fail");
            try { expect().assertFail(); } catch (err) {}
            done();
          });
        }
      });
      testContext.startAbility({
        bundleName: 'com.acts.ability.setabilityinstanceinfo.demo2',
        abilityName: 'EntryAbility'
      }).then(()=>{
        hilog.info(DOMAIN, LOG_TAG, tag + " startAbility success");
      }).catch(async(err:BusinessError)=>{
        hilog.info(DOMAIN, LOG_TAG, tag + " startAbility fail " + err?.code);
        try { expect().assertFail(); } catch (err) {}
        commonEventManager.unsubscribe(subscriber,()=>{
          done();
        });
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1100
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1100
     * @tc.desc   Expect: call failed with code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1100', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1100';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      try {
        await testContext.setAbilityInstanceInfo('', pixelMap);
        hilog.info(DOMAIN, LOG_TAG, tag + " fail");
        try { expect().assertFail(); } catch (err) {}
        done();
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        try { expect(err?.code).assertEqual(401); } catch (err) {}
        hilog.info(DOMAIN, LOG_TAG, tag + " success");
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1200
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1200
     * @tc.desc   Expect: call failed with code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1200', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1200';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      try {
        await testContext.setAbilityInstanceInfo(null, pixelMap);
        hilog.info(DOMAIN, LOG_TAG, tag + " fail");
        try { expect().assertFail(); } catch (err) {}
        done();
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        try { expect(err?.code).assertEqual(401); } catch (err) {}
        hilog.info(DOMAIN, LOG_TAG, tag + " success");
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1300
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1300
     * @tc.desc   Expect: call failed with code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1300', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1300';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      try {
        await testContext.setAbilityInstanceInfo(undefined, pixelMap);
        hilog.info(DOMAIN, LOG_TAG, tag + " fail");
        try { expect().assertFail(); } catch (err) {}
        done();
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        try { expect(err?.code).assertEqual(401); } catch (err) {}
        hilog.info(DOMAIN, LOG_TAG, tag + " success");
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1400
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1400
     * @tc.desc   Expect: call success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1400', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1400';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      try {
        await testContext.setAbilityInstanceInfo('#￥😂😋', pixelMap);
        hilog.info(DOMAIN, LOG_TAG, tag + " success");
        done();
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        hilog.info(DOMAIN, LOG_TAG, tag + " fail");
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1500
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1500
     * @tc.desc   Expect: call success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1500', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1500';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      try {
        await testContext.setAbilityInstanceInfo('啥万一', pixelMap);
        hilog.info(DOMAIN, LOG_TAG, tag + " success");
        done();
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        hilog.info(DOMAIN, LOG_TAG, tag + " fail");
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1600
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1600
     * @tc.desc   Expect: call failed with code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1600', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1600';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      let label = '';
      for (let i = 0; i < 64; i++) {
        label += '0123456789abcdef';
      }
      label += 'g';
      try {
        await testContext.setAbilityInstanceInfo(label, pixelMap);
        hilog.info(DOMAIN, LOG_TAG, tag + " fail");
        try { expect().assertFail(); } catch (err) {}
        done();
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        try { expect(err?.code).assertEqual(401); } catch (err) {}
        hilog.info(DOMAIN, LOG_TAG, tag + " success");
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1700
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1700
     * @tc.desc   Expect: call success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1700', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1700';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      let label = '';
      for (let i = 0; i < 64; i++) {
        label += '0123456789abcdef';
      }
      try {
        await testContext.setAbilityInstanceInfo(label, pixelMap);
        hilog.info(DOMAIN, LOG_TAG, tag + " success");
        done();
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        hilog.info(DOMAIN, LOG_TAG, tag + " fail");
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1800
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1800
     * @tc.desc   Expect: call failed with code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1800', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_1800';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      let emptyColor = new ArrayBuffer(0);
      let emptyImg = image.createPixelMapSync(emptyColor, {size: {width: 0, height: 0}});
      try {
        await testContext.setAbilityInstanceInfo('111111', emptyImg);
        hilog.info(DOMAIN, LOG_TAG, tag + " fail");
        try { expect().assertFail(); } catch (err) {}
        done();
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        try { expect(err?.code).assertEqual(401); } catch (err) {}
        hilog.info(DOMAIN, LOG_TAG, tag + " success");
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2000
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2000
     * @tc.desc   Expect: call failed with code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2000', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2000';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      try {
        await testContext.setAbilityInstanceInfo('111111', null);
        hilog.info(DOMAIN, LOG_TAG, tag + " fail");
        try { expect().assertFail(); } catch (err) {}
        done();
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        try { expect(err?.code).assertEqual(401); } catch (err) {}
        hilog.info(DOMAIN, LOG_TAG, tag + " success");
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2100
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2100
     * @tc.desc   Expect: call failed with code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2100', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2100';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      try {
        await testContext.setAbilityInstanceInfo('111111', undefined);
        hilog.info(DOMAIN, LOG_TAG, tag + " fail");
        try { expect().assertFail(); } catch (err) {}
        done();
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        try { expect(err?.code).assertEqual(401); } catch (err) {}
        hilog.info(DOMAIN, LOG_TAG, tag + " success");
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2200
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2200
     * @tc.desc   Expect: success 2000 times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2200', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_2200';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      let successCount = 0;
      for (let i = 0; i < 2000; i++) {
        try {
          await testContext.setAbilityInstanceInfo('111111' + i, pixelMap);
          successCount++;
        } catch (err) {
          hilog.info(DOMAIN, LOG_TAG, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        }
      }
      if (successCount === 2000) {
        hilog.info(DOMAIN, LOG_TAG, tag + " success");
        done();
      } else {
        hilog.info(DOMAIN, LOG_TAG, tag + " fail");
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })
  })
}