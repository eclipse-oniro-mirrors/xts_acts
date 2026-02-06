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
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import CommonEventManager from '@ohos.commonEventManager';
import installer from '@ohos.bundle.installer';
import Want from '@ohos.app.ability.Want';
import wantConstant from '@ohos.app.ability.wantConstant';

let appCloneBundleName: string = 'com.ohos.appclonehap1';
  let appCloneIndex = 1;
  let paramForCreatingAppClone: installer.CreateAppCloneParam = {
    userId: 100,
    appIndex: appCloneIndex,
  };
export default function startAppCloneTest() {
  describe('ActsStartAppCloneTest', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(async () => {
      // await globalThis.entryAbilityContext.terminateSelf();
    });
    afterAll(() => {
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityClone_0100
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityClone_0100
     * @tc.desc   expect app clone to start.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityClone_0100', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_StartAbilityClone_0100`;
      console.log(`${tag}, it begin`);

      let subscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
        events: ['start_appClone_0100']
      };
      let subscriber = CommonEventManager.createSubscriberSync(subscribeInfo);
      let subscribeCB = (err: BusinessError, data: CommonEventManager.CommonEventData) => {
        if (err) {
          console.error(`receive event failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        } else {
          console.info(`receive event success, event:${data.event}`);
          if (data.event == 'start_appClone_0100') {
            expect(data.parameters["appCloneIndex"]).assertEqual(0);
            unSubscribe(subscriber, done);
          }
        }
      }
      CommonEventManager.subscribe(subscriber, subscribeCB);

      let want: Want = {
        bundleName: appCloneBundleName,
        abilityName: 'EntryAbility',
        parameters: {
          [wantConstant.Params.APP_CLONE_INDEX_KEY]: 0,
          testCase: 100
        }
      }
      try {
        AppStorage.get<common.UIAbilityContext>("testAbilityContext").startAbility(want).then(() => {
          console.info('startAbility succeed');
        }).catch((err: BusinessError) => {
          console.error(`startAbility failed, cause: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.error(`${tag} error, errorCode: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityClone_0200
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityClone_0200
     * @tc.desc   expect app clone to start.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityClone_0200', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_StartAbilityClone_0200`;
      console.log(`${tag}, it begin`);

      createAppClone();
      await sleep(1000);

      let subscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
        events: ['start_appClone_0200']
      };
      let subscriber = CommonEventManager.createSubscriberSync(subscribeInfo);
      let subscribeCB = (err: BusinessError, data: CommonEventManager.CommonEventData) => {
        if (err) {
          console.error(`receive event failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        } else {
          console.info(`receive event success, event:${data.event}`);
          if (data.event == 'start_appClone_0200') {
            expect(data.parameters["appCloneIndex"]).assertEqual(appCloneIndex);

            uninstallAppClone();
            unSubscribe(subscriber, done);
          }
        }
      }
      CommonEventManager.subscribe(subscriber, subscribeCB);

      let want: Want = {
        bundleName: appCloneBundleName,
        abilityName: 'EntryAbility',
        parameters: {
          [wantConstant.Params.APP_CLONE_INDEX_KEY]: appCloneIndex,
          testCase: 200
        }
      }
      try {
        AppStorage.get<common.UIAbilityContext>("testAbilityContext").startAbility(want).then(() => {
          console.info('startAbility succeed');
        }).catch((err: BusinessError) => {
          console.error(`startAbility failed, cause: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.error(`${tag} error, errorCode: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityClone_0300
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityClone_0300
     * @tc.desc   expect app clone to start.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityClone_0300', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let tag = `SUB_Ability_AbilityRuntime_StartAbilityClone_0300`;
      console.log(`${tag}, it begin`);

      let maxAppCloneIndex: number = 1000;
      let want: Want = {
        bundleName: appCloneBundleName,
        abilityName: 'EntryAbility',
        parameters: {
          [wantConstant.Params.APP_CLONE_INDEX_KEY]: maxAppCloneIndex
        }
      }
      try {
        AppStorage.get<common.UIAbilityContext>("testAbilityContext").startAbility(want).then(() => {
          console.info('startAbility succeed');
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`startAbility failed, cause: ${JSON.stringify(err)}`);
          let expectErrCode = 16000001;
          expect(err.code).assertEqual(expectErrCode);
          done();
        });
      } catch (err) {
        console.error(`${tag} error, errorCode: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityClone_0400
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityClone_0400
     * @tc.desc   expect app clone to start.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityClone_0400', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_StartAbilityClone_0400`;
      console.log(`${tag}, it begin`);

      let invalidAppCloneIndex: number = 1001;
      let want: Want = {
        bundleName: appCloneBundleName,
        abilityName: 'EntryAbility',
        parameters: {
          [wantConstant.Params.APP_CLONE_INDEX_KEY]: invalidAppCloneIndex
        }
      }
      try {
        AppStorage.get<common.UIAbilityContext>("testAbilityContext").startAbility(want).then(() => {
          console.info('startAbility succeed');
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`startAbility failed, cause: ${JSON.stringify(err)}`);
          let expectErrCode = 16000073;
          expect(err.code).assertEqual(expectErrCode);
          done();
        });
      } catch (err) {
        console.error(`${tag} error, errorCode: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityClone_0500
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityClone_0500
     * @tc.desc   expect app clone to start.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityClone_0500', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_StartAbilityClone_0500`;
      console.log(`${tag}, it begin`);

      let invalidAppCloneIndex: number = -1;
      let want: Want = {
        bundleName: appCloneBundleName,
        abilityName: 'EntryAbility',
        parameters: {
          [wantConstant.Params.APP_CLONE_INDEX_KEY]: invalidAppCloneIndex
        }
      }
      try {
        AppStorage.get<common.UIAbilityContext>("testAbilityContext").startAbility(want).then(() => {
          console.info('startAbility succeed');
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`startAbility failed, cause: ${JSON.stringify(err)}`);
          let expectErrCode = 16000073;
          expect(err.code).assertEqual(expectErrCode);
          done();
        });
      } catch (err) {
        console.error(`${tag} error, errorCode: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityClone_0600
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityClone_0600
     * @tc.desc   expect app clone to start.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityClone_0600', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_StartAbilityClone_0600`;
      console.log(`${tag}, it begin`);

      let subscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
        events: ['start_appClone_0600']
      };
      let subscriber = CommonEventManager.createSubscriberSync(subscribeInfo);
      let subscribeCB = (err: BusinessError, data: CommonEventManager.CommonEventData) => {
        if (err) {
          console.error(`receive event failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        } else {
          console.info(`receive event success, event:${data.event}`);
          if (data.event == 'start_appClone_0600') {
            expect(data.parameters["appCloneIndex"]).assertEqual(0);
            unSubscribe(subscriber, done);
          }
        }
      }
      CommonEventManager.subscribe(subscriber, subscribeCB);

      let want: Want = {
        bundleName: appCloneBundleName,
        abilityName: 'EntryAbility',
        parameters: {
          [wantConstant.Params.APP_CLONE_INDEX_KEY]: undefined,
          testCase: 600
        }
      }
      try {
        AppStorage.get<common.UIAbilityContext>("testAbilityContext").startAbility(want).then(() => {
          console.info('startAbility succeed');
        }).catch((err: BusinessError) => {
          console.error(`startAbility failed, cause: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.error(`${tag} error, errorCode: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityClone_0700
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityClone_0700
     * @tc.desc   expect app clone to start.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityClone_0700', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_StartAbilityClone_0700`;
      console.log(`${tag}, it begin`);

      createAppClone();
      await sleep(1000);

      let subscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
        events: ['start_appClone_0700']
      };
      let subscriber = CommonEventManager.createSubscriberSync(subscribeInfo);
      let subscribeCB = (err: BusinessError, data: CommonEventManager.CommonEventData) => {
        if (err) {
          console.error(`receive event failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        } else {
          console.info(`receive event success, event:${data.event}`);
          if (data.event == 'start_appClone_0700') {
            expect(data.parameters["appCloneIndex"]).assertEqual(appCloneIndex);

            uninstallAppClone();
            unSubscribe(subscriber, done);
          }
        }
      }
      CommonEventManager.subscribe(subscriber, subscribeCB);

      let want: Want = {
        bundleName: appCloneBundleName,
        abilityName: 'EntryAbility',
        parameters: {
          [wantConstant.Params.APP_CLONE_INDEX_KEY]: appCloneIndex,
          testCase: 700
        }
      }
      try {
        AppStorage.get<common.UIAbilityContext>("testAbilityContext").startAbilityAsCaller(want).then(() => {
          console.info('startAbilityAsCaller succeed');
        }).catch((err: BusinessError) => {
          console.error(`startAbilityAsCaller failed, cause: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.error(`${tag} error, errorCode: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityClone_0800
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityClone_0800
     * @tc.desc   expect app clone to start.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityClone_0800', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let tag = `SUB_Ability_AbilityRuntime_StartAbilityClone_0800`;
      console.log(`${tag}, it begin`);

      let maxAppCloneIndex: number = 1000;
      let want: Want = {
        bundleName: appCloneBundleName,
        abilityName: 'EntryAbility',
        parameters: {
          [wantConstant.Params.APP_CLONE_INDEX_KEY]: maxAppCloneIndex
        }
      }
      try {
        AppStorage.get<common.UIAbilityContext>("testAbilityContext").startAbilityAsCaller(want).then(() => {
          console.info('startAbilityAsCaller succeed');
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`startAbilityAsCaller failed, cause: ${JSON.stringify(err)}`);
          let expectErrCode = 16000001;
          expect(err.code).assertEqual(expectErrCode);
          done();
        });
      } catch (err) {
        console.error(`${tag} error, errorCode: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityClone_0900
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityClone_0900
     * @tc.desc   expect app clone to start.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityClone_0900', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_StartAbilityClone_0900`;
      console.log(`${tag}, it begin`);

      createAppClone();
      await sleep(1000);

      let subscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
        events: ['start_appClone_0900']
      };
      let subscriber = CommonEventManager.createSubscriberSync(subscribeInfo);
      let subscribeCB = (err: BusinessError, data: CommonEventManager.CommonEventData) => {
        if (err) {
          console.error(`receive event failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        } else {
          console.info(`receive event success, event:${data.event}`);
          if (data.event == 'start_appClone_0900') {
            expect(data.parameters["appCloneIndex"]).assertEqual(appCloneIndex);

            uninstallAppClone();
            unSubscribe(subscriber, done);
          }
        }
      }
      CommonEventManager.subscribe(subscriber, subscribeCB);

      let want: Want = {
        bundleName: appCloneBundleName,
        abilityName: 'EntryAbility',
        parameters: {
          [wantConstant.Params.APP_CLONE_INDEX_KEY]: appCloneIndex,
          testCase: 900
        }
      }
      try {
        AppStorage.get<common.UIAbilityContext>("testAbilityContext").startAbilityByCall(want).then((caller) => {
          console.info('startAbilityByCall succeed');
        }).catch((err: BusinessError) => {
          console.error(`startAbilityByCall failed, cause: ${JSON.stringify(err)}`);
        });
      } catch (err) {
        console.error(`${tag} error, errorCode: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityClone_1000
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityClone_1000
     * @tc.desc   expect app clone to start.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityClone_1000', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let tag = `SUB_Ability_AbilityRuntime_StartAbilityClone_1000`;
      console.log(`${tag}, it begin`);

      let maxAppCloneIndex: number = 1000;
      let want: Want = {
        bundleName: appCloneBundleName,
        abilityName: 'EntryAbility',
        parameters: {
          [wantConstant.Params.APP_CLONE_INDEX_KEY]: maxAppCloneIndex
        }
      }
      try {
        AppStorage.get<common.UIAbilityContext>("testAbilityContext").startAbilityByCall(want).then((caller) => {
          console.info('startAbilityByCall succeed');
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`startAbilityByCall failed, cause: ${JSON.stringify(err)}`);
          let expectErrCode = 16000001;
          expect(err.code).assertEqual(expectErrCode);
          done();
        });
      } catch (err) {
        console.error(`${tag} error, errorCode: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityClone_1100
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityClone_1100
     * @tc.desc   expect app clone to start.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityClone_1100', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_StartAbilityClone_1100`;
      console.log(`${tag}, it begin`);

      createAppClone();
      await sleep(1000);

      let subscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
        events: ['start_appClone_1100']
      };
      let subscriber = CommonEventManager.createSubscriberSync(subscribeInfo);
      let subscribeCB = (err: BusinessError, data: CommonEventManager.CommonEventData) => {
        if (err) {
          console.error(`receive event failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        } else {
          console.info(`receive event success, event:${data.event}`);
          if (data.event == 'start_appClone_1100') {
            expect(data.parameters["appCloneIndex"]).assertEqual(appCloneIndex);

            uninstallAppClone();
            unSubscribe(subscriber, done);
          }
        }
      }
      CommonEventManager.subscribe(subscriber, subscribeCB);

      let want: Want = {
        bundleName: appCloneBundleName,
        abilityName: 'EntryAbility',
        parameters: {
          [wantConstant.Params.APP_CLONE_INDEX_KEY]: appCloneIndex,
          testCase: 1100
        }
      }
      try {
        AppStorage.get<common.UIAbilityContext>("testAbilityContext").startAbilityByCallWithAccount(want, 100).then((caller) => {
          console.info(`${tag} startAbilityByCallWithAccount succeed`);
        }).catch((err: BusinessError) => {
          console.error(`${tag} startAbilityByCallWithAccount failed, cause: ${JSON.stringify(err)}`);
        });
      } catch (err) {
        console.error(`${tag} error, errorCode: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityClone_1200
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityClone_1200
     * @tc.desc   expect app clone to start.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityClone_1200', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let tag = `SUB_Ability_AbilityRuntime_StartAbilityClone_1200`;
      console.log(`${tag}, it begin`);

      let maxAppCloneIndex: number = 1000;
      let want: Want = {
        bundleName: appCloneBundleName,
        abilityName: 'EntryAbility',
        parameters: {
          [wantConstant.Params.APP_CLONE_INDEX_KEY]: maxAppCloneIndex
        }
      }
      try {
        AppStorage.get<common.UIAbilityContext>("testAbilityContext").startAbilityByCallWithAccount(want, 100).then(() => {
          console.info('startAbilityByCallWithAccount succeed');
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`startAbilityByCallWithAccount failed, cause: ${JSON.stringify(err)}`);
          let expectErrCode = 16000001;
          expect(err.code).assertEqual(expectErrCode);
          done();
        });
      } catch (err) {
        console.error(`${tag} error, errorCode: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityClone_1300
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityClone_1300
     * @tc.desc   expect app clone to start.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityClone_1300', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_StartAbilityClone_1300`;
      console.log(`${tag}, it begin`);

      createAppClone();
      await sleep(1000);

      let subscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
        events: ['start_appClone_1300']
      };
      let subscriber = CommonEventManager.createSubscriberSync(subscribeInfo);
      let subscribeCB = (err: BusinessError, data: CommonEventManager.CommonEventData) => {
        if (err) {
          console.error(`receive event failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        } else {
          console.info(`receive event success, event:${data.event}`);
          if (data.event == 'start_appClone_1300') {
            expect(data.parameters["appCloneIndex"]).assertEqual(appCloneIndex);

            uninstallAppClone();
            unSubscribe(subscriber, done);
          }
        }
      }
      CommonEventManager.subscribe(subscriber, subscribeCB);

      let want: Want = {
        bundleName: appCloneBundleName,
        abilityName: 'EntryAbility',
        parameters: {
          [wantConstant.Params.APP_CLONE_INDEX_KEY]: appCloneIndex,
          testCase: 1300
        }
      }
      try {
        AppStorage.get<common.UIAbilityContext>("testAbilityContext").startAbilityWithAccount(want, 100).then((caller) => {
          console.info('startAbilityWithAccount succeed');
        }).catch((err: BusinessError) => {
          console.error(`startAbilityWithAccount failed, cause: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.error(`${tag} error, errorCode: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityClone_1400
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityClone_1400
     * @tc.desc   expect app clone to start.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityClone_1400', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let tag = `SUB_Ability_AbilityRuntime_StartAbilityClone_1400`;
      console.log(`${tag}, it begin`);

      let maxAppCloneIndex: number = 1000;
      let want: Want = {
        bundleName: appCloneBundleName,
        abilityName: 'EntryAbility',
        parameters: {
          [wantConstant.Params.APP_CLONE_INDEX_KEY]: maxAppCloneIndex
        }
      }
      try {
        AppStorage.get<common.UIAbilityContext>("testAbilityContext").startAbilityWithAccount(want, 100).then(() => {
          console.info('startAbilityWithAccount succeed');
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`startAbilityWithAccount failed, cause: ${JSON.stringify(err)}`);
          let expectErrCode = 16000001;
          expect(err.code).assertEqual(expectErrCode);
          done();
        });
      } catch (err) {
        console.error(`${tag} error, errorCode: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityClone_1500
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityClone_1500
     * @tc.desc   expect app clone to start.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityClone_1500', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_StartAbilityClone_1500`;
      console.log(`${tag}, it begin`);

      createAppClone();
      await sleep(1000);

      let subscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
        events: ['start_appClone_1500']
      };
      let subscriber = CommonEventManager.createSubscriberSync(subscribeInfo);
      let subscribeCB = (err: BusinessError, data: CommonEventManager.CommonEventData) => {
        if (err) {
          console.error(`receive event failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        } else {
          console.info(`receive event success, event:${data.event}`);
          if (data.event == 'start_appClone_1500') {
            expect(data.parameters["appCloneIndex"]).assertEqual(appCloneIndex);

            uninstallAppClone();
            unSubscribe(subscriber, done);
          }
        }
      }
      CommonEventManager.subscribe(subscriber, subscribeCB);

      let want: Want = {
        bundleName: appCloneBundleName,
        abilityName: 'EntryAbility',
        parameters: {
          [wantConstant.Params.APP_CLONE_INDEX_KEY]: appCloneIndex,
          testCase: 1500
        }
      }
      try {
        AppStorage.get<common.UIAbilityContext>("testAbilityContext").startAbilityForResult(want).then((data) => {
          console.info('startAbilityForResult succeed');
        }).catch((err: BusinessError) => {
          console.error(`startAbilityForResult failed, cause: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.error(`${tag} error, errorCode: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityClone_1600
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityClone_1600
     * @tc.desc   expect app clone to start.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityClone_1600', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let tag = `SUB_Ability_AbilityRuntime_StartAbilityClone_1600`;
      console.log(`${tag}, it begin`);

      let maxAppCloneIndex: number = 1000;
      let want: Want = {
        bundleName: appCloneBundleName,
        abilityName: 'EntryAbility',
        parameters: {
          [wantConstant.Params.APP_CLONE_INDEX_KEY]: maxAppCloneIndex
        }
      }
      try {
        AppStorage.get<common.UIAbilityContext>("testAbilityContext").startAbilityForResult(want).then((data) => {
          console.info('startAbilityForResult succeed');
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`startAbilityForResult failed, cause: ${JSON.stringify(err)}`);
          let expectErrCode = 16000001;
          expect(err.code).assertEqual(expectErrCode);
          done();
        });
      } catch (err) {
        console.error(`${tag} error, errorCode: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityClone_1700
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityClone_1700
     * @tc.desc   expect app clone to start.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityClone_1700', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_StartAbilityClone_1700`;
      console.log(`${tag}, it begin`);

      createAppClone();
      await sleep(1000);

      let subscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
        events: ['start_appClone_1700']
      };
      let subscriber = CommonEventManager.createSubscriberSync(subscribeInfo);
      let subscribeCB = (err: BusinessError, data: CommonEventManager.CommonEventData) => {
        if (err) {
          console.error(`receive event failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        } else {
          console.info(`receive event success, event:${data.event}`);
          if (data.event == 'start_appClone_1700') {
            expect(data.parameters["appCloneIndex"]).assertEqual(appCloneIndex);

            uninstallAppClone();
            unSubscribe(subscriber, done);
          }
        }
      }
      CommonEventManager.subscribe(subscriber, subscribeCB);

      let want: Want = {
        bundleName: appCloneBundleName,
        abilityName: 'EntryAbility',
        parameters: {
          [wantConstant.Params.APP_CLONE_INDEX_KEY]: appCloneIndex,
          testCase: 1700
        }
      }
      try {
        AppStorage.get<common.UIAbilityContext>("testAbilityContext").startAbilityForResultWithAccount(want, 100).then((data) => {
          console.info('startAbilityForResultWithAccount succeed');
        }).catch((err: BusinessError) => {
          console.error(`startAbilityForResultWithAccount failed, cause: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.error(`${tag} error, errorCode: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityClone_1800
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityClone_1800
     * @tc.desc   expect app clone to start.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityClone_1800', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let tag = `SUB_Ability_AbilityRuntime_StartAbilityClone_1800`;
      console.log(`${tag}, it begin`);

      let maxAppCloneIndex: number = 1000;
      let want: Want = {
        bundleName: appCloneBundleName,
        abilityName: 'EntryAbility',
        parameters: {
          [wantConstant.Params.APP_CLONE_INDEX_KEY]: maxAppCloneIndex
        }
      }
      try {
        AppStorage.get<common.UIAbilityContext>("testAbilityContext").startAbilityForResultWithAccount(want, 100).then(() => {
          console.info('startAbilityForResultWithAccount succeed');
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`startAbilityForResultWithAccount failed, cause: ${JSON.stringify(err)}`);
          let expectErrCode = 16000001;
          expect(err.code).assertEqual(expectErrCode);
          done();
        });
      } catch (err) {
        console.error(`${tag} error, errorCode: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityClone_1900
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityClone_1900
     * @tc.desc   expect app clone to start.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityClone_1900', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_StartAbilityClone_1900`;
      console.log(`${tag}, it begin`);

      createAppClone();
      await sleep(1000);

      let subscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
        events: ['start_appClone_1900']
      };
      let subscriber = CommonEventManager.createSubscriberSync(subscribeInfo);
      let subscribeCB = (err: BusinessError, data: CommonEventManager.CommonEventData) => {
        if (err) {
          console.error(`receive event failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        } else {
          console.info(`receive event success, event:${data.event}`);
          if (data.event == 'start_appClone_1900') {
            expect(data.parameters["appCloneIndex"]).assertEqual(appCloneIndex);

            uninstallAppClone();
            unSubscribe(subscriber, done);
          }
        }
      }
      CommonEventManager.subscribe(subscriber, subscribeCB);

      let want: Want = {
        bundleName: appCloneBundleName,
        abilityName: 'EntryAbility',
        parameters: {
          [wantConstant.Params.APP_CLONE_INDEX_KEY]: appCloneIndex,
          testCase: 1900
        }
      }
      try {
        AppStorage.get<common.UIAbilityContext>("testAbilityContext").startRecentAbility(want).then((data) => {
          console.info('startRecentAbility succeed');
        }).catch((err: BusinessError) => {
          console.error(`startRecentAbility failed, cause: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.error(`${tag} error, errorCode: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityClone_2000
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityClone_2000
     * @tc.desc   expect app clone to start.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityClone_2000', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let tag = `SUB_Ability_AbilityRuntime_StartAbilityClone_2000`;
      console.log(`${tag}, it begin`);

      let maxAppCloneIndex: number = 1000;
      let want: Want = {
        bundleName: appCloneBundleName,
        abilityName: 'EntryAbility',
        parameters: {
          [wantConstant.Params.APP_CLONE_INDEX_KEY]: maxAppCloneIndex
        }
      }
      try {
        AppStorage.get<common.UIAbilityContext>("testAbilityContext").startRecentAbility(want).then(() => {
          console.info('startRecentAbility succeed');
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`startRecentAbility failed, cause: ${JSON.stringify(err)}`);
          let expectErrCode = 16000001;
          expect(err.code).assertEqual(expectErrCode);
          done();
        });
      } catch (err) {
        console.error(`${tag} error, errorCode: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ProcessInformation_0100
     * @tc.number SUB_Ability_AbilityRuntime_ProcessInformation_0100
     * @tc.desc   expect app clone to start.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ProcessInformation_0100', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ProcessInformation_0100`;
      console.log(`${tag}, it begin`);

      createAppClone();
      await sleep(1000);

      let subscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
        events: ['process_information_0100']
      };
      let subscriber = CommonEventManager.createSubscriberSync(subscribeInfo);
      let subscribeCB = (err: BusinessError, data: CommonEventManager.CommonEventData) => {
        if (err) {
          console.error(`receive event failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        } else {
          console.info(`receive event success, event:${data.event}`);
          if (data.event == 'process_information_0100') {
            uninstallAppClone();
            unSubscribe(subscriber, done);
          }
        }
      }
      CommonEventManager.subscribe(subscriber, subscribeCB);

      let want: Want = {
        bundleName: appCloneBundleName,
        abilityName: 'EntryAbility',
        parameters: {
          [wantConstant.Params.APP_CLONE_INDEX_KEY]: appCloneIndex,
          testCase: 5100
        }
      }
      try {
        AppStorage.get<common.UIAbilityContext>("testAbilityContext").startAbility(want).then(() => {
          console.info('startAbility succeed');
        }).catch((err: BusinessError) => {
          console.error(`startRecentAbility failed, cause: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.error(`${tag} error, errorCode: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });
  })
}

function createAppClone() {
  installer.getBundleInstaller().then((bundleInstaller) => {
    bundleInstaller.createAppClone(appCloneBundleName, paramForCreatingAppClone).then((appIndex: number) => {
      console.info(`app clone was created, appIndex: ${appIndex}`);
    }).catch((err: BusinessError) => {
      console.error(`create app clone failed, cause: ${JSON.stringify(err)}`);
    });
  });
}

function uninstallAppClone() {
  installer.getBundleInstaller().then((bundleInstaller) => {
    bundleInstaller.destroyAppClone(appCloneBundleName, appCloneIndex, 100).then(() => {
      console.info(`destroyAppClone success`);
    }).catch((err: BusinessError) => {
      console.error(`destroyAppClone failed, cause: ${JSON.stringify(err)}`);
    });
  })
}

function unSubscribe(subscriber: CommonEventManager.CommonEventSubscriber, callback: Function) {
  let unSubscribeCB = (err: BusinessError) => {
    if (err) {
      console.error(`unsubscribe failed, code is ${err.code}, message is ${err.message}`);
    } else {
      console.info("unsubscribe success");
    }
    callback();
  };
  CommonEventManager.unsubscribe(subscriber, unSubscribeCB);
}

async function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(resolve, time)
  });
}